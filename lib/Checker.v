From lib Require Import Lang.
From lib Require Import Theorems.
From lib Require Import Poly.
From lib Require Import Solver.
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
  | PCBinPred b1 t11 t12 cont1, PCBinPred b2 t21 t22 cont2 => PROP.BinOp_eqb b1 b2 && term_eqb t11 t21 && term_eqb t12 t22 && prop_cont_eqb cont1 cont2
  | PUnOp u1 p11, PUnOp u2 p21 => PROP.UniConnect_eqb u1 u2 && prop_eqb_allowing_quantifiers_helper pg p11 p21 fuel'
  | _, _ =>
      let possibility1 :=
          match p1, p2 with
          | PQuant q1 x1 p11, PQuant q2 x2 p21 => andb (PROP.Quant_eqb q1 q2) (prop_eqb_allowing_quantifiers_helper pg p11 (subst_prop p21 ((x2, TVar x1) :: nil)) fuel')
          | _, _ => false
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



(* Apply definition *)

Definition definition_match (pg: proof_goal) (pending: prop) (def: definition): bool :=
  let (left_pattern, right_pattern) := def in
  match prop_match_allowing_quantifiers pg right_pattern pending with
  | Some res =>
      let supposed_left_prop := TERM_PM.pattern_subst_prop left_pattern res nil in
      prop_in_proof_goal_allowing_quantifiers pg supposed_left_prop
  | None => false
  end.

Definition definition_apply (pg: proof_goal) (def: PROOF.Def) (p: prop): option (list prop):=
  let usable_definitions := (match def with
  | PROOF.SeqLimit => Definitions.SeqLimit_definitions
  | PROOF.Continuity => Definitions.Continuity_definitions
  | PROOF.UContinuity => Definitions.UContinuity_definitions
  | PROOF.UpperBound => Definitions.UpperBound_definitions
  | PROOF.LowerBound => Definitions.LowerBound_definitions
  | PROOF.Supremum => Definitions.Supremum_definitions
  | PROOF.Infimum => Definitions.Infimum_definitions
  | PROOF.MonoInc => Definitions.MonoInc_definitions
  | PROOF.MonoDec => Definitions.MonoDec_definitions
  | PROOF.SMonoInc => Definitions.SMonoInc_definitions
  | PROOF.SMonoDec => Definitions.SMonoDec_definitions
  | PROOF.CauchySeq => Definitions.CauchySeq_definitions
  end) in
  let all_usable_definitions := app usable_definitions (map (fun x => (snd x, fst x)) usable_definitions) in
  if existsb (definition_match pg p) all_usable_definitions then Some nil else None.

(* Apply theorem *)

Definition theorem_match (pg: proof_goal) (pending: prop) (thm: theorem): bool :=
  let (left_patterns, right_pattern) := thm in
  match prop_match_allowing_quantifiers pg right_pattern pending with
  | Some res =>
      let supposed_left_props := map (fun x => TERM_PM.pattern_subst_prop x res nil) left_patterns in
      forallb (fun x => prop_in_proof_goal_allowing_quantifiers pg x) supposed_left_props
  | None => false
  end.

Definition modify_theorem_with_hints (thm: PROOF.Thm) (hints: list term) (original_thm: theorem) := original_thm.

Definition theorem_apply (pg: proof_goal) (thm: PROOF.Thm) (p: prop) (hints: list term): option (list prop):=
  let usable_theorems := (match thm with
  | PROOF.AGAverage => nil
  | PROOF.SGAverage => nil
  | PROOF.Squeeze => nil
  | PROOF.SupremumAndInfimum => Theorems.SupremumAndInfimum_theorems
  | PROOF.MonoConvergence => nil
  | PROOF.BolzanoWeierstrass => Theorems.BolzanoWeierstrass_theorems
  end) in
  let modified_usable_theorems := map (modify_theorem_with_hints thm hints) usable_theorems in
  if existsb (theorem_match pg p) modified_usable_theorems then Some nil else None.

(* Apply cause and consequence *)

Definition causal_inference (pg: proof_goal) (cause conseq: prop): option (list prop):=
  let match_res := map (fun x => (prop_match_allowing_quantifiers pg (fst x) cause, prop_match_allowing_quantifiers pg (snd x) conseq)) CausalInference.causal_inference_rules in
  let successful_match := filter (fun x => match x with | (Some res1, Some res2) => eqb_of_list (fun y z => andb (VarName.eqb (fst y) (fst z)) (term_eqb (snd y) (snd z))) res1 res2 | _ => false end) match_res in
  match successful_match with | nil => None | _ => Some nil end.

(* Apply a property *)

Definition property_apply (pg: proof_goal) (def: PROOF.Def) (p: prop): option (list prop) :=
  None.

Import SYMBOLIC_CHECKER.

Fixpoint check_list_PBinPred (l :list prop) (pg : proof_goal) : list bool :=
  match l with 
  | nil => nil
  | p :: p' => if check_prop_by_solver 1000 list_solver pg p
                    then true :: check_list_PBinPred p' pg
             else false :: check_list_PBinPred p' pg
  end.

Module Quantifier.

Definition prop_remove_same_forall (P: prop) (var: VarName.t): prop :=
  match P with
  | PQuant PROP.QForall var' P1 => if VarName.eqb var var' then P1 else P
  | _ => P
  end.

Definition prop_weaker (P Q: prop): bool:= false.

Definition prop_remove_weaker_implication (P: prop) (cond: prop): prop :=
  match P with
  | PBinOp PROP.CImpl P1 P2 =>
      if prop_eqb P1 cond then P2
      else if prop_weaker P1 cond then P2
      else P
  | _ => P
  end.

Fixpoint quantifier_filter (pg: proof_goal) (P: prop): proof_goal * prop :=
  match P with
  | PQuant PROP.QForall x P1 =>
      let filtered_assu := map (fun y => (fst y, prop_remove_same_forall (snd y) x)) pg.(assu) in
      quantifier_filter {| assu := filtered_assu; concl := pg.(concl); cont := pg.(cont) |} P1
  | PBinOp PROP.CImpl P1 P2 =>
      let filtered_assu := map (fun y => (fst y, prop_remove_weaker_implication (snd y) P1)) pg.(assu) in
      quantifier_filter {| assu := filtered_assu; concl := pg.(concl); cont := pg.(cont) |} P2
  | _ => (pg, P)
  end.

Fixpoint quantifier_adder (P: prop): (prop -> prop) :=
  match P with
  | PQuant PROP.QForall x P1 => (fun y => PQuant PROP.QForall x ((quantifier_adder P1) y))
  | PBinOp PROP.CImpl P1 P2 => (fun x => PBinOp PROP.CImpl P1 ((quantifier_adder P2) x))
  | _ => (fun x => x)
  end.

End Quantifier.

(* 所有命题的验证其实都应在这里进行，不过目前只有部分 *)
(* TODO LongOrder 产生的子结论可能不止一个，所以以后要改成 list prop *)

Fixpoint check_prop (p: prop) (pg: proof_goal) (fuel: nat) : (list bool) * (list prop) :=
  match fuel with
  | O => (false :: nil, p :: nil)
  | S fuel' =>
    match p with
    | PBinPred _ _ _ =>
        match pg.(assu) with
        | hypo :: assu' =>
            if equ_trans pg (snd hypo) p
            then (true :: nil, p :: nil)
            else (check_list_PBinPred (p :: nil) pg, p :: nil)
        | nil => (check_list_PBinPred (p :: nil) pg, p :: nil)
        end
    | PLongOrder _ _ _ =>
        match LongOrder_deduction p with
        | Some (o, l, t1, t2) => (check_list_PBinPred l pg, (PBinPred o t1 t2) :: p :: nil)
        | None => (false :: nil, p :: nil)
        end
    | PQuant PROP.QForall _ _ | PBinOp PROP.CImpl _ _ =>
        let (pg', p') := Quantifier.quantifier_filter pg p in
        let quantifier_completor := Quantifier.quantifier_adder p in
        let (result, subconcl_without_quantifier) := check_prop p' pg' fuel' in
        (result, map quantifier_completor subconcl_without_quantifier)
    | _ => (check_list_PBinPred (p :: nil) pg, p :: nil)
    end
  end.

Definition SG_Average_statement: term_pattern * term_pattern :=
  (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "y"),
   TPBinOp TERM.RDiv
     (TPBinOp TERM.RPlus
       (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "x"))
       (TPBinOp TERM.RMult (TPTVar "y") (TPTVar "y")))
     (TPNum 2)).

Definition check_fwd_proof (pg : proof_goal) (PrF : PROOF.Fwd) (P : prop) : option (list prop) :=
  match PrF with
  | PROOF.FNoHint =>
      fwd_result (orb (match P with
      | PQuant PROP.QExists x P' =>
          match_in_list_prop (map (fun x => snd x) pg.(assu)) (p2pp_with_var P' x)
      | _ => false
      end) (check_concl_auto_R pg P || prop_in_list_prop (map (fun x => snd x) pg.(assu)) P))
  | PROOF.FAddEqn hs =>
      match hs with
      | nil => None
      | h :: hs0 => let oP := fold_left option_prop_sum
                                (map (get_prop_from_hyp_name pg) hs0)
                                (get_prop_from_hyp_name pg h) in
                    match oP with
                    | Some P' => fwd_result (check_concl_auto_with_hint_R P' P)
                    | _ => None
                    end
      end
  | PROOF.FSubEqn h1 h2 =>
      let oP := option_prop_diff
                  (get_prop_from_hyp_name pg h1)
                  (get_prop_from_hyp_name pg h2) in
      match oP with
      | Some P' => fwd_result (check_concl_auto_with_hint_R P' P)
      | _ => None
      end
  | PROOF.FAGAverage => None
  | PROOF.FSGAverage =>
      match P with
      | PBinPred PROP.RLe t1 t2 =>
          match TERM_PM.pattern_match_term_rec t1 (fst Definitions.SG_Average_statement) nil nil with
          | Some res => match TERM_PM.pattern_match_term_rec t2 (snd Definitions.SG_Average_statement) nil res with
                        | Some _ => Some nil
                        | _ => None
                        end
          | _ => None
          end
      | PBinPred PROP.RGe t2 t1 =>
          match TERM_PM.pattern_match_term_rec t1 (fst Definitions.SG_Average_statement) nil nil with
          | Some res => match TERM_PM.pattern_match_term_rec t2 (snd Definitions.SG_Average_statement) nil res with
                        | Some _ => Some nil
                        | _ => None
                        end
          | _ => None
          end
      | _ => None
      end
  | PROOF.FSqueezeTheorem =>
      squeeze_theorem pg P
  | PROOF.FEquTrans h1 =>
      match find_prop_in_proof_goal pg h1 with
      | Some P' => if equ_trans pg P P' then Some nil else None
      | None => None
      end
  | PROOF.FDeriBothTerms var =>
      match var with
      | Some var =>
          match pg.(assu) with
          | nil => None
          | hypo :: _ =>
              match snd hypo, P with
              | PBinPred PROP.REq tm11 tm12, PBinPred PROP.REq tm21 tm22 =>
                  match Deri.compute_deri var tm11, Deri.compute_deri var tm12 with
                  | Some tm11', Some tm12' =>
                      let tm11'' := term_lambda_remove tm11' in
                      let tm12'' := term_lambda_remove tm12' in
                      let tm21'' := term_lambda_remove tm21 in
                      let tm22'' := term_lambda_remove tm22 in
                      if andb (orb (term_eq_P tm11'' tm21'') (term_eq_R tm11'' tm21'')) (orb (term_eq_P tm12'' tm22'') (term_eq_R tm12'' tm22'')) then Some nil else None
                  | _, _ => None
                  end
              | _, _ => None
              end
          end
      | None => None
      end
  | PROOF.FTakeLimOnBothTerms var val =>
      match pg.(assu) with
      | nil => None
      | hypo :: _ =>
          match prop_take_lim (snd hypo) var val pg with
          | Some P' => if prop_eqb P P' then Some nil else None
          | None => None
          end
      end
  | PROOF.FSeqLimitDef =>
      match TERM_PM.pattern_match_prop_rec P (fst Definitions.LimitDef_statement) nil nil  with
      | Some res => Some ((Beta_prop (TERM_PM.pattern_subst_prop (snd Definitions.LimitDef_statement) res nil)):: nil)
      | _ => match TERM_PM.pattern_match_prop_rec P (fst Definitions.LimitDef_statement_2) nil nil  with
           | Some res => Some (Beta_prop (TERM_PM.pattern_subst_prop (snd Definitions.LimitDef_statement_2) res nil) :: nil)
           | _ => match TERM_PM.pattern_match_prop_rec P (fst Definitions.LimitDef_statement_fun_x) nil nil  with
                | Some res => Some (Beta_prop (TERM_PM.pattern_subst_prop (snd Definitions.LimitDef_statement_fun_x) res nil) :: nil)
                | _ => match TERM_PM.pattern_match_prop_rec P (fst Definitions.LimitDef_statement_fun_infty) nil nil  with
                     | Some res => Some (Beta_prop (TERM_PM.pattern_subst_prop (snd Definitions.LimitDef_statement_fun_infty) res nil) :: nil)
                     | _ => match TERM_PM.pattern_match_prop_rec P (fst Definitions.LimitDef_statement_fun_pos_infty) nil nil  with
                           | Some res => Some (Beta_prop (TERM_PM.pattern_subst_prop (snd Definitions.LimitDef_statement_fun_pos_infty) res nil) :: nil)
                           | _ => match TERM_PM.pattern_match_prop_rec P (fst Definitions.LimitDef_statement_fun_neg_infty) nil nil  with
                                  | Some res => Some (Beta_prop (TERM_PM.pattern_subst_prop (snd Definitions.LimitDef_statement_fun_neg_infty) res nil) :: nil)
                                  | _ => None
                                  end
                          end
                      end
                 end
            end
      end
      
  | PROOF.UContinuity_Def =>  
       match TERM_PM.pattern_match_prop_rec P (fst Definitions.UContinuity_statement) nil nil  with
      | Some res => Some (Beta_prop (TERM_PM.pattern_subst_prop (snd Definitions.UContinuity_statement) res nil) :: nil)
      | _ => None
      end
  | PROOF.Continuity_x0_Def =>
       match TERM_PM.pattern_match_prop_rec P (fst Definitions.Continuity_x0_statement) nil nil  with
      | Some res => Some (Beta_prop (TERM_PM.pattern_subst_prop (snd Definitions.Continuity_x0_statement) res nil) :: nil)
      | _ => None
      end
  | PROOF.FDefinition def => 
      match definition_apply pg def P with
      | Some _ => Some nil
      | None => None
      end
  | PROOF.FTheorem thm hints =>
      match theorem_apply pg thm P hints with
      | Some _ => Some nil
      | None => None
      end
  | PROOF.FProperty def =>
      match property_apply pg def P with
      | Some _ => Some nil
      | None => None
      end
  | PROOF.FCausalInfer p =>
      match causal_inference pg p P with
      | Some _ => Some nil
      | None => None
      end
  end. 

Definition generate_fwd_proof_goal (pg: proof_goal) (PrF: PROOF.Fwd) (P: prop): proof_goal :=
  match PrF with
  | PROOF.FDefinition d => {| assu := pg.(assu); concl := P; cont := pg.(cont) |}
  | PROOF.FTheorem th l => {| assu := pg.(assu); concl := P; cont := pg.(cont) |}
  | _ => {| assu := pg.(assu); concl := P; cont := pg.(cont) |}
  end.

Definition suppose_no_hint (P: prop) (pg: proof_goal): option proof_goal := (* 目前只有根据对称性进行的假设 *)
  match P with
  | PBinPred PROP.RGe (TVar x1) (TVar x2) | PBinPred PROP.RLe (TVar x1) (TVar x2) =>
      let pg' := (subst_proof_goal (("TEMP", TVar x2)::nil) (subst_proof_goal ((x2, TVar x1)::nil) (subst_proof_goal ((x1, TVar "TEMP")::nil) pg))) in
      if proof_goal_eqb pg pg'
      then match new_hyp_name pg.(assu) "___hyp" with
           | Some h => Some {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |}
           | None => None
           end
      else None
  | _ => None
  end.

Definition direct_deduction (pg: proof_goal) (PrB: PROOF.Bwd) (concl: prop): bool:=
  match PrB with
  | PROOF.BNoHint => true (*TODO*)
  | PROOF.BContra => false
  end.

Fixpoint term_exists_in_term (obj tm: term): bool :=
  if term_eqb obj tm then true
  else match tm with
  | TUnOp _ tm1 => term_exists_in_term obj tm1
  | TBinOp _ tm1 tm2 | TApply tm1 tm2 | TInterval _ tm1 tm2 => andb (term_exists_in_term obj tm1) (term_exists_in_term obj tm2)
  | TBinder _ _ tm1 => term_exists_in_term obj tm1 (* TODO 需要考虑到变量绑定 *)
  | TSet _ tm1 p1 => andb (term_exists_in_term obj tm1) (term_exists_in_prop obj p1) (* TODO 需要考虑到变量绑定 *)
  | _ => false
  end

with term_exists_in_prop (obj: term) (p: prop): bool :=
  match p with
  | PLongOrder _ tm1 p1 => andb (term_exists_in_term obj tm1) (term_exists_in_prop obj p1)
  | PUnPred _ tm1 => term_exists_in_term obj tm1
  | PBinPred _ tm1 tm2 => andb (term_exists_in_term obj tm1) (term_exists_in_term obj tm2)
  | PCBinPred _ tm1 tm2 cont => andb (andb (term_exists_in_term obj tm1) (term_exists_in_term obj tm2)) (term_exists_in_prop_cont obj cont)
  | PUnOp _ p1 => term_exists_in_prop obj p1
  | PBinOp _ p1 p2 => andb (term_exists_in_prop obj p1) (term_exists_in_prop obj p2)
  | PQuant _ _ p1 => term_exists_in_prop obj p1 (* TODO 需要考虑到变量绑定，需要考虑到量词的语义 *)
  end

with term_exists_in_prop_cont (obj: term) (cont: prop_context): bool :=
  match cont with
  | CLimPlus tm1 tm2 | CLimMult tm1 tm2 => andb (term_exists_in_term obj tm1) (term_exists_in_term obj tm2)
  | _ => false
  end.

Definition set_satisfiable (pg: proof_goal) (t: term): bool:=
  let all_useable_props := cons pg.(concl) (map (fun x => snd x) pg.(assu)) in
  let is_term_exists_literally := existsb (fun x => term_exists_in_prop t x) all_useable_props in
  match t with
  | TUnOp TERM.SeqLimit _ => is_term_exists_literally
  | TUnOp TERM.RSup tm1 => orb (prop_in_list_prop all_useable_props (PUnPred PROP.BoundedAbove tm1)) is_term_exists_literally
  | TUnOp TERM.RInf tm1 => orb (prop_in_list_prop all_useable_props (PUnPred PROP.BoundedBelow tm1)) is_term_exists_literally
  | TBinOp TERM.RLim tm1 tm2 => orb (andb (term_eqb tm1 (TInfty TERM.Positive_Infty)) (prop_in_list_prop all_useable_props (PUnPred PROP.Convergent tm2))) is_term_exists_literally
  | _ => true
  end.

Definition set_prop_satisfiable (pg: proof_goal) (p: prop): option (list prop) :=
  Some (p :: nil).

(* 第一个 list (VarName.t + prop) 是随着变量 var 添加的命题和变量列表和，第二个 list (VarName.t + prop) 是去掉这些命题以及 var 本身之后的 cont *)
Fixpoint cont_delete_var (cont : list (VarName.t + prop)) (var : VarName.t) : (list (VarName.t + prop)) * (list (VarName.t + prop)) :=
  match cont with
  | nil => (nil, nil)
  | (inl var') :: cont' =>
      if (VarName.eqb var var')
      then (nil, cont')
      else let (dependent_var_and_prop, cont_rest) := cont_delete_var cont' var in
           ((inl var') :: dependent_var_and_prop, cont_rest)
  | (inr p) :: cont' =>
      if (list_in VarName.eqb (freely_occurs_in_prop p) var)
      then let (dependent_var_and_prop, cont_rest) := cont_delete_var cont' var in
           ((inr p) :: dependent_var_and_prop, cont_rest)
      else let (dependent_var_and_prop, cont_rest) := cont_delete_var cont' var in
           (dependent_var_and_prop, (inr p) :: cont_rest)
  end.

(* 返回一个函数，该函数作用在命题上可以给命题添加条件 *)
Fixpoint prop_add_conditions (conds: list (VarName.t + prop)) (var: VarName.t): (prop -> prop) :=
  match conds with
  | (inl var') :: conds' => (fun x => (prop_add_conditions conds' var) (PQuant PROP.QExists var' x))
  | (inr p) :: conds' => (fun x => (prop_add_conditions conds' var) (PBinOp PROP.CImpl p x))
  | nil => (fun x => PQuant PROP.QForall var x)
  end.

Definition apply_action_on_proof (pg: proof_goal) (ac: PROOF.Act): option proof_goal :=
  match ac with
  | PROOF.AIntros x =>
      match pg.(concl) with
      | PQuant PROP.QForall y P =>
          Some {| assu := pg.(assu); concl := subst_prop P ((y, TVar x) :: nil); cont := pg.(cont) |}
      | _ => None
      end
  | PROOF.AExists t =>
      match pg.(concl) with
      | PQuant PROP.QExists y P =>
          Some {| assu := pg.(assu); concl := subst_prop P ((y, t) :: nil); cont := pg.(cont) |}
      | _ => None
      end
  | PROOF.ASuppose P =>
      match pg.(concl) with
      | PBinOp PROP.CImpl P1 P2 => (* 根据结论进行的假设 *)
          if orb (prop_eqb P P1) (prop_equivalent P P1)
          then match new_hyp_name pg.(assu) "___hyp" with
               | Some h => Some {| assu := (h, P) :: pg.(assu); concl := P2; cont := pg.(cont) |}
               | None => None
               end
          else suppose_no_hint P pg (* 根据其他因素进行的假设 *)
      | _ => (* 根据其他因素进行的假设 *)
          suppose_no_hint P pg
      end
  | PROOF.ASet x t =>
      match new_hyp_name pg.(assu) "___hyp" with
      | Some h =>
          if existsb (VarName.eqb x) (concat (map (fun x => freely_occurs_in_prop (snd x)) pg.(assu)))
          then None (* 重名了，但是在这里已经没法改名了，需要在 Elaborator 中预处理 *)
          else if set_satisfiable pg t (* t 可能不存在 *)
               then Some {| assu := (h, PBinPred PROP.REq (TVar x) t) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |}
               else None
      | None => None
      end
  | PROOF.ASetProp p =>
      match set_prop_satisfiable pg p with
      | Some props =>
          match multi_give_new_hyp_name pg.(assu) "___hyp" props with
          | Some res => Some {| assu := app res pg.(assu); concl := pg.(concl); cont := pg.(cont) |}
          | None => None
          end
      | None => None
      end
  | PROOF.AExistVar x =>
      let new_assu :=
          match map (fun x => snd x) pg.(assu) with
          | (PQuant PROP.QExists y p) :: _ =>
              match new_hyp_name pg.(assu) "___hyp" with
              | Some h => cons (h, p) pg.(assu)
              | None => pg.(assu)
              end
          | _ => pg.(assu)
          end in
      let new_cont :=
          match pg.(cont) with
          | nil => nil
          | _ => cons (inl x) pg.(cont)
          end in
      Some {| assu := new_assu; concl := pg.(concl); cont := new_cont |}
  end.

Definition add_var_to_proof_goal (pg: proof_goal) (x: VarName.t) : option proof_goal :=
  if list_in VarName.eqb (freely_occurs_in_proof_goal pg) x
  then None
  else Some {| assu := pg.(assu); concl := pg.(concl); cont := (inl x) :: pg.(cont) |}.

Definition add_prop_to_proof_goal (pg: proof_goal) (p: prop) : option proof_goal :=
  match new_hyp_name pg.(assu) "___hyp" with
  | Some h =>
      Some {| assu := (h, p) :: pg.(assu); concl := pg.(concl); cont := (inr p) :: pg.(cont) |}
  | None => None
  end.

Fixpoint add_list_prop_to_proof_goal (pg: proof_goal) (l: list prop) : option proof_goal :=
  match l with
  | nil => Some pg
  | p :: l' =>
      match add_prop_to_proof_goal pg p with
      | Some pg' =>
          add_list_prop_to_proof_goal pg' l'
      | None => None
      end
  end.

Definition apply_pose_action_on_proof (pg: proof_goal) (pac: PROOF.PoseAct): option proof_goal :=
  match pac with
  | PROOF.APoseVar x l =>
      match add_var_to_proof_goal pg x with
      | Some pg' => add_list_prop_to_proof_goal pg' l
      | None => None
      end
  | PROOF.APoseProp p => (* 在 assu 和 cont 中都加入这个命题 *)
      add_prop_to_proof_goal pg p
  end.

Definition recover_pose_action_on_proof (pg: proof_goal) (pac: PROOF.PoseAct): proof_goal :=
  match pac with
  | PROOF.APoseVar x l => (* 删除 cont 中所有和该变量相关的定理及变量本身，删除 assu 中加入的命题，为其他该变量自由出现的命题添加条件 *)
      let (dependent_var_and_props, modified_cont) := cont_delete_var pg.(cont) x in
      let fun_modify_prop := prop_add_conditions dependent_var_and_props x in
      let related_props := props_in_context dependent_var_and_props in
      let assu_delete_occurrence_in_related_props := list_del_dup (fun y z => prop_eqb (snd y) (snd z)) pg.(assu) (map (fun y => ("", y)) related_props) in
      let modified_assu := map (fun y => if (list_in VarName.eqb (freely_occurs_in_prop (snd y)) x) then (fst y, fun_modify_prop (snd y)) else y) assu_delete_occurrence_in_related_props in
      {| assu := modified_assu; concl := pg.(concl); cont := modified_cont |}
  | PROOF.APoseProp p =>
      pg
  end.

Fixpoint get_assum (l: list prop) (hs: list (HypName.t * prop)) :list (HypName.t * prop) :=
  match l with
  |nil => nil
  |t::n => match new_hyp_name hs "___hyp" with
          | Some h1 => let hs':= (h1,t)::hs in
                  (h1,t)::get_assum n hs'
          | None =>hs
          end
  end.

Definition Has_Some_nil (p: option (list prop)) :bool :=
  match p with 
  |Some nil => true
  |_ =>false
  end.

Definition Has_Some_Q_nil (p: option (list prop)): bool :=
  match p with
  |Some (Q::nil) =>true
  |_ =>false
  end.

Fixpoint list_with_line (z1 z2 :Z) (l : list bool) : list (Z*Z*bool) :=
  match l with
  | nil => nil
  | t::p => (z1,z2,t)::(list_with_line z1 z2 p)
  end.

Fixpoint list_rm_line (l : list (Z*Z*bool)) : list bool :=
  match l with
  |nil => nil
  | (z1,z2,t)::p => t::(list_rm_line p)
  end.

Fixpoint all_true (l1 : list (Z*Z*bool)) : bool:=
  match l1 with 
  | t::l => match t with 
            | (z1,z2,true) => all_true l
            | _ =>false
            end
  |nil =>  true
  end.
(*
Fixpoint check_diff_concl (pg : proof_goal) (pr : proof) (p : list prop) (f : proof_goal -> proof -> list (Z*Z*bool)) : list (Z*Z*bool) :=
  match p with
  | t :: nil => f {| assu := pg.(assu); concl := t |} pr 
  | q1 :: q2 => let l := f {| assu := pg.(assu); concl := q1 |} pr in
              if (all_true l) then l
              else check_diff_concl pg pr q2 f
  | _ => f pg pr 
  end.
*)

Fixpoint proof_goal_add_subconcl (list_of_subconcl: list prop) (assu: list (VarName.t * prop)) : option (list (VarName.t * prop)) :=
  match list_of_subconcl with
  | subconcl :: list_of_subconcl' =>
      match new_hyp_name assu "___hyp" with
      | Some h =>
          match proof_goal_add_subconcl list_of_subconcl' ((h, subconcl) :: assu) with
          | Some new_assu => Some (app new_assu ((h, subconcl) :: nil))
          | None => None
          end
      | None => None
      end
  | nil => Some nil
  end.

Fixpoint add_list_prop_with_hyp (l : list prop) (pg : proof_goal) : option proof_goal :=
  match l with
  | p::t => match new_hyp_name pg.(assu) "___hyp" with
            | Some h => 
                   add_list_prop_with_hyp t  {| assu := (h,p)::pg.(assu); concl := pg.(concl); cont:= (inr p)::pg.(cont) |} 
            | None => None
            end
  | nil => Some pg
  end.

Fixpoint is_prop_in_assum  (p : prop) (assum : list (HypName.t*prop)) : bool :=
  match assum with
  | (h,p1) ::l => if(prop_eqb p p1) then true else is_prop_in_assum p l
  | nil => false
  end.

Fixpoint add_prop_imply (p : prop) (assum1 assum2 : list(HypName.t*prop)) : list(HypName.t*prop) :=
  match assum2 with
  | (h,p2) :: l => if(is_prop_in_assum p2 assum1) then add_prop_imply p assum1 l
                   else (h,(PBinOp PROP.CImpl p p2)) :: add_prop_imply p assum1 l
  | nil => assum1
  end.

Fixpoint check_rec' (pg : proof_goal) (pr : proof) : (list (Z * Z * bool)) * proof_goal :=
  match pr with
  | PrAssum z1 z2 h => 
      match get_prop_from_hyp_name pg h with
      | Some P => ((z1,z2,prop_eqb P pg.(concl)) :: nil, pg)
      | None => ((z1,z2,false):: nil, pg) 
      end
  | PrPoseWithoutProof z1 z2 PROOF.FNoHint P pr0 =>
      let (list_of_result, list_of_subconcl) := check_prop P pg 1000 in
      let list_of_result_with_line := list_with_line z1 z2 list_of_result in
      match multi_give_new_hyp_name pg.(assu) "___hyp" list_of_subconcl with
      | Some list_of_subconcl_with_name => let (res',pg') := (check_rec' {| assu := app list_of_subconcl_with_name pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0) in
                                  (app list_of_result_with_line res' , pg')
      | None => ((z1, z2, false) :: nil, pg)
      end
  (* 有 forward proof 策略时也允许使用 NoHint 证明一部分命题 *)
  | PrPoseWithoutProof z1 z2 PrF P pr0 =>
      match new_hyp_name pg.(assu) "___hyp" with
      | Some h =>
          match P with
          | PLongOrder _ _ _ =>
              match LongOrder_deduction P with
              | Some (o, props, tm1, tm2) =>
                  let (res', pg') := (check_rec' {| assu := (h, PBinPred o tm1 tm2) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0) in
                  let res := map (fun x => orb (forallb (fun x => x) (fst (check_prop x pg 1000))) (Has_Some_nil (check_fwd_proof pg PrF x))) props in
                  ((z1,z2, forallb (fun x => x) res) :: res', pg')
              | None => ((z1,z2,false)::nil, pg)
              end
          | _ =>
              let (res', pg') := (check_rec' {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0) in
              ((z1,z2,Has_Some_nil (check_fwd_proof pg PrF P)) :: res', pg')
          end   
      | None => ((z1,z2,false)::nil, pg)
      end

  | PrPoseAndProve z1 z2 PROOF.FNoHint P pr1 pr0 =>
      match new_hyp_name pg.(assu) "___hyp" with
      | Some h =>
      let subgoal_proof_result := fst (check_rec' {| assu := pg.(assu); concl := P; cont := pg.(cont) |} pr1) in
      let (subsequent_proof_result, pg') := check_rec' {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 in
      (cons (z1, z2, forallb (fun x => x) (map (fun x => snd x) subgoal_proof_result)) (app subgoal_proof_result subsequent_proof_result) , pg')
      | None => ((z1,z2,false)::nil, pg)
      end
  | PrPoseAndProve z1 z2 PrF P pr1 pr0 => (* 感觉写的不太对 *)
        match new_hyp_name pg.(assu) "___hyp" with
        | Some h =>
        let (res', pg') := check_rec' {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 in
        ((z1, z2, (forallb (TERM.bool_eqb true)
                       (match check_fwd_proof pg PrF P with
                        | Some (Q :: nil) => list_rm_line (fst (check_rec' {| assu := pg.(assu); concl := Q; cont := pg.(cont) |} pr1 ))
                        | _ => false :: nil
                        end))) :: res', pg')
        | None => ((z1,z2,false)::nil,pg)
        end
  | PrConclWithoutProof z1 z2 PrF =>
        ((z1,z2,Has_Some_nil (check_fwd_proof pg PrF pg.(concl))) ::nil, pg)
  | PrConclAndProof z1 z2 PrF pr0 =>
      match check_fwd_proof pg PrF pg.(concl) with
      | Some (Q :: nil) =>
      check_rec' {| assu := pg.(assu); concl := Q; cont := pg.(cont) |} pr0
      | _ => ((z1,z2,false)::nil, pg)
      end
  | PrClaimSuffice z1 z2 PrB P pr0 =>
      if direct_deduction pg PrB pg.(concl)
      then let (res', pg') := check_rec' {| assu := pg.(assu); concl := P; cont := pg.(cont) |} pr0 in
            ((z1,z2,true)::res',pg')
      else ((z1,z2,false)::nil,pg)
  | PrProveSuffice z1 z2 _ _ _ _ => ((z1,z2,false)::nil, pg)
  | PrAction z1 z2 ac pr0 =>
      match apply_action_on_proof pg ac with
      | Some pg' => let (res', pg') := check_rec' pg' pr0 in
                       ((z1,z2,true) ::res',pg')
      | None => ((z1,z2,false)::nil, pg)
      end
  | PrPosePartialProof z1 z2 pac pr1 pr2 =>
      match apply_pose_action_on_proof pg pac with
      | Some pg' =>
          let (subgoal_proof_result, subgoal_pg) := check_rec' pg' pr1 in
          let pg'' := recover_pose_action_on_proof subgoal_pg pac in
          let (subsequent_proof_result, subsequent_pg) := check_rec' pg'' pr2 in
          ((z1,z2,true) :: subgoal_proof_result ++ subsequent_proof_result, subsequent_pg)
      | None => ((z1,z2,false)::nil, pg)
      end
  | PrEndPartialProof => (nil, pg)
  end.

Fixpoint check_rec'_show_pg (pg : proof_goal) (pr : proof) (fuel : nat) : proof_goal :=
  match fuel with
  | O => pg
  | S fuel' =>
  match pr with
  | PrPoseWithoutProof z1 z2 PROOF.FNoHint P pr0 =>
      let (list_of_result, list_of_subconcl) := check_prop P pg 1000 in
      let list_of_result_with_line := list_with_line z1 z2 list_of_result in
      match proof_goal_add_subconcl list_of_subconcl pg.(assu) with
      | Some list_of_subconcl_with_name =>
          let pg' := (check_rec'_show_pg {| assu := app list_of_subconcl_with_name pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0) fuel' in
          pg'
      | None => pg
      end 
  
    | PrPoseWithoutProof z1 z2 PrF P pr0 =>
      match new_hyp_name pg.(assu) "___hyp" with
      | Some h =>
          match P with
          | PLongOrder _ _ _ =>
              match LongOrder_deduction P with
              | Some (o, props, tm1, tm2) =>
                  let pg' := (check_rec'_show_pg {| assu := (h, PBinPred o tm1 tm2) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 fuel') in
                  pg'
              | None => pg
              end
          | _ =>
              let pg' := (check_rec'_show_pg {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 fuel') in
              pg'
          end   
      | None => pg
      end

  | PrPoseAndProve z1 z2 PROOF.FNoHint P pr1 pr0 =>
      match new_hyp_name pg.(assu) "___hyp" with
      | Some h =>
          let pg' :=  check_rec'_show_pg {| assu := pg.(assu); concl := P; cont := pg.(cont) |} pr1 fuel' in
          let pg'' := check_rec'_show_pg {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 fuel' in
          pg'
      | None => pg
      end
  | PrPoseAndProve z1 z2 _ P pr1 pr0 => (* 感觉写的不太对 *)
        match new_hyp_name pg.(assu) "___hyp" with
        | Some h =>
            let pg' := check_rec'_show_pg {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 fuel' in
            pg'
        | None => pg
        end
  | PrConclAndProof z1 z2 PrF pr0 =>
      match check_fwd_proof pg PrF pg.(concl) with
      | Some (Q :: nil) =>
          check_rec'_show_pg {| assu := pg.(assu); concl := Q; cont := pg.(cont) |} pr0 fuel'
      | _ => pg
      end
  | PrClaimSuffice z1 z2 PrB P pr0 =>
      if direct_deduction pg PrB pg.(concl)
      then let pg' := check_rec'_show_pg {| assu := pg.(assu); concl := P; cont := pg.(cont) |} pr0 fuel' in
          pg'
      else pg
  | PrAction z1 z2 ac pr0 =>
      match apply_action_on_proof pg ac with
      | Some pg' =>
          let pg' := check_rec'_show_pg pg' pr0 fuel' in
          pg'
      | None => pg
      end
  | PrPosePartialProof z1 z2 pac pr1 pr2 =>
      match apply_pose_action_on_proof pg pac with
      | Some pg' =>
          let subgoal_pg := check_rec'_show_pg pg' pr1 fuel' in
          let pg'' := recover_pose_action_on_proof subgoal_pg pac in
          let subsequent_pg := check_rec'_show_pg pg'' pr2 fuel' in
          pg''
      | None => pg
      end
  | _ => pg
  end
  end.