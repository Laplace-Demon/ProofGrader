From lib Require Import ExplicitName.
From lib Require Import Lang.

Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.


(* matching algorithms for applying definitions, theorems and properties *)

Fixpoint term_match_allowing_mistake (t1: term) (t2: term_pattern) (binded: list VarName.t) (res: list (TermVarName.t * term)): option (list (TermVarName.t * term)) :=
  match t1, t2 with
  | TUnOp u1 t1, TPUnOp u2 t2 =>
      if TERM.UnOp_eqb u1 u2
      then term_match_allowing_mistake t1 t2 binded res
      else None
  | TBinOp b1 t11 t12, TPBinOp b2 t21 t22 =>
      if TERM.BinOp_eqb b1 b2
      then match term_match_allowing_mistake t11 t21 binded res with
           | Some res' => term_match_allowing_mistake t12 t22 binded res'
           | None => None
           end
      else None
  | TApply t11 t12, TPApply t21 t22 =>
      match term_match_allowing_mistake t11 t21 binded res with
      | Some res' => term_match_allowing_mistake t12 t22 binded res'
      | None => None
      end
  | TBinder b1 x1 t11, TPBinder b2 x2 t21 =>
      term_match_allowing_mistake (subst_term t11 ((x1, TVar x2) :: nil)) t21 (x2 :: binded) res
  | _, TPTVar x =>
      if existsb (fun x => freely_occur_term x t1) binded
      then None
      else match TERM_PM.look_up res x with
           | Some t1' => if term_eqb t1 t1'
                         then Some res
                         else None
           | None => Some ((x, t1) :: res)
           end
  | _, _ => Some res
  end.

Fixpoint prop_match_ignoring_quantifiers (p: prop) (pp: prop_pattern) (binded: list VarName.t) (res: list (TermVarName.t * term)) (fuel: nat): option subst_task :=
  match fuel with
  | O => Some res
  | S fuel' =>
  match p, pp with
  | PUnPred u1 t11, PPUnPred u2 t21 =>
      if PROP.UnOp_eqb u1 u2
      then term_match_allowing_mistake t11 t21 binded res
      else None
  | PBinPred b1 t11 t12, PPBinPred b2 t21 t22 =>
      if PROP.BinOp_eqb b1 b2
      then match term_match_allowing_mistake t11 t21 binded res with
           | Some res' => term_match_allowing_mistake t12 t22 binded res'
           | None => None
           end
      else None
  | PUnOp u1 P1, PPUnOp u2 P2 =>
      if PROP.UniConnect_eqb u1 u2
      then prop_match_ignoring_quantifiers P1 P2 binded res fuel'
      else None

  | PBinOp PROP.CImpl P11 P12, P2 =>
      prop_match_ignoring_quantifiers P12 P2 binded res fuel'
  | P1, PPBinOp PROP.CImpl P21 P22 =>
      prop_match_ignoring_quantifiers P1 P22 binded res fuel'

  | PBinOp b1 P11 P12, PPBinOp b2 P21 P22 =>
      if PROP.BinConnect_eqb b1 b2
      then match prop_match_ignoring_quantifiers P11 P21 binded res fuel' with
           | Some res' => prop_match_ignoring_quantifiers P12 P22 binded res' fuel'
           | None => None
           end
      else None
  | PQuant q1 x1 P11, P2 =>
      prop_match_ignoring_quantifiers P11 P2 (x1 :: binded) res fuel'
  | P1, PPQuant q2 x2 P21 =>
      prop_match_ignoring_quantifiers P1 P21 (x2 :: binded) res fuel'
  | _, _ => None
  end
  end.

  (* p1 -> p2 *)

Fixpoint prop_eqb_allowing_quantifiers_helper (pg: proof_goal) (p1 p2: prop) (fuel: nat): bool :=
  match fuel with
  | O => false
  | S fuel' =>
  match p1, p2 with
  | PLongOrder o1 t1 p11, PLongOrder o2 t2 p21 => PROP.ROrder_eqb o1 o2 && term_eqb t1 t2 && prop_eqb_allowing_quantifiers_helper pg p11 p21 fuel'
  | PUnPred u1 t1, PUnPred u2 t2 => PROP.UnOp_eqb u1 u2 && term_eqb t1 t2
  | PBinPred b1 t11 t12, PBinPred b2 t21 t22 => PROP.BinOp_eqb b1 b2 && term_eqb t11 t21 && term_eqb t12 t22
  | PCBinPred b1 t11 t12 _, PCBinPred b2 t21 t22 _ => PROP.BinOp_eqb b1 b2 && term_eqb t11 t21 && term_eqb t12 t22
  | PUnOp u1 p11, PUnOp u2 p21 => PROP.UniConnect_eqb u1 u2 && prop_eqb_allowing_quantifiers_helper pg p11 p21 fuel'
  | _, _ =>
      let possibility1 :=
          match p1, p2 with
          | PQuant q1 x1 p11, PQuant q2 x2 p21 => andb (PROP.Quant_eqb q1 q2) (prop_eqb_allowing_quantifiers_helper pg p11 (subst_prop p21 ((x2, TVar x1) :: nil)) fuel')
          | _, _ => true
          end in
      let possibility2 :=
          match p1, p2 with
          | PQuant PROP.QForall x1 p11, p21 =>
              let p11' := p2pp_with_var p11 x1 in
              prop_match_allowing_quantifiers_left pg p11' p21 fuel'
          | _, _ => false
          end in
      let possibility3 :=
          match p1, p2 with
          | p11, PQuant PROP.QExists x2 p21 =>
              let p21' := p2pp_with_var p21 x2 in
              prop_match_allowing_quantifiers_right pg p11 p21' fuel'
          | _, _ => false
          end in
      let possibility31 :=
          match p1, p2 with
          | PQuant PROP.QExists x1 p11, p21 =>
              if list_in VarName.eqb (freely_occurs_in_proof_goal pg) x1 then false
              else let p11' := p2pp_with_var p11 x1 in
                   prop_match_allowing_quantifiers_left pg p11' p21 fuel'
          | _, _ => false
          end in
      let possibility4 :=
          match p1, p2 with
          | PBinOp b1 p11 p12, PBinOp b2 p21 p22 =>
              andb (PROP.BinConnect_eqb b1 b2) (andb (prop_eqb_allowing_quantifiers_helper pg p11 p21 fuel') (prop_eqb_allowing_quantifiers_helper pg p12 p22 fuel'))
          | _, _ => false
          end in
      let possibility5 :=
          match p1, p2 with
          | PBinOp PROP.CImpl p11 p12, p21 =>
              if prop_in_proof_goal pg p11 then prop_eqb_allowing_quantifiers_helper pg p12 p21 fuel' else false
          | _, _ => false
          end in
      let possibility6 :=
          match p1, p2 with
          | p12, PBinOp PROP.CImpl p21 p22 =>
              if prop_in_proof_goal pg p21 then prop_eqb_allowing_quantifiers_helper pg p12 p22 fuel' else false
          | _, _ => false
          end in
      possibility1 || possibility2 || possibility3 || possibility31 || possibility4 || possibility5 || possibility6
  end
  end

with prop_match_allowing_quantifiers_left (pg: proof_goal) (pp: prop_pattern) (p: prop) (fuel: nat): bool :=
  match fuel with
  | O => false
  | S fuel' =>
  match prop_match_ignoring_quantifiers p pp nil nil fuel' with
  | Some res =>
      let p' := TERM_PM.pattern_subst_prop pp res nil in
      prop_eqb_allowing_quantifiers_helper pg p' p fuel'
  | None => false
  end
  end

with prop_match_allowing_quantifiers_right (pg: proof_goal) (p: prop) (pp: prop_pattern) (fuel: nat): bool :=
  match fuel with
  | O => false
  | S fuel' =>
  match prop_match_ignoring_quantifiers p pp nil nil fuel' with
  | Some res =>
      let p' := TERM_PM.pattern_subst_prop pp res nil in
      prop_eqb_allowing_quantifiers_helper pg p p' fuel'
  | None => false
  end
  end.

Definition prop_eqb_allowing_quantifiers (pg: proof_goal) (p1 p2: prop) : bool :=
  prop_eqb_allowing_quantifiers_helper pg p1 p2 1000.

Definition prop_match_allowing_quantifiers (pg: proof_goal) (pp: prop_pattern) (p: prop): option subst_task :=
  match prop_match_ignoring_quantifiers p pp nil nil 1000 with
  | Some res =>
      if prop_match_allowing_quantifiers_left pg pp p 1000 then Some res else None
  | None => None
  end.

Definition prop_in_proof_goal_allowing_quantifiers (pg: proof_goal) (p: prop): bool :=
  let assu := map (fun x => snd x) pg.(assu) in
  list_in (fun x y => prop_eqb_allowing_quantifiers pg x y) assu p.

(* The database for definitions, theorems and properties *)

Module TriIdentities.

Definition tri_identity_1 : term_pattern * term_pattern :=
  (TPUnOp TERM.RCos (TPBinOp TERM.RMinus (TPConst TERM.RPi) (TPTVar "x")), TPUnOp TERM.RCos (TPTVar "x")).

Definition tri_identity_2 : term_pattern * term_pattern :=
  (TPUnOp TERM.RSin (TPBinOp TERM.RPlus (TPTVar "x") (TPTVar "y")), TPBinOp TERM.RPlus (TPBinOp TERM.RMult (TPUnOp TERM.RSin (TPTVar "x")) (TPUnOp TERM.RCos (TPTVar "y"))) (TPBinOp TERM.RMult (TPUnOp TERM.RCos (TPTVar "x")) (TPUnOp TERM.RSin (TPTVar "y")))).

Definition tri_identity_3 : term_pattern * term_pattern :=
  (TPUnOp TERM.RSin (TPBinOp TERM.RMinus (TPTVar "x") (TPTVar "y")), TPBinOp TERM.RMinus (TPBinOp TERM.RMult (TPUnOp TERM.RSin (TPTVar "x")) (TPUnOp TERM.RCos (TPTVar "y"))) (TPBinOp TERM.RMult (TPUnOp TERM.RCos (TPTVar "x")) (TPUnOp TERM.RSin (TPTVar "y")))).

Definition tri_identity_4 : term_pattern * term_pattern :=
  (TPUnOp TERM.RSin (TPBinOp TERM.RMult (TPNum 2) (TPTVar "x")), TPBinOp TERM.RMult (TPBinOp TERM.RMult (TPNum 2) (TPUnOp TERM.RSin (TPTVar "x"))) (TPUnOp TERM.RCos (TPTVar "x"))).

Definition tri_identity_5 : term_pattern * term_pattern :=
  (TPBinOp TERM.RPower (TPUnOp TERM.RCos (TPTVar "x")) (TPNum 2), TPBinOp TERM.RMinus (TPNum 1) (TPBinOp TERM.RPower (TPUnOp TERM.RSin (TPTVar "x")) (TPNum 2))).

Definition tri_identity_6 : term_pattern * term_pattern :=
  (TPUnOp TERM.RCos (TPBinOp TERM.RMult (TPNum 2) (TPTVar "x")), TPBinOp TERM.RMinus (TPNum 1) (TPBinOp TERM.RMult (TPNum 2) (TPBinOp TERM.RPower (TPUnOp TERM.RSin (TPTVar "x")) (TPNum 2)))).

Definition tri_identity_7 : term_pattern * term_pattern := (* identity4 *)
  (TPBinOp TERM.RDiv (TPUnOp TERM.RSin (TPBinOp TERM.RMult (TPNum 2) (TPTVar "x"))) (TPNum 2), TPBinOp TERM.RMult (TPUnOp TERM.RSin (TPTVar "x")) (TPUnOp TERM.RCos (TPTVar "x"))).

Definition tri_identities := tri_identity_1 :: tri_identity_2 :: tri_identity_3 :: tri_identity_4 :: tri_identity_5 :: tri_identity_6 :: tri_identity_7 :: nil.

End TriIdentities.

(* Definitions *)
Definition definition : Type := prop_pattern * prop_pattern.

Module Definitions.

Definition SG_Average_statement: term_pattern * term_pattern :=
  (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "y"),
   TPBinOp TERM.RDiv
     (TPBinOp TERM.RPlus
       (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "x"))
       (TPBinOp TERM.RMult (TPTVar "y") (TPTVar "y")))
     (TPNum 2)).

Definition SG_Average_definitions := SG_Average_statement :: nil.

Definition LimitDef_statement: definition :=
  (PPBinPred PROP.REq (TPUnOp TERM.SeqLimit (TPTVar "x")) (TPTVar "y"),
   PPQuant PROP.QForall "eps"
     (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
       (PPQuant PROP.QExists "N"
         (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
             (PPBinPred PROP.RLe
               (TPUnOp TERM.RAbs
                 (TPBinOp TERM.RMinus (TPApply (TPTVar "x") (TPVar "n")) (TPTVar "y")))
               (TPVar "eps"))))))).

Definition LimitDef_statement_2: definition :=
  (PPBinPred PROP.REq (TPUnOp TERM.SeqLimit (TPTVar "x")) (TPTVar "y"),
   PPQuant PROP.QForall "eps"
     (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
       (PPQuant PROP.QExists "N"
         (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
             (PPLongOrder PROP.RLe (TPBinOp TERM.RMinus (TPTVar "y")(TPVar "eps"))
             (PPBinPred PROP.RLe
             (TPBinOp TERM.RMinus (TPApply (TPTVar "x") (TPVar "n")) (TPTVar "y")) 
               (TPBinOp TERM.RPlus (TPTVar "y")(TPVar "eps"))))))))).

(* 数列的极限 *)
Definition LimitDef_statement_array_1: definition :=
  (PPBinPred PROP.REq (TPBinOp TERM.RLim (TPInfty TERM.Positive_Infty) (TPBinder TERM.LambdaB "n" (TPApply (TPTVar "a") (TPVar "n")))) (TPTVar "A"),
  PPQuant PROP.QForall "epsilon"
  (PPBinOp PROP.CImpl
     (PPBinPred PROP.RGt (TPVar "epsilon") (TPNum 0))
     (PPQuant PROP.QExists "N"
        (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl
              (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
                 (PPBinPred PROP.RLt
                    (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "a") (TPVar "n")) (TPTVar "A")))
                      (TPVar "epsilon"))))))).

Definition LimitDef_statement_array_2: definition :=
  (PPBinPred PROP.REq (TPBinOp TERM.RLim (TPInfty TERM.Positive_Infty) (TPBinder TERM.LambdaB "n" (TPApply (TPTVar "a") (TPVar "n")))) (TPTVar "A"),
  PPQuant PROP.QForall "epsilon"
  (PPBinOp PROP.CImpl
     (PPBinPred PROP.RGt (TPVar "epsilon") (TPNum 0))
     (PPQuant PROP.QExists "N"
        (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl
              (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
                 (PPLongOrder PROP.RLt
                    (TPBinOp TERM.RMinus (TPTVar "A") (TPVar "epsilon"))
                       (PPBinPred PROP.RLt (TPApply (TPTVar "a") (TPVar "n"))
                          (TPBinOp TERM.RPlus (TPTVar "A") (TPVar "epsilon"))))))))).

Definition LimitDef_statement_array_3: definition :=
  (PPBinPred PROP.REq (TPBinOp TERM.RLim (TPInfty TERM.Positive_Infty) (TPBinder TERM.LambdaB "n" (TPApply (TPTVar "a") (TPVar "n")))) (TPTVar "A"),
  PPQuant PROP.QForall "epsilon"
  (PPBinOp PROP.CImpl
     (PPBinPred PROP.RGt (TPVar "epsilon") (TPNum 0))
     (PPQuant PROP.QExists "N"
        (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl
              (PPBinPred PROP.RGe (TPVar "n") (TPVar "N"))
                 (PPBinPred PROP.RLt
                    (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "a") (TPVar "n")) (TPTVar "A")))
                      (TPVar "epsilon"))))))).

(*函数在某点的极限*)
Definition LimitDef_statement_fun_x: definition :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "x0") ((TPTVar "fx"))) (TPTVar "y")),
  PPQuant PROP.QForall "eps"
    (PPBinOp PROP.CImpl  (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
      (PPQuant PROP.QExists "delta"
       (PPQuant PROP.QForall "m"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "m")(TPTVar "x0"))) (TPVar "delta"))
         (PPBinPred PROP.RLt
           (TPUnOp TERM.RAbs
           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "m")) (TPTVar "y"))) 
           (TPVar "eps"))) )))).

(*函数在正无穷的极限*)
Definition LimitDef_statement_fun_pos_infty: definition :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "x0") ((TPTVar "fx"))) (TPTVar "y")),
  PPQuant PROP.QForall "eps"
    (PPBinOp PROP.CImpl  (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
      (PPQuant PROP.QExists "M"
       (PPQuant PROP.QForall "m"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "m") (TPVar "M"))
         (PPBinPred PROP.RLe
           (TPUnOp TERM.RAbs
           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "m")) (TPTVar "y"))) 
           (TPVar "eps"))) )))).

(*函数在负无穷处的极限*)
Definition LimitDef_statement_fun_neg_infty: definition :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "x0") (TPBinder TERM.LambdaB "x" (TPTVar "fx"))) (TPTVar "y")),
  PPQuant PROP.QForall "eps"
    (PPBinOp PROP.CImpl  (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
      (PPQuant PROP.QExists "M"
       (PPQuant PROP.QForall "m"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPVar "m") (TPVar "M"))
         (PPBinPred PROP.RLe
           (TPUnOp TERM.RAbs
           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "m")) (TPTVar "y"))) 
           (TPVar "eps"))) )))).

Definition LimitDef_statement_fun_infty: definition :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "x0") (TPBinder TERM.LambdaB "x" (TPTVar "fx"))) (TPTVar "y")),
  PPQuant PROP.QForall "eps"
    (PPBinOp PROP.CImpl  (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
      (PPQuant PROP.QExists "M"
       (PPQuant PROP.QForall "m"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPUnOp TERM.RAbs (TPVar "m")) (TPVar "M"))
         (PPBinPred PROP.RLe
           (TPUnOp TERM.RAbs
           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "m")) (TPTVar "y"))) 
           (TPVar "eps"))) )))).

Definition SeqLimit_definitions := LimitDef_statement_array_1 :: LimitDef_statement_array_2 :: LimitDef_statement_array_3 :: LimitDef_statement :: LimitDef_statement_2 :: LimitDef_statement_fun_x :: LimitDef_statement_fun_pos_infty :: LimitDef_statement_fun_neg_infty :: LimitDef_statement_fun_infty :: nil.

Definition SeqConvergence_statement_ordinary: definition :=
  (PPUnPred PROP.Convergent (TPTVar "a"),
  PPQuant PROP.QExists "l"
    (PPBinPred PROP.REq
      (TPBinOp TERM.RLim (TPInfty TERM.Positive_Infty) (TPBinder TERM.LambdaB "n" (TPApply (TPTVar "a") (TPVar "n")))) (TPVar "l"))).

Definition SeqConvergence_definitions := SeqConvergence_statement_ordinary :: nil.

Definition Continuity_x0_statement: definition := 
    (PPBinPred PROP.ContinueOn (TPTVar "fx") (TPVar "x0"),
     PPQuant PROP.QForall "eps"
       (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
         (PPQuant PROP.QExists "delta"
           (PPQuant PROP.QForall "x" 
             (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "x")(TPVar "x0"))) (TPVar "delta"))
              (PPBinPred PROP.RLt
                (TPUnOp TERM.RAbs
                (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "x")) (TPApply (TPTVar "fx") (TPVar "x0")))) 
                (TPVar "eps"))))))).

Definition Continuity_definitions := Continuity_x0_statement :: nil.

Definition UContinuity_statement: definition := 
    (PPBinPred PROP.UContinueOn (TPTVar "fx") (TPTVar "I"),
     PPQuant PROP.QForall "eps"
       (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
         (PPQuant PROP.QExists "delta"
           (PPQuant PROP.QForall "x1" 
              (PPQuant PROP.QForall "x2"
                 (PPBinOp PROP.CImpl (PPBinPred PROP.In (TPVar "x1") (TPTVar "I")) 
                   (PPBinOp PROP.CImpl (PPBinPred PROP.In (TPVar "x2") (TPTVar "I"))
                     (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "x1")(TPVar "x2"))) (TPVar "delta"))
                       (PPBinPred PROP.RLt
                         (TPUnOp TERM.RAbs
                           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "x1")) (TPApply (TPTVar "fx") (TPVar "x2")))) 
                             (TPVar "eps")))))))))).

Definition UContinuity_definitions := UContinuity_statement :: nil.

Definition Supremum_statement_fun_epsilon_delta: definition := 
    (PPBinPred PROP.REq (TPUnOp TERM.RSup (TPTVar "f")) (TPTVar "M"),
    PPQuant PROP.QForall "eps"
      (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
        (PPQuant PROP.QExists "n"
          (PPLongOrder PROP.RLt (TPBinOp TERM.RMinus (TPTVar "M") (TPVar "eps"))
            (PPBinPred PROP.RLe (TPApply (TPTVar "f") (TPVar "n")) (TPTVar "M")))))).

Definition Supremum_statement_adapted_to_example: definition := 
    (PPBinPred PROP.REq (TPTVar "M") (TPUnOp TERM.RSup (TPTVar "f")),
    PPQuant PROP.QForall "eps"
      (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
        (PPQuant PROP.QExists "n"
          (PPBinPred PROP.RGt (TPApply (TPTVar "f") (TPVar "n"))
            (TPBinOp TERM.RMinus (TPTVar "M") (TPVar "eps")))))).

Definition Supremum_definitions := Supremum_statement_fun_epsilon_delta :: Supremum_statement_adapted_to_example :: nil.

Definition Infimum_definitions : list definition := nil.

Definition Unique_definitions : list definition := nil.

Definition Bounded_definitions : list definition := nil.

Definition UpperBound_statement_fun: definition :=
  (PPBinPred PROP.BoundedAboveBy (TPTVar "f") (TPTVar "A"),
  PPQuant PROP.QForall "n"
    (PPBinPred PROP.RLt (TPApply (TPTVar "f") (TPVar "n")) (TPTVar "A"))).

Definition UpperBound_definitions := UpperBound_statement_fun :: nil.

Definition LowerBound_definitions : list definition :=  nil.

Definition MonoInc_statement: definition :=
    (PPUnPred PROP.MonoInc (TPTVar "f"),
    PPQuant PROP.QForall "a"
      (PPQuant PROP.QForall "b"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "a") (TPVar "b"))
          (PPBinPred PROP.RGt (TPApply (TPTVar "f") (TPVar "a")) (TPApply (TPTVar "f") (TPVar "b")))))).

Definition MonoInc_definitions := MonoInc_statement :: nil.

Definition MonoDec_definitions : list definition := nil.

Definition SMonoInc_definitions : list definition := nil.

Definition SMonoDec_definitions : list definition := nil.

Definition CauchySeq_statement: definition :=
    (PPUnPred PROP.CauchySeq (TPTVar "a"),
    PPQuant PROP.QForall "epsilon"
      (PPQuant PROP.QExists "N"
        (PPQuant PROP.QForall "n"
          (PPQuant PROP.QForall "m"
            (PPBinOp PROP.CImpl
              (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
                (PPBinOp PROP.CImpl
                  (PPBinPred PROP.RGt (TPVar "m") (TPVar "N"))
                    (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "a") (TPVar "n")) (TPApply (TPTVar "a") (TPVar "m")))) (TPVar "epsilon")))))))).

Definition CauchySeq_definitions : list definition := CauchySeq_statement :: nil.

Definition all_definitions := SeqLimit_definitions ++ SeqConvergence_definitions ++ Continuity_definitions ++ UContinuity_definitions ++ Supremum_definitions ++ Infimum_definitions ++ Unique_definitions ++ Bounded_definitions ++ UpperBound_definitions ++ LowerBound_definitions ++ MonoInc_definitions ++ MonoDec_definitions ++ SMonoInc_definitions ++ SMonoDec_definitions ++ CauchySeq_definitions.

End Definitions.

(* Theorems *)
Definition theorem: Type:= (list prop_pattern) * prop_pattern.

Module Theorems.

Definition SupremumAndInfimum_theorem: theorem :=
  ((PPUnPred PROP.BoundedAbove (TPTVar "f")) :: nil,
  PPQuant PROP.QExists "A"
    (PPBinPred PROP.REq (TPVar "A") (TPUnOp TERM.RSup (TPTVar "f")))).

Definition MonotoneConvergence_theorem: theorem :=
  ((PPUnPred PROP.BoundedAbove (TPTVar "a")) :: (PPUnPred PROP.MonoInc (TPTVar "a")) :: nil,
  PPUnPred PROP.Convergent (TPTVar "a")).

Definition BolzanoWeierstrass_theorem: theorem :=
  (PPUnPred PROP.Bounded (TPTVar "a") :: nil,
  PPQuant PROP.QExists "phi" (PPBinOp PROP.CAnd
    (PPBinPred PROP.IsSubseq (TPBinder TERM.LambdaB "k" (TPApply (TPTVar "a") (TPApply (TPVar "phi") (TPVar "k")))) (TPTVar "a"))
      (PPUnPred PROP.Convergent (TPBinder TERM.LambdaB "k" (TPApply (TPTVar "a") (TPApply (TPVar "phi") (TPVar "k"))))))).

Definition SupremumAndInfimum_theorems:= SupremumAndInfimum_theorem :: nil.

Definition MonotoneConvergence_theorems := MonotoneConvergence_theorem :: nil.

Definition BolzanoWeierstrass_theorems:= BolzanoWeierstrass_theorem :: nil.

End Theorems.

Module Inequalities.

Definition SG_Average_inequality_1 :=
  PPBinPred PROP.RLe (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "y")) (TPBinOp TERM.RDiv
  (TPBinOp TERM.RPlus (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "x"))
   (TPBinOp TERM.RMult (TPTVar "y") (TPTVar "y"))) 
  (TPNum 2)).

Definition SG_Average_inequality_2 :=
  PPBinPred PROP.RGe (TPBinOp TERM.RDiv
  (TPBinOp TERM.RPlus (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "x"))
   (TPBinOp TERM.RMult (TPTVar "y") (TPTVar "y"))) 
  (TPNum 2)) (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "y")).

Definition SG_Average_inequality_3 :=
  PPBinPred PROP.RGe (TPBinOp TERM.RPlus (TPTVar "x") (TPTVar "y"))
  (TPBinOp TERM.RMult (TPNum 2) (TPBinOp TERM.RSqrt (TPNum 2) (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "y")))).

Definition SG_Average_inequality_4 :=
  PPBinPred PROP.RGe (TPBinOp TERM.RDiv (TPBinOp TERM.RPlus (TPBinOp TERM.RPower (TPTVar "x") (TPNum 2)) (TPBinOp TERM.RPower (TPTVar "y") (TPNum 2))) (TPNum 2))
  (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "y")).

Definition SG_Average_inequalities : list theorem := (nil, SG_Average_inequality_1) :: (nil, SG_Average_inequality_2) :: (nil, SG_Average_inequality_3) :: (nil, SG_Average_inequality_4) :: nil.

End Inequalities.

(* Causes and consequences *)

Module CausalInference.

Definition causal_inference_monoinc := (PPUnPred PROP.MonoInc (TPTVar "a"), (PPQuant PROP.QForall "x" (PPQuant PROP.QForall "y" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "x") (TPVar "y")) (PPBinPred PROP.RGt (TPApply (TPTVar "a") (TPVar "x")) (TPApply (TPTVar "a") (TPVar "y"))))))).

Definition causal_inference_boundedaboveby := (PPBinPred PROP.BoundedAboveBy (TPTVar "a") (TPTVar "A"), PPQuant PROP.QForall "n" (PPBinPred PROP.RLt (TPApply (TPTVar "a") (TPVar "n")) (TPTVar "A"))).

Definition causal_inference_cauchyseqbound := (PPUnPred PROP.CauchySeq (TPTVar "a"), PPUnPred PROP.Bounded (TPTVar "a")).

Definition causal_inference_rules : list (prop_pattern * prop_pattern) := causal_inference_monoinc :: causal_inference_boundedaboveby :: causal_inference_cauchyseqbound :: Definitions.all_definitions.

End CausalInference.

(* Properties *)
Definition property : Type := prop_pattern * prop_pattern.

Module Properties.

Definition CauchySeqIsBounded: property :=
  (PPUnPred PROP.CauchySeq (TPTVar "a"),
   PPUnPred PROP.Bounded (TPTVar "a")).

Definition CauchySeqProperties := CauchySeqIsBounded :: nil.

End Properties.