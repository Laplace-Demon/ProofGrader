From MParser.lib Require Import Lang.
From MParser.lib Require Import Poly.
From MParser.lib Require Import Theorems.

Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.

Definition solver_type : Type := proof_goal -> prop -> option (list prop).

Record solver : Type := {
  func : solver_type ;
  fee : Z ;
  pri : Z ;
  pri_prop : prop -> Z ;
}.

Fixpoint prop_extract_le (hypos : list prop) (tm : term) : list term :=
  match hypos with
  | nil => nil
  | P :: hypos' =>
       match P with
       | PBinPred PROP.RGe tm1 tm2 => if term_eqb tm tm1 then tm2 :: (prop_extract_le hypos' tm) else prop_extract_le hypos' tm
       | PBinPred PROP.RLe tm1 tm2 => if term_eqb tm tm2 then tm1 :: (prop_extract_le hypos' tm) else prop_extract_le hypos' tm
       | _ => prop_extract_le hypos' tm
       end
  end.

Fixpoint prop_extract_ge (hypos : list prop) (tm : term) : list term :=
  match hypos with
  | nil => nil
  | P :: hypos' =>
       match P with
       | PBinPred PROP.RLe tm1 tm2 => if term_eqb tm tm1 then tm2 :: (prop_extract_ge hypos' tm) else prop_extract_ge hypos' tm
       | PBinPred PROP.RGe tm1 tm2 => if term_eqb tm tm2 then tm1 :: (prop_extract_ge hypos' tm) else prop_extract_ge hypos' tm
       | _ => prop_extract_ge hypos' tm
       end
  end.

Fixpoint term_is_ge (hypos : list prop) (tm1 tm2 : term) : bool :=
  if orb (term_positive_P (TBinOp TERM.RMinus tm1 tm2)) (term_positive_R (TBinOp TERM.RMinus tm1 tm2)) then true
  else if orb (existsb (fun x => orb (term_positive_P (TBinOp TERM.RMinus x tm2)) (term_positive_R (TBinOp TERM.RMinus x tm2))) (prop_extract_le hypos tm1))
           (existsb (fun x => orb (term_positive_P (TBinOp TERM.RMinus tm1 x)) (term_positive_R (TBinOp TERM.RMinus tm1 x))) (prop_extract_ge hypos tm2)) then true
  else match tm1, tm2 with
       | TBinOp TERM.RSqrt tm11 tm12, TBinOp TERM.RSqrt tm21 tm22 =>
            if term_eqb tm11 tm21 then term_is_ge hypos tm12 tm22 else false
       | _, _ => false
       end.

Definition term_is_le (hypos : list prop) (tm1 tm2 : term) : bool :=
  term_is_ge hypos tm2 tm1.

Compute term_is_ge ((PBinPred PROP.RGe (TVar "x") (TNum 0)) :: nil)
(TVar "x") (TUnOp TERM.RNeg (TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2))).

Definition term_is_on_increasing_interval_of_sin (hypos : list prop) (tm : term) : option (term * term) :=
  if andb (term_is_ge hypos tm (TUnOp TERM.RNeg (TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2)))) (term_is_le hypos tm (TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2)))
  then Some (TUnOp TERM.RNeg (TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2)), TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2)) else None.

Compute term_is_on_increasing_interval_of_sin
((PBinPred PROP.RGe (TVar "x") (TNum 0)) :: (PBinPred PROP.RLe (TVar "x") (TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2))) :: nil)
(TVar "x").

Definition term_is_on_decreasing_interval_of_sin (hypos : list prop) (tm : term) : option (term * term) :=
  None.

Definition term_is_on_increasing_interval_of_cos (hypos : list prop) (tm : term) : option (term * term) :=
  None.

Definition term_is_on_decreasing_interval_of_cos (hypos : list prop) (tm : term) : option (term * term) :=
  None.

(*新版本多项式策略*)
Definition Poly_check (pg : proof_goal) (P : prop) : bool :=
    match P with 
    | PBinPred o t1 t2 => match o with
                       | PROP.REq => term_eq_P t1 t2
                       | PROP.RGe => term_ge_P t1 t2
                       | PROP.RLe => term_le_P t1 t2
                       | PROP.RGt => term_gt_P t1 t2
                       | PROP.RLt => term_lt_P t1 t2
                       | _ => false 
                       end
    | _ => false
    end.

Definition Poly_check_s (pg : proof_goal) (P : prop) : option (list prop) :=
  if Poly_check pg P then Some nil
  else None.

(*新版本有理式策略*)
Definition Rational_check (pg : proof_goal) (P : prop) : bool :=
    match P with 
    | PBinPred o t1 t2 => match o with
                       | PROP.REq => term_eq_R t1 t2
                       | PROP.RGe => term_ge_R t1 t2
                       | PROP.RLe => term_le_R t1 t2
                       | PROP.RGt => term_gt_R t1 t2
                       | PROP.RLt => term_lt_R t1 t2
                       | _ => false 
                       end
    | _ => false
    end.

Definition Rational_check_s (pg : proof_goal) (P : prop) : option (list prop):=
  if Rational_check pg P then Some nil
  else None.

(* 无穷的四则运算 *)
Fixpoint term_resemble_infty_check (tm : term) : bool :=
  match tm with
  | TInfty _ => true
  | TUnOp _ t1 | TBinder _ _ t1 => term_resemble_infty_check t1
  | TBinOp _ t1 t2 | TApply t1 t2 => orb (term_resemble_infty_check t1) (term_resemble_infty_check t2)
  | _ => false
  end.

Definition prop_resemble_infty_check (P : prop) : Z :=
  match P with
  | PBinPred o t1 t2 => if orb (term_resemble_infty_check t1) (term_resemble_infty_check t2) then 2 else 0
  | _ => 0
  end.

Definition infty_check_s (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with 
  | PBinPred o t1 t2 => Some (PBinPred o (infinity_calculator t1) (infinity_calculator t2) :: nil)
  | _ => None
  end.

(* 乘除式策略1 : 底数相同改变指数 *)
Definition term_resemble_muldiv_exp (tm : term) : bool :=
  match tm with
  | TBinOp b t1 t2 =>
       match b with
       | TERM.RMult | TERM.RDiv | TERM.RPower => true
       | _ => false
       end
  | _ => false
  end.

Definition prop_resemble_muldiv_exp (p : prop) : Z :=
  match p with
  | PBinPred o t1 t2 =>
       if andb (term_resemble_muldiv_exp t1) (term_resemble_muldiv_exp t2)
       then match o with
            | PROP.REq | PROP.RLe | PROP.RGe | PROP.RGt | PROP.RLt => 1
            | _ => 0
            end
       else 0
  | _ => 0
  end.

Definition muldiv_exp_check (pg : proof_goal) (p : prop) : bool :=
  match p with 
  | PBinPred o t1 t2 => match o with
                     | PROP.REq => term_eq_MDE t1 t2
                     | PROP.RGe => term_eq_MDE t1 t2
                     | PROP.RLe => term_eq_MDE t1 t2
                     | PROP.RGt => false
                     | PROP.RLt => false
                     | _ => false 
                     end
  | _ => false
  end.

Definition muldiv_exp_check_s (pg : proof_goal) (p : prop) : option (list prop) :=
  if muldiv_exp_check pg p then Some nil
  else None.

(* 乘除式策略2 : 指数相同改变底数 *)
Definition prop_resemble_muldiv_base : prop -> Z := prop_resemble_muldiv_exp.

Definition muldiv_base_check (pg : proof_goal) (p : prop) : bool :=
  match p with 
  | PBinPred o t1 t2 => match o with
                     | PROP.REq => term_eq_MDB t1 t2
                     | PROP.RGe => term_eq_MDB t1 t2
                     | PROP.RLe => term_eq_MDB t1 t2
                     | PROP.RGt => false
                     | PROP.RLt => false
                     | _ => false 
                     end
  | _ => false
  end.

Definition muldiv_base_check_s (pg : proof_goal) (p : prop) : option (list prop) :=
  if muldiv_base_check pg p then Some nil
  else None.

Module MuldivBaseTest.

Definition tm1 :=
  TBinOp TERM.RDiv (TBinOp TERM.RPower (TVar "x") (TVar "x"))
  (TBinOp TERM.RPower (TBinOp TERM.RPlus (TNum 1) (TVar "x")) (TVar "x")).

Definition tm2 :=
  TBinOp TERM.RDiv (TNum 1) (TBinOp TERM.RPower
  (TBinOp TERM.RPlus (TBinOp TERM.RDiv (TNum 1) (TVar "x")) (TNum 1)) (TVar "x")).

Definition P := PBinPred PROP.REq tm1 tm2.

End MuldivBaseTest.


(*shape分解*)
Definition Rational_shape_check (pg : proof_goal)(p:prop) :bool :=
    match p with 
    | PBinPred o t1 t2 => let t1':= Rational.eval t1 in
                       let t2':= Rational.eval t2 in
                       let r1 := Numerator t1' in
                       let r2 := Numerator t2' in
                       let r1':= Denominator t1' in
                       let r2':= Denominator t2' in
                    match o with
                     |PROP.REq =>(Poly.poly_eqn r1' r2' && Poly.poly_eqn r1 r2) ||
                                 ((SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2'))) && (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) ||
                                 (Poly.poly_eqn r1' r2' && (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) ||
                                 (Poly.poly_eqn r1 r2 && (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2'))))
                     |PROP.RGe =>if  SYMBOLIC_CHECKER.poly_ge_0 r1 then
                                 (Poly.poly_eqn r1 r2 || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) &&
                                 SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) 
                                 else if SYMBOLIC_CHECKER.poly_le_0 r1 then 
                                 (Poly.poly_eqn r1 r2 || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) &&
                                 SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) 
                                 else if SYMBOLIC_CHECKER.poly_ge_0 r1' then
                                 (Poly.poly_eqn r1' r2' || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')))) &&
                                 SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) 
                                 else if SYMBOLIC_CHECKER.poly_le_0 r1' then
                                 (Poly.poly_eqn r1' r2' || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')))) &&
                                 SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) 
                                 else false
                     |PROP.RLe =>if  SYMBOLIC_CHECKER.poly_ge_0 r1 then
                                 (Poly.poly_eqn r1 r2 || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) &&
                                 SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) 
                                 else if SYMBOLIC_CHECKER.poly_le_0 r1 then 
                                 (Poly.poly_eqn r1 r2 || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) &&
                                 SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) 
                                 else if SYMBOLIC_CHECKER.poly_ge_0 r1' then
                                 (Poly.poly_eqn r1' r2' || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')))) &&
                                 SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) 
                                 else if SYMBOLIC_CHECKER.poly_le_0 r1' then
                                 (Poly.poly_eqn r1' r2' || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')))) &&
                                 SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) 
                                 else false
                     |PROP.RGt =>if  SYMBOLIC_CHECKER.poly_ge_0 r1 then
                                 (Poly.poly_eqn r1 r2 || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) &&
                                 SYMBOLIC_CHECKER.poly_lt_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) 
                                 else if SYMBOLIC_CHECKER.poly_le_0 r1 then 
                                 (Poly.poly_eqn r1 r2 || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) &&
                                 SYMBOLIC_CHECKER.poly_gt_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) 
                                 else if SYMBOLIC_CHECKER.poly_ge_0 r1' then
                                 (Poly.poly_eqn r1' r2' || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')))) &&
                                 SYMBOLIC_CHECKER.poly_gt_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) 
                                 else if SYMBOLIC_CHECKER.poly_le_0 r1' then
                                 (Poly.poly_eqn r1' r2' || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')))) &&
                                 SYMBOLIC_CHECKER.poly_lt_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) 
                                 else false
                     |PROP.RLt =>if  SYMBOLIC_CHECKER.poly_ge_0 r1 then
                                 (Poly.poly_eqn r1 r2 || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) &&
                                 SYMBOLIC_CHECKER.poly_gt_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) 
                                 else if SYMBOLIC_CHECKER.poly_le_0 r1 then 
                                 (Poly.poly_eqn r1 r2 || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1 r2)))) &&
                                 SYMBOLIC_CHECKER.poly_lt_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) 
                                 else if SYMBOLIC_CHECKER.poly_ge_0 r1' then
                                 (Poly.poly_eqn r1' r2' || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')))) &&
                                 SYMBOLIC_CHECKER.poly_lt_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) 
                                 else if SYMBOLIC_CHECKER.poly_le_0 r1' then
                                 (Poly.poly_eqn r1' r2' || (SYMBOLIC_CHECKER.poly_ge_0 (Poly.simplify (Poly.RMinus_eval r1' r2')) && SYMBOLIC_CHECKER.poly_le_0 (Poly.simplify (Poly.RMinus_eval r1' r2')))) &&
                                 SYMBOLIC_CHECKER.poly_gt_0 (Poly.simplify (Poly.RMinus_eval r1 r2)) 
                                 else false
                     |_=>false 
                     end
    |_=>false
    end.

Definition Rational_shape_check_s (pg : proof_goal) (p:prop) :option (list prop):=
  if Rational_shape_check pg p then Some nil
  else None .

(* 局部检测策略，对相等关系生成多个子任务 *)
Fixpoint term_simpl_local_detect (tm1 tm2 : term) : list (term * term) :=
  match tm1, tm2 with
  | TNum z1, TNum z2 => if Z.eqb z1 z2 then nil else (tm1, tm2) :: nil
  | TConst c1, TConst c2 => if TERM.Const_eqb c1 c2 then nil else (tm1, tm2) :: nil
  | TUnOp u1 t1, TUnOp u2 t2 =>
      if TERM.UnOp_eqb u1 u2 then term_simpl_local_detect t1 t2 else (tm1, tm2) :: nil
  | TBinOp b1 t11 t12, TBinOp b2 t21 t22 =>
      if TERM.BinOp_eqb b1 b2 then term_simpl_local_detect t11 t21 ++ term_simpl_local_detect t12 t22 else (tm1, tm2) :: nil
  | TApply t11 t12, TApply t21 t22 => term_simpl_local_detect t11 t21 ++ term_simpl_local_detect t12 t22
  | TBinder b1 x1 t1, TBinder b2 x2 t2 => if andb (TERM.Binder_eqb b1 b2) (VarName.eqb x1 x2) then term_simpl_local_detect t1 t2 else (tm1, tm2) :: nil
  | TVar x1, TVar x2 => if VarName.eqb x1 x2 then nil else (tm1, tm2) :: nil
  | _, _ => (tm1, tm2) :: nil
  end.

Fixpoint term_local_detect (tm1 tm2 : term) (status : list prop_context) : list (term * term * (list prop_context)) := (* TODO 正确处理 context 之间的关系 *)
  match tm1, tm2 with
  | TNum z1, TNum z2 => if Z.eqb z1 z2 then nil else ((tm1, tm2), status) :: nil
  | TConst c1, TConst c2 => if TERM.Const_eqb c1 c2 then nil else ((tm1, tm2), status) :: nil
  | TUnOp u1 t1, TUnOp u2 t2 =>
      match u1, u2 with
      | TERM.RCos, TERM.RCos =>
          term_local_detect t1 t2 (CEvenFun :: (CPeriodicFun (TBinOp TERM.RMult (TNum 2) (TConst TERM.RPi))) :: status)
      | TERM.RAbs, TERM.RAbs =>
          term_local_detect t1 t2 (CEvenFun :: status)
      | _, _ => if TERM.UnOp_eqb u1 u2 then term_local_detect t1 t2 status else ((tm1, tm2), status) :: nil
      end
  | TBinOp b1 t11 t12, TBinOp b2 t21 t22 =>
      match b1, b2 with
      | TERM.RLim, TERM.RLim =>
          match t12, t22 with
          | TBinder TERM.LambdaB var1 t121, TBinder TERM.LambdaB var2 t221 => if andb (term_eqb t11 t21) (VarName.eqb var1 var2) then ((t121, t221), (CLimMult (TVar var1) t11) :: status) :: nil else ((t12, t22), status) :: nil
          | _, _ => ((t12, t22), status) :: nil
          end
      | TERM.RPlus, TERM.RPlus | TERM.RMinus, TERM.RMinus =>
          match status with
          | (CLimMult var val) :: status' => (term_local_detect t11 t21 ((CLimPlus var val) :: status')) ++ (term_local_detect t12 t22 ((CLimPlus var val) :: status'))
          | _ => (term_local_detect t11 t21 status) ++ (term_local_detect t12 t22 status)
          end
      | _, _ => if TERM.BinOp_eqb b1 b2 then (term_local_detect t11 t21 status) ++ (term_local_detect t12 t22 status) else ((tm1, tm2), status) :: nil
      end
  | TApply t11 t12, TApply t21 t22 => (term_local_detect t11 t21 status) ++ (term_local_detect t12 t22 status)
  | TBinder b1 x1 t1, TBinder b2 x2 t2 => if andb (TERM.Binder_eqb b1 b2) (VarName.eqb x1 x2) then term_local_detect t1 t2 status else ((tm1, tm2), status) :: nil
  | TVar x1, TVar x2 => if VarName.eqb x1 x2 then nil else ((tm1, tm2), status) :: nil
  | _, _ => ((tm1, tm2), status) :: nil
  end.

Definition local_detect (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
       let helper := fun x => match snd x with | nil => PBinPred PROP.REq (fst (fst x)) (snd (fst x)) | _ => PCBinPred PROP.REq (fst (fst x)) (snd (fst x)) (snd x) end in
       Some (map helper (term_local_detect tm1 tm2 nil))
  | PCBinPred PROP.REq tm1 tm2 cont =>
       let helper := fun x => match snd x with | nil => PBinPred PROP.REq (fst (fst x)) (snd (fst x)) | _ => PCBinPred PROP.REq (fst (fst x)) (snd (fst x)) (snd x) end in
       Some (map helper (term_local_detect tm1 tm2 cont))
  | _ => None
  end.

(* 移除 context *)
Definition prop_resemble_cancel_context (P : prop) :=
  match P with
  | PCBinPred _ _ _ _ => 1
  | _ => 0
  end.

Definition cancel_context (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PCBinPred o t1 t2 _ => Some ((PBinPred o t1 t2) :: nil)
  | _ => None
  end.

(*检验prop中是否需要去绝对值*)
Definition term_has_abs (t : term) : bool:=
  match t with
  |TUnOp u t1=> match u with
              |TERM.RAbs =>true
              | _=>false
             end
  |_ =>false
  end .

Definition prop_has_abs (P:prop) : Z:=
  match P with
  |PBinPred o t1 t2 =>if term_has_abs t1 then 1
                   else if term_has_abs t2 then 1
                   else 0 
  |_ => 0
  end.

(*去除绝对值号*)
Definition remove_abs (pg : proof_goal) (P : prop) : prop :=
  match P with
  | PBinPred o t1 t2 => PBinPred o (SYMBOLIC_CHECKER.remove_abs pg t1) (SYMBOLIC_CHECKER.remove_abs pg t2)
  | _ => P
  end.

Definition remove_abs_s (pg : proof_goal) (P : prop) : option (list prop) :=
  Some ((remove_abs pg P) :: nil).

Definition remove_term_abs (pg : proof_goal) (tm : term) : term :=
  let hypos := map (fun x => snd x) (assu pg) in
  match tm with
  | TUnOp u tm' => match u with 
                  | TERM.RAbs => if term_is_positive hypos tm' then tm'
                                 else if term_is_negative hypos tm' then (TUnOp TERM.RNeg tm')
                                 else tm
                  | _ => tm
                  end
  | _ => tm
  end.

Compute remove_term_abs {| assu := ("H1", PBinPred PROP.RGe (TVar "omega") (TNum 0)) :: nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) |}
(TUnOp TERM.RAbs (TBinOp TERM.RDiv (TVar "omega") (TNum 2))).

Definition new_remove_abs (pg : proof_goal) (P : prop) : prop :=
    match P with 
    | PBinPred o t1 t2 => PBinPred o (remove_term_abs pg t1) (remove_term_abs pg t2)
    | _ => P
    end.

Definition new_remove_abs_s (pg : proof_goal) (P : prop) : option (list prop) :=
  Some ((new_remove_abs pg P) :: nil).

(* 绝对值号内添加负号 *)
Definition prop_resemble_abs_add_neg (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
       match tm1, tm2 with
       | TUnOp TERM.RAbs t11, TUnOp TERM.RAbs t21 =>
            match term_is_neg t11, term_is_neg t21 with
            | Some t11', None => if term_eqb t11' t21 then 2 else 0
            | None, Some t21' => if term_eqb t11 t21' then 2 else 0
            | _, _ => 0
            end
       | _, _ => 0
       end
  | _ => 0
  end.

Definition abs_add_neg (pg : proof_goal) (P : prop) : option (list prop) := Some nil.

(*绝对值号内乘积拆分*)
Definition term_has_absmul (t : term) : bool :=
  match t with
  | TUnOp u t1 =>
       andb (term_is_mult t1) (TERM.UnOp_eqb u TERM.RAbs)
  | _ => false
  end.

Definition prop_has_absmul (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq t1 t2 | PBinPred PROP.RGe t1 t2 | PBinPred PROP.RLe t1 t2 =>
       if term_has_absmul t1 then 1
       else if term_has_absmul t2 then 1
       else 0
  | _ => 0
  end.

Fixpoint term_multimult_extract (t : term) : list term :=
  match t with
  | TBinOp TERM.RMult t1 t2 =>
       app (term_multimult_extract t1) (term_multimult_extract t2)
  | _ =>
       t :: nil
  end.

Fixpoint term_multimultabs (lt : list term) : term :=
  match lt with
  | nil => TVar "Error" (* undefined *)
  | t1 :: nil => TUnOp TERM.RAbs t1
  | t1 :: lt' => TBinOp TERM.RMult (TUnOp TERM.RAbs t1) (term_multimultabs lt')
  end.

Definition term_divide_absmul (t : term) : term :=
  match t with
  | TUnOp TERM.RAbs (TBinOp TERM.RMult t1 t2) =>
       term_symbolic_simplify (term_multimultabs (app (term_multimult_extract t1) (term_multimult_extract t2)))
  | _ => t
  end.

Definition divide_absmul_s (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred o t1 t2 =>
       if orb (orb (PROP.BinOp_eqb o (PROP.HasOrder PROP.REq)) (PROP.BinOp_eqb o (PROP.HasOrder PROP.RGe))) (PROP.BinOp_eqb o (PROP.HasOrder PROP.RLe))
       then if term_has_absmul t1 then Some ((PBinPred o (term_divide_absmul t1) t2) :: nil)
       else if term_has_absmul t2 then Some ((PBinPred o t1 (term_divide_absmul t2)) :: nil)
       else None else None
  | _ => None
  end.

Compute divide_absmul_s {| assu := nil; concl := (PBinPred PROP.RGt (TVar "eps") (TNum 0)) |}
(PBinPred PROP.RLe (TUnOp TERM.RAbs (TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult (TUnOp TERM.RSin (TBinOp TERM.RDiv (TBinOp TERM.RPlus (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x1"))) (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x2")))) (TNum 2))) (TUnOp TERM.RSin (TBinOp TERM.RDiv (TBinOp TERM.RMinus (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x1"))) (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x2")))) (TNum 2))))))
                   (TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult (TUnOp TERM.RAbs (TUnOp TERM.RSin (TBinOp TERM.RDiv (TBinOp TERM.RPlus (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x1"))) (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x2")))) (TNum 2)))) (TUnOp TERM.RAbs (TUnOp TERM.RSin (TBinOp TERM.RDiv (TBinOp TERM.RMinus (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x1"))) (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x2")))) (TNum 2))))))).





(*检验prop中是否含有极限*)
Definition term_has_lim (t :term) :bool :=
  match t with
  |TUnOp o t1 => match o with
                | TERM.SeqLimit => true
                | _ => false  
                end
  |TBinOp o t1 t2=>match o with
                  | TERM.RLim =>true
                  | _ =>false
                  end
  |_ =>false
  end.

Definition prop_has_lim (P : prop) : Z :=
  match P with
  |PBinPred o t1 t2=>if term_has_lim t1 then 1
                   else if term_has_lim t2 then 1
                   else 0 
  |_ => 0
  end. 

Fixpoint is_mult_div (t : term) :bool :=
  match t with
  |TBinOp o t1 t2=> if(TERM.BinOp_eqb o TERM.RMult) then true
                    else if (TERM.BinOp_eqb o TERM.RDiv) then true
                    else false
  |TUnOp u t1 => match u with
                 |TERM.RAbs => is_mult_div t1
                 |TERM.RNeg => is_mult_div t1
                 |_ =>false
                 end
  |_ => false
  end.

Fixpoint is_plus_minus (t : term) :bool :=
  match t with
  |TBinOp o t1 t2=>if(TERM.BinOp_eqb o TERM.RPlus) then true
                   else if (TERM.BinOp_eqb o TERM.RMinus) then true
                   else false
  |TUnOp u t1 =>match u with
                |TERM.RAbs => is_plus_minus t1
                |TERM.RNeg => is_plus_minus t1
                |_ =>false
                end
  |_ => false
  end.

Definition get_term_cont (t : term) : option prop_context :=
  match t with
  |TBinOp o t1 t2=>match o with
                  | TERM.RLim => match t2 with 
                                |TBinder b x t2'=>if (is_mult_div t2') then Some (CLimMult (TVar x) t1)
                                                  else if (is_plus_minus t2') then Some (CLimPlus (TVar x) t1)
                                                  else None
                                |_ => None
                                end
                  | _ =>None
                  end
  |_ => None
  end.

Definition term_cont_eqb (t1 t2 : term) : option prop_context :=
  let o1 := get_term_cont t1 in
  let o2 := get_term_cont t2 in
  match o1, o2 with
  | Some c1, Some c2 => if (prop_cont_eqb c1 c2) then o1 else None
  | _, _ => None
  end.

Definition get_prop_cont (P: prop) : option prop_context :=
  match P with
  | PBinPred PROP.REq t1 t2
  | PBinPred PROP.RLe t1 t2
  | PBinPred PROP.RGe t1 t2 => term_cont_eqb t1 t2
  | _ =>None
  end.

(*代换 (只针对一个变量)*)
Fixpoint replace_term (pg : proof_goal) (P : prop) (fee : nat) : prop :=
  let pg' := SYMBOLIC_CHECKER.assum_auto_inference pg in
  match pg'.(assu) with
  | nil => P
  | (h, P2) :: t => match fee with
                    | S n =>
                         match P with
                         | PBinPred PROP.RLe t1 t2 =>
                              let P' := (PBinPred PROP.RLe (SYMBOLIC_CHECKER.replace_Le t1 P2 pg) t2) in
                              if prop_eqb P' P then replace_term {| assu := t;  concl := pg.(concl); cont := pg.(cont) |} P n
                              else P'
                         | PBinPred PROP.RGe t1 t2 =>
                              let P' := (PBinPred PROP.RGe (SYMBOLIC_CHECKER.replace_Ge t1 P2 pg) t2) in
                              if prop_eqb P' P then replace_term {| assu := t;  concl := pg.(concl); cont := pg.(cont) |} P n
                              else P'
                         | _ => P
                         end
                   | O => P
                   end
  end.

Definition replace_term_s (pg: proof_goal) (P: prop): option (list prop) :=
  Some ((replace_term pg P 10) :: nil).

(* 多步代换，不会继续调用其他solver *)
Definition prop_resemble_multi_replace_term (P : prop) : Z :=
  match P with
  | PBinPred PROP.RLe _ _ | PBinPred PROP.RGe _ _ => 1
  | _ => 0
  end.

Definition prop_is_provable (pg : proof_goal) (P : prop) :=
  if orb (muldiv_exp_check pg P) (orb (Poly_check pg P) (Rational_check pg P)) then true
  else false.

Compute prop_is_provable {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1); cont := nil |}
(PBinPred PROP.RLe (TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult (TBinOp TERM.RDiv (TVar "x") (TNum 2)) (TNum 1))) (TVar "x")).

Definition simple_inequality_scaling_g (hypos : list prop) (tm : term) : option (list (term * prop)) :=
  match tm with
  | TUnOp TERM.RAbs _ => Some ((TNum 0, PBinPred PROP.RGe tm (TNum 0)) :: nil)
  | TUnOp TERM.ZCeil tm1 => Some ((tm1, PBinPred PROP.RGe tm tm1) :: nil)
  | TUnOp TERM.RSin _ | TUnOp TERM.RCos _ => Some (((TNum (Z.opp 1)), PBinPred PROP.RGe tm (TNum (Z.opp 1))) :: nil)

  | TBinOp TERM.RMax tm1 tm2 => Some ((tm1, PBinPred PROP.RGe tm tm1) :: (tm2, PBinPred PROP.RGe tm tm2) :: nil)

  | TBinOp TERM.RPower _ (TNum 2) => Some ((TNum 0, PBinPred PROP.RGe tm (TNum 0)) :: nil)
  | _ => None
  end.

Definition simple_inequality_scaling_l (hypos : list prop) (tm : term) : option (list (term * prop)) :=
  match tm with
  | TUnOp TERM.RNeg (TUnOp TERM.RAbs _) => Some ((TNum 0, PBinPred PROP.RLe tm (TNum 0)) :: nil)
  | TUnOp TERM.ZFloor tm1 => Some ((tm1, PBinPred PROP.RLe tm tm1) :: nil)
  | TUnOp TERM.RSin tm' => if term_is_positive hypos tm' then Some ((tm', PBinPred PROP.RLe tm tm') :: (TNum 1, PBinPred PROP.RLe tm (TNum 1)) :: nil)
                           else Some ((TNum 1, PBinPred PROP.RLe tm (TNum 1)) :: nil)
  | TUnOp TERM.RCos _ => Some ((TNum 1, PBinPred PROP.RLe tm (TNum 1)) :: nil)

  | TUnOp TERM.RAbs (TUnOp TERM.RSin _) | TUnOp TERM.RAbs (TUnOp TERM.RCos _) => Some ((TNum 1, PBinPred PROP.RLe tm (TNum 1)) :: nil)

  | TBinOp TERM.RMin tm1 tm2 => Some ((tm1, PBinPred PROP.RLe tm tm1) :: (tm2, PBinPred PROP.RLe tm tm2) :: nil)

  | _ => None
  end.

Definition simple_inequality_scaling (hypos : list prop) (tm : term) (direction : bool) : option (list (term * prop)) :=
  if direction then simple_inequality_scaling_l hypos tm else simple_inequality_scaling_g hypos tm.

Fixpoint more_hypo (hypos : list prop) : list prop :=
  match hypos with
  | hypo :: hypos' =>
       app (match hypo with
       | PBinPred o t1 t2 =>
            match o with
            | PROP.REq =>
                 match t1, t2 with
                 | TBinOp TERM.RMax t11 t12, _ => (PBinPred PROP.RLe t11 t2) :: (PBinPred PROP.RLe t12 t2) :: (PBinPred PROP.RLt t11 t2) :: (PBinPred PROP.RLt t12 t2) :: nil
                 | TBinOp TERM.RMin t11 t12, _ => (PBinPred PROP.RGe t11 t2) :: (PBinPred PROP.RGe t12 t2) :: (PBinPred PROP.RGt t11 t2) :: (PBinPred PROP.RGt t12 t2) :: nil
                 | _, TBinOp TERM.RMax t21 t22 => (PBinPred PROP.RGe t1 t21) :: (PBinPred PROP.RGe t1 t22) :: (PBinPred PROP.RGt t1 t21) :: (PBinPred PROP.RGt t1 t22) :: nil
                 | _, TBinOp TERM.RMin t21 t22 => (PBinPred PROP.RLe t1 t21) :: (PBinPred PROP.RLe t1 t22) :: (PBinPred PROP.RLt t1 t21) :: (PBinPred PROP.RLt t1 t22) :: nil
                 | _, _ => hypo :: nil
                 end
            | PROP.RLe | PROP.RLt =>
                 match t1, t2 with
                 | TBinOp TERM.RMax t11 t12, _ => (PBinPred o t11 t2) :: (PBinPred o t12 t2) :: nil
                 | _, TBinOp TERM.RMin t21 t22 => (PBinPred o t1 t21) :: (PBinPred o t1 t22) :: nil
                 | _, _ => hypo :: nil
                 end
            | PROP.RGe | PROP.RGt =>
                 match t1, t2 with
                 | TBinOp TERM.RMin t11 t12, _ => (PBinPred o t11 t2) :: (PBinPred o t12 t2) :: nil
                 | _, TBinOp TERM.RMax t21 t22 => (PBinPred o t1 t21) :: (PBinPred o t1 t22) :: nil
                 | _, _ => hypo :: nil
                 end
            | _ => hypo :: nil
            end
       | _ => hypo :: nil
       end)
       (more_hypo hypos')
  | nil => nil
  end.

Fixpoint hypo_filter (hypos : list prop) (tm : term) (direction : bool) : list (term * prop) :=
  match hypos with
  | nil => nil
  | hypo :: hypos' =>
       let element := match hypo with
                      | PBinPred PROP.REq t1 t2 =>
                           if term_eq_P tm t1 then (t2, hypo) :: nil else if term_eq_P tm t2 then (t1, hypo) :: nil else nil
                      | PBinPred PROP.RLe t1 t2 | PBinPred PROP.RLt t1 t2  =>
                           if direction then (if term_eq_P tm t1 then (t2, hypo) :: nil else nil)
                           else (if term_eq_P tm t2 then (t1, hypo) :: nil else nil)
                      | PBinPred PROP.RGe t1 t2 | PBinPred PROP.RGt t1 t2 =>
                           if direction then (if term_eq_P tm t2 then (t1, hypo) :: nil else nil)
                           else (if term_eq_P tm t1 then (t2, hypo) :: nil else nil)
                      | _ => nil
                      end in
       app element (hypo_filter hypos' tm direction)
  end.

(* 感觉每一步都用 term_is_positive 做符号的判断过于麻烦了, 不知有没有其他方式 *)
(* list (term * list prop) 首个 term 是放缩出的表达式, list prop 为放缩过程中所使用的条件 *)
Fixpoint possible_replace_term (pg : proof_goal) (tm : term) (direction : bool) (constraint : (list term) * (list term)) : list (term * list prop) :=
  let hypos := more_hypo (map (fun x => snd x) (assu pg)) in
  let determine_direction := fun a b : bool => if a then b else negb b in
  let term_hypo := map (fun x => (fst x, (snd x) :: nil)) (hypo_filter hypos tm direction) in
  let term_simple := match simple_inequality_scaling hypos tm direction with
                     | Some ls => map (fun x => (fst x, (snd x) :: nil)) ls
                     | None => nil
                     end in
  let term_rec := match tm with
                  | TUnOp u tm1 =>
                       match u with
                       | TERM.RAbs =>
                            let is_term_positive := term_is_positive hypos tm1 in
                            let is_term_negative := term_is_negative hypos tm1 in
                            if is_term_positive
                            then let possible_terms := possible_replace_term pg tm1 direction ((TNum 0) :: fst constraint, snd constraint) in
                                 map (fun x => (TUnOp TERM.RAbs (fst x), snd x)) possible_terms
                            else if is_term_negative
                            then let possible_terms := possible_replace_term pg tm1 direction (fst constraint, (TNum 0) :: snd constraint) in
                                 map (fun x => (TUnOp TERM.RAbs (fst x), snd x)) possible_terms
                            else (tm, nil) :: nil
                       | TERM.RNeg =>
                            let possible_terms := possible_replace_term pg tm1 (negb direction) constraint in
                            map (fun x => (TUnOp TERM.RNeg (fst x), snd x)) possible_terms
                       | TERM.ZCeil => (tm, nil) :: nil
                       | TERM.ZFloor => (tm, nil) :: nil
                       | TERM.RSin =>
                            match term_is_on_increasing_interval_of_sin hypos tm1 with
                            | Some (lower, upper) =>
                                 let possible_terms := possible_replace_term pg tm1 direction (lower :: fst constraint, upper :: snd constraint) in
                                 map (fun x => (TUnOp TERM.RSin (fst x), snd x)) possible_terms
                            | None => (tm, nil) :: nil
                            end
                       | TERM.RCos => (tm, nil) :: nil
                       | TERM.SeqLimit => 
                            let possible_terms := possible_replace_term pg tm1 direction constraint in
                            map (fun x => (TUnOp TERM.SeqLimit (fst x), snd x)) possible_terms
                       | TERM.RLn =>
                            let possible_terms := possible_replace_term pg tm1 direction constraint in
                            map (fun x => (TUnOp TERM.RLn (fst x), snd x)) possible_terms
                       | _ => (tm, nil) :: nil
                       end
                  | TBinOp b tm1 tm2 =>
                       match b with
                       (* Here we can build a mutual recursive function to reinforce its capacity *)
                       | TERM.RDiv =>
                            let is_left_positive := term_is_positive hypos tm1 in
                            let is_left_negative := term_is_negative hypos tm1 in
                            let is_right_positive := term_is_positive hypos tm2 in
                            let is_right_negative := term_is_negative hypos tm2 in
                            if andb (orb is_left_positive is_left_negative) (orb is_right_positive is_right_negative)
                            then let possible_left_terms := possible_replace_term pg tm1 (determine_direction is_right_positive direction) constraint in
                                 let possible_right_terms := possible_replace_term pg tm2 (negb (determine_direction is_left_positive direction)) constraint in
                                 concat (map (fun x => map (fun y => (TBinOp TERM.RDiv (fst x) (fst y), app (snd x) (snd y))) possible_right_terms) possible_left_terms)
                            else if direction
                            then if is_left_positive
                                 then let possible_left_terms := possible_replace_term pg tm1 direction constraint in
                                      let possible_right_terms := possible_replace_term pg tm2 (negb direction) ((TNum 0) :: fst constraint, snd constraint) in
                                      concat (map (fun x => map (fun y => (TBinOp TERM.RDiv (fst x) (fst y), app (snd x) (snd y))) possible_right_terms) possible_left_terms)
                                 else if is_right_positive
                                      then let possible_left_terms := possible_replace_term pg tm1 direction constraint in
                                           map (fun x => (TBinOp TERM.RDiv (fst x) tm2, snd x)) possible_left_terms
                                      else (tm, nil) :: nil
                           else if is_right_positive
                                then let possible_left_terms := possible_replace_term pg tm1 direction constraint in
                                     map (fun x => (TBinOp TERM.RDiv (fst x) tm2, snd x)) possible_left_terms
                                else (tm, nil) :: nil
                       | TERM.RMult =>
                            let is_left_positive := term_is_positive hypos tm1 in
                            let is_left_negative := term_is_negative hypos tm1 in
                            let is_right_positive := term_is_positive hypos tm2 in
                            let is_right_negative := term_is_negative hypos tm2 in
                            if andb (orb is_left_positive is_left_negative) (orb is_right_positive is_right_negative)
                            then let possible_left_terms := possible_replace_term pg tm1 (determine_direction is_right_positive direction) constraint in
                                 let possible_right_terms := possible_replace_term pg tm2 (determine_direction is_left_positive direction) constraint in
                                 concat (map (fun x => map (fun y => (TBinOp TERM.RMult (fst x) (fst y), app (snd x) (snd y))) possible_right_terms) possible_left_terms)
                            else (tm, nil) :: nil
                       | TERM.RPlus =>
                            let possible_left_terms := possible_replace_term pg tm1 direction constraint in
                            let possible_right_terms := possible_replace_term pg tm2 direction constraint in
                            concat (map (fun x => map (fun y => (TBinOp TERM.RPlus (fst x) (fst y), app (snd x) (snd y))) possible_right_terms) possible_left_terms)
                       | TERM.RMinus =>
                            let possible_left_terms := possible_replace_term pg tm1 direction constraint in
                            let possible_right_terms := possible_replace_term pg tm2 (negb direction) constraint in
                            concat (map (fun x => map (fun y => (TBinOp TERM.RMinus (fst x) (fst y), app (snd x) (snd y))) possible_right_terms) possible_left_terms)
                       | TERM.RPower => (tm, nil) :: nil
                       | TERM.RSqrt =>
                            let possible_terms := possible_replace_term pg tm2 direction constraint in
                            map (fun x => (TBinOp TERM.RSqrt tm1 (fst x), snd x)) possible_terms
                       | TERM.RMax =>
                            let possible_left_terms := possible_replace_term pg tm1 direction constraint in
                            let possible_right_terms := possible_replace_term pg tm2 direction constraint in
                            concat (map (fun x => map (fun y => (TBinOp TERM.RMax (fst x) (fst y), app (snd x) (snd y))) possible_right_terms) possible_left_terms)
                       | TERM.RMin =>
                            let possible_left_terms := possible_replace_term pg tm1 direction constraint in
                            let possible_right_terms := possible_replace_term pg tm2 direction constraint in
                            concat (map (fun x => map (fun y => (TBinOp TERM.RMin (fst x) (fst y), app (snd x) (snd y))) possible_right_terms) possible_left_terms)
                       | TERM.RLim =>
                            let possible_terms := possible_replace_term pg tm2 direction constraint in
                            map (fun x => (TBinOp TERM.RLim tm1 (fst x), snd x)) possible_terms
                       end
                  | TApply _ _ | TBinder _ _ _ => (tm, nil) :: nil (* 可根据单调性判断 *)
                  | _ => (tm, nil) :: nil
                  end in
  let preliminary_result := list_no_dup (fun x y => andb (term_eqb (fst x) (fst y)) (eqb_of_list prop_eqb (snd x) (snd y))) nil (app term_hypo (app term_simple term_rec)) in
  filter (fun x => andb (forallb (fun y => term_is_ge hypos (fst x) y) (fst constraint)) (forallb (fun y => term_is_le hypos (fst x) y) (snd constraint))) preliminary_result.

(* 选取前若干个 *)
Fixpoint prop_selector lP (fee : nat) : list prop :=
  match fee with
  | O => nil
  | S fee' =>
       match lP with
       | nil => nil
       | P :: lP' => P :: (prop_selector lP' fee')
       end
  end.

Definition multi_replace_term (pg : proof_goal) (P : prop) : bool :=
  let prop_subst :=
    fun t1 t2 => match P with
                 | PBinPred p _ _ => PBinPred p t1 t2
                 | _ => P
                 end in
  let possible_left_terms := match P with
                             | PBinPred PROP.RLe tm _ | PBinPred PROP.RLt tm _ => possible_replace_term pg tm true (nil, nil)
                             | PBinPred PROP.RGe tm _ | PBinPred PROP.RGt tm _ => possible_replace_term pg tm false (nil, nil)
                             | _ => nil
                             end in
  let possible_right_terms := match P with
                              | PBinPred PROP.RLe _ tm | PBinPred PROP.RLt _ tm => possible_replace_term pg tm false (nil, nil)
                              | PBinPred PROP.RGe _ tm | PBinPred PROP.RGt _ tm => possible_replace_term pg tm true (nil, nil)
                              | _ => nil
                              end in
  let possible_props_with_record :=
    concat (map (fun x => map (fun y => (prop_subst (fst x) (fst y), (snd x, snd y))) possible_right_terms) possible_left_terms) in
  let possible_props_with_record' := map (fun x => (fst x, app (fst (snd x)) (snd (snd x)))) possible_props_with_record in
  let modified_props := map (fun x => if prop_is_strict (fst x) then (if existsb prop_is_strict (snd x) then prop_modify_strict (fst x) else fst x) else fst x ) possible_props_with_record' in
  let chosen_props := prop_selector modified_props 20 in
  existsb (fun x => prop_is_provable pg x) chosen_props.


Definition test_multi_replace_term (pg : proof_goal) (P : prop) :=
  let prop_subst :=
    fun t1 t2 => match P with
                 | PBinPred p _ _ => PBinPred p t1 t2
                 | _ => P
                 end in
  let possible_left_terms := match P with
                             | PBinPred PROP.RLe tm _ | PBinPred PROP.RLt tm _ => possible_replace_term pg tm true (nil, nil)
                             | PBinPred PROP.RGe tm _ | PBinPred PROP.RGt tm _ => possible_replace_term pg tm false (nil, nil)
                             | _ => nil
                             end in
  let possible_right_terms := match P with
                              | PBinPred PROP.RLe _ tm | PBinPred PROP.RLt _ tm => possible_replace_term pg tm false (nil, nil)
                              | PBinPred PROP.RGe _ tm | PBinPred PROP.RGt _ tm => possible_replace_term pg tm true (nil, nil)
                              | _ => nil
                              end in
  let possible_props_with_record :=
    concat (map (fun x => map (fun y => (prop_subst (fst x) (fst y), (snd x, snd y))) possible_right_terms) possible_left_terms) in
  let possible_props_with_record' := map (fun x => (fst x, app (fst (snd x)) (snd (snd x)))) possible_props_with_record in
  let modified_props := map (fun x => if prop_is_strict (fst x) then (if existsb prop_is_strict (snd x) then prop_modify_strict (fst x) else fst x) else fst x ) possible_props_with_record' in
  let chosen_props := prop_selector modified_props 10 in
  chosen_props.

Definition multi_replace_term_s (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred PROP.RLe _ _ | PBinPred PROP.RGe _ _ | PBinPred PROP.RLt _ _ | PBinPred PROP.RGt _ _ =>
       match multi_replace_term pg P with
       | true => Some nil
       | false => None
       end
  | _ => None
  end.

Compute multi_replace_term_s
{| assu := ("H1", PBinPred PROP.RLe (TUnOp TERM.RAbs (TUnOp TERM.RSin (TVar "a"))) (TBinOp TERM.RDiv (TVar "epsilon") (TNum 2))) :: nil;
   concl := PBinPred PROP.REq (TNum 1) (TNum 1);
   cont := nil |}
(PBinPred PROP.RLe (TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult (TUnOp TERM.RAbs (TUnOp TERM.RSin (TVar "a"))) (TUnOp TERM.RAbs (TUnOp TERM.RSin (TVar "b"))))) (TVar "epsilon")).

Compute multi_replace_term_s
{| assu := ("H1", PBinPred PROP.RLe (TVar "x") (TVar "a")) :: ("H2", PBinPred PROP.RLe (TVar "x") (TVar "b")) :: nil;
   concl := PBinPred PROP.REq (TNum 1) (TNum 1);
   cont := nil |}
(PBinPred PROP.RLe (TBinOp TERM.RPlus (TVar "x") (TVar "x")) (TBinOp TERM.RPlus (TVar "a") (TVar "b"))).

Compute multi_replace_term_s
{| assu := ("H1", PBinPred PROP.RGe (TVar "omega") (TNum 0)) :: nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |}
(PBinPred PROP.RLe (TUnOp TERM.RSin (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RDiv (TVar "omega") (TNum 2)))) (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RDiv (TVar "omega") (TNum 2)))).

Compute multi_replace_term_s
{| assu := ("H1", PBinPred PROP.RGe (TVar "a") (TNum 0)) :: ("H2", PBinPred PROP.RLe (TVar "a") (TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2))) ::
           ("H3", PBinPred PROP.RGe (TVar "b") (TNum 0)) :: ("H4", PBinPred PROP.RLe (TVar "b") (TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2))) :: ("H5", PBinPred PROP.RLe (TVar "a") (TVar "b")) :: nil ;
  concl := PBinPred PROP.REq (TNum 1) (TNum 1);
  cont := nil |}
(PBinPred PROP.RLe (TUnOp TERM.RSin (TVar "a")) (TUnOp TERM.RSin (TVar "b"))).

(*对式子两边的term做简单化简*)
Definition term_simpl (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred o t1 t2=> let t':= SYMBOLIC_CHECKER.term_simpl t1 t2 in
                Some ((PBinPred o (fst t')(snd t'))::nil)
  | _ => Some (P::nil)
  end.
  
(*最后一步的判定*)
Definition check_concl_auto_R (pg : proof_goal) (P: prop): bool :=
  match P with
  | PBinPred PROP.REq t1 t2 => test_eqn_R t1 t2
  | PBinPred PROP.RLe t1 t2 => test_eqn_R t1 t2
  | PBinPred PROP.RGe t1 t2 => test_eqn_R t1 t2
  | _ => false
  end.

Compute term_eq_P (TUnOp TERM.RAbs (TVar "a")) (TUnOp TERM.RAbs (TUnOp TERM.RNeg (TVar "a"))).

Definition final_check (pg : proof_goal) (P: prop):option (list prop) :=
  if (check_concl_auto_R pg P) then Some nil
  else if (SYMBOLIC_CHECKER.check_concl_auto_with_assumption pg P) then Some nil
  else None.

(*对term中进行简单消除*)
Fixpoint term_rm (t : term) : term :=
  match t with
  |TBinOp b t1 t2 =>match b with 
                   |TERM.RMinus => if term_eqb t1 t2
                                   then (TNum 0)
                                   else TBinOp b (term_rm t1) (term_rm t2)
                   |TERM.RPlus => let t1':= TUnOp TERM.RNeg t1 in
                                  let t2':= TUnOp TERM.RNeg t2 in
                                  if term_eqb t1 t2'
                                  then (TNum 0)
                                  else if term_eqb t1' t2
                                  then (TNum 0)
                                  else TBinOp b (term_rm t1) (term_rm t2)
                   |TERM.RDiv =>  let t1':= TUnOp TERM.RNeg t1 in
                                  let t2':= TUnOp TERM.RNeg t2 in
                                  if term_eqb t1 t2
                                  then (TNum 1)
                                  else if term_eqb t1' t2
                                  then (TNum (-1))
                                  else if term_eqb t1 t2'
                                  then (TNum (-1))
                                  else TBinOp b (term_rm t1) (term_rm t2)
                   |TERM.RMult => match t1 with
                                 |TBinOp TERM.RDiv a1 a2 
                                          => match t2 with
                                            |TBinOp TERM.RDiv b1 b2 =>
                                            let a1':= TUnOp TERM.RNeg a1 in
                                            let a2':= TUnOp TERM.RNeg a2 in
                                            let b1':= TUnOp TERM.RNeg b1 in
                                            let b2':= TUnOp TERM.RNeg b2 in
                                                    if term_eqb a1 b2 
                                                    then  (TBinOp TERM.RDiv b1 a2)
                                                    else if term_eqb a1' b2'
                                                    then (TBinOp TERM.RDiv b1 a2)
                                                    else if term_eqb a1' b2
                                                    then TUnOp TERM.RNeg  (TBinOp TERM.RDiv b1 a2)
                                                    else if term_eqb a1 b2' 
                                                    then TUnOp TERM.RNeg  (TBinOp TERM.RDiv b1 a2)
                                                    else if term_eqb a2 b1 
                                                    then  (TBinOp TERM.RDiv a1 b2)
                                                    else if term_eqb a2' b1'
                                                    then  (TBinOp TERM.RDiv a1 b2)
                                                    else if term_eqb a2' b1
                                                    then TUnOp TERM.RNeg  (TBinOp TERM.RDiv a1 b2)
                                                    else if term_eqb a2 b1' 
                                                    then TUnOp TERM.RNeg  (TBinOp TERM.RDiv a1 b2)
                                                    else TBinOp b (term_rm t1) (term_rm t2)
                                             | _ =>let t2':= TUnOp TERM.RNeg t2 in
                                                   let a2':= TUnOp TERM.RNeg a2 in
                                                   if term_eqb a2 t2 then a1
                                                   else if term_eqb a2' t2' then a1
                                                   else if term_eqb a2 t2' then  (TUnOp TERM.RNeg a1)
                                                   else if term_eqb a2' t2 then  (TUnOp TERM.RNeg a1)
                                                   else TBinOp b (term_rm t1) (term_rm t2)
                                             end
                                  | _ => match t2 with
                                      |TBinOp TERM.RDiv b1 b2 
                                             =>let t1':= TUnOp TERM.RNeg t1 in
                                               let b2':= TUnOp TERM.RNeg b2 in
                                               if term_eqb t1 b2 then b1
                                               else if term_eqb t1' b2' then b1
                                               else if term_eqb t1 b2' then  (TUnOp TERM.RNeg b1)
                                               else if term_eqb t1' b2 then  (TUnOp TERM.RNeg b1)
                                               else TBinOp b (term_rm t1) (term_rm t2)
                                      | _ => TBinOp b (term_rm t1) (term_rm t2)
                                      end
                                   end
                   
                   |_ => TBinOp b (term_rm t1) (term_rm t2)
                   end
  |TUnOp u t1 =>match u with
               |TERM.RNeg=>
                        match t1 with 
                        |TUnOp TERM.RNeg t1' => term_rm t1'
                        |_ =>TUnOp u (term_rm t1)
                        end
               |TERM.RAbs=>
                        match t1 with
                        |TUnOp TERM.RAbs t1' => term_rm t1
                        |_ => TUnOp u (term_rm t1)
                        end
               |_ => TUnOp u (term_rm t1)
               end
  |TBinder b x t1 =>TBinder b x (term_rm t1)
  | _ => t
  end.

Definition term_rm_s (pg:proof_goal) (P:prop): option (list prop) :=
  match P with
  |PBinPred o t1 t2 =>Some ((PBinPred o (term_rm t1) (term_rm t2))::nil)
  |_ =>None
  end.

(* 极限的四则运算 *)
Fixpoint term_resemble_lim_operation_right (tm : term) (var : VarName.t) (t : term) : bool :=
  match term_is_lim tm with
  | Some (var', t', _) =>
      if andb (VarName.eqb var var') (term_eqb t t') then true else false
  | None =>
      match tm with
      | TNum _ | TConst _ => true
      | TUnOp u t1 => term_resemble_lim_operation_right t1 var t
      | TBinOp b t1 t2 => andb (term_resemble_lim_operation_right t1 var t) (term_resemble_lim_operation_right t2 var t)
      | _ => false
      end
  end.

Definition prop_resemble_lim_operation (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq t1 t2 =>
      match term_is_lim t1, term_is_lim t2 with
      | Some (var1, tm1, _), None =>
          if term_resemble_lim_operation_right t2 var1 tm1 then 2 else 0
      | None, Some (var2, tm2, _) =>
          if term_resemble_lim_operation_right t1 var2 tm2 then 2 else 0
      | _, _ => 0
      end
  | _ => 0
  end.

Fixpoint lim_collect (tm : term) : option term :=
  match term_is_lim tm with
  | Some (_, _, tm') => Some tm'
  | None =>
      match tm with
      | TNum _ | TConst _ => Some tm
      | TUnOp u t1 =>
          match lim_collect t1 with
          | Some t1' => Some (TUnOp u t1')
          | _ => None
          end
      | TBinOp b t1 t2 =>
          match lim_collect t1, lim_collect t2 with
          | Some t1', Some t2' => Some (TBinOp b t1' t2')
          | _, _ => None
          end
      | _ => None
      end
  end.

Definition lim_operation (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred PROP.REq t1 t2 =>
      match term_is_lim t1, term_is_lim t2 with
      | Some (_, _, t1'), None =>
          match lim_collect t2 with
          | Some t2' =>
              let P' := PBinPred PROP.REq t1' t2' in
              if orb (Poly_check pg P') (Rational_check pg P') then Some nil else None
          | None => None
          end
      | None, Some (_, _, t2') =>
          match lim_collect t1 with
          | Some t1' =>
              let P' := PBinPred PROP.REq t1' t2' in
              if orb (Poly_check pg P') (Rational_check pg P') then Some nil else None
          | None => None
          end
      | _, _ => None
      end
  | _ => None
  end.

Module LimOperationTest.

Definition t1 :=
  (TBinOp TERM.RLim 
((TInfty TERM.Positive_Infty)) (TBinder TERM.LambdaB "x"
((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TNum 1))	((TBinOp TERM.RDiv
	((TUnOp TERM.RCos (((TVar "x" )))))	((TVar "x" ))))))	((TBinOp TERM.RPlus
	((TNum 1))	((TBinOp TERM.RDiv
	((TUnOp TERM.RSin (((TVar "x" )))))	((TVar "x" )))))))))).

Definition t2 :=
  (TBinOp TERM.RDiv
(TBinOp TERM.RPlus (TNum 1) (TBinOp TERM.RLim 
(TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "x" (TBinOp TERM.RDiv
((TUnOp TERM.RCos (((TVar "x" )))))	((TVar "x" ))))))
(TBinOp TERM.RPlus (TNum 1) (TBinOp TERM.RLim 
(TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "x" (TBinOp TERM.RDiv
((TUnOp TERM.RSin (((TVar "x" )))))	((TVar "x" ))))))).
  

Definition P := PBinPred PROP.REq t1 t2.

Compute lim_operation {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1); cont := nil |} P.

End LimOperationTest.

(*由极限表达式生成代换前提*)
Definition lim_assu (t:term) : option prop :=
  match t with
  | TBinOp TERM.RLim t1 t2 =>
                   match t2 with
                   |TBinder b2 x2 t2' =>Some (PBinPred PROP.REq (TVar x2) t1)
                   |_ => None
                   end
  | _ => None
  end.
(*
Compute lim_assu 
(TBinOp TERM.RLim (TNum 0) 
(TBinder TERM.LambdaB " n"
((TBinOp TERM.RMult
	((TBinOp TERM.RDiv
	((TVar "x" ))	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) ((TNum 3))))	((TNum 2))))	((TBinOp TERM.RPlus
	(TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) ((TNum 3)))	((TNum 1))))))))	((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	(TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) (TNum 2))	((TNum 1))))	((TVar "x" )))))))).*)
(*
Compute SYMBOLIC_CHECKER.replace_Eq
(TUnOp TERM.SeqLimit 
(TBinder TERM.LambdaB " n"
((TBinOp TERM.RMult
	((TBinOp TERM.RDiv
	((TVar "x" ))	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) ((TNum 3))))	((TNum 2))))	((TBinOp TERM.RPlus
	(TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) ((TNum 3)))	((TNum 1))))))))	((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	(TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) (TNum 2))	((TNum 1))))	((TVar "x" ))))))))
(PBinPred PROP.REq (TVar "x") (TNum 0))
{|assu := ("h",PBinPred PROP.REq (TVar "x") (TUnOp TERM.ZCeil
(TBinOp TERM.RMult
   (TBinOp TERM.RDiv (TNum 6) (TNum 25))
   (TBinOp TERM.RDiv (TNum 1) (TVar "eps")))))::nil ; concl:= (PBinPred PROP.RGt (TVar "eps") (TNum 0)) |}.
*)

(* 将极限的变量代换进表达式 *)
Definition prop_resemble_lim_replace (P : prop) : Z :=
  match P with
  | PBinPred o t1 t2 => if andb (term_has_lim t1) (negb (term_has_lim t2)) then 2 else 0
  | _ => 0
  end.

Definition lim_replace (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred o t1 t2 =>match lim_assu t1 with 
                   |Some P' => match t1 with
                               |TBinOp TERM.RLim t1' t2' =>
                                    match t2' with
                                    | TBinder b x t3 => Some ((PBinPred o (SYMBOLIC_CHECKER.replace_Eq t3 P' pg) t2) :: nil)
                                    | _ => None
                                    end
                               |_ =>None
                               end
                   |_ => None
                   end
  | _ => None
  end.

(* 三角恒等变换公式 *)

(* sin(x) ^ 2 + cos(x) ^ 2 = 1 *)
Definition term_resemble_tri_identity (tm : term) : bool :=
  match term_symbolic_simplify tm with
  | TBinOp TERM.RPlus (TBinOp TERM.RSqrt tm1 (TNum 2)) (TBinOp TERM.RSqrt tm2 (TNum 2)) => orb (andb (term_is_sin tm1) (term_is_cos tm2)) (andb (term_is_cos tm1) (term_is_sin tm2))
  | _ => false
  end.

Definition prop_resemble_tri_identity (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
       if orb (andb (term_eqb tm1 (TNum 1)) (term_resemble_tri_identity tm2)) (andb (term_eqb tm2 (TNum 1)) (term_resemble_tri_identity tm1)) then 2
       else 0
  | _ => 0
  end.

Definition is_tri_identity (tm : term) : bool :=
  match term_symbolic_simplify tm with
  | TBinOp TERM.RPlus (TBinOp TERM.RSqrt (TUnOp TERM.RSin tm1) (TNum 2)) (TBinOp TERM.RSqrt (TUnOp TERM.RCos tm2) (TNum 2)) =>
       test_eqn_R tm1 tm2
  | TBinOp TERM.RPlus (TBinOp TERM.RSqrt (TUnOp TERM.RCos tm1) (TNum 2)) (TBinOp TERM.RSqrt (TUnOp TERM.RSin tm2) (TNum 2)) =>
       test_eqn_R tm1 tm2
  | _ => false
  end.

Definition tri_identity_replace (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
       if orb (andb (term_eqb tm1 (TNum 1)) (is_tri_identity tm2)) (andb (term_eqb tm2 (TNum 1)) (is_tri_identity tm1)) then Some nil
       else None
  | _ => None
  end.

(*
Compute tri_identity_replace
{| assu := ("h", PBinPred PROP.REq (TVar "x") (TUnOp TERM.ZCeil (TBinOp TERM.RMult (TBinOp TERM.RDiv (TNum 6) (TNum 25))
                (TBinOp TERM.RDiv (TNum 1) (TVar "eps")))))::nil ; concl:= (PBinPred PROP.RGt (TVar "eps") (TNum 0)) ; cont := nil |}
(PBinPred PROP.REq (TBinOp TERM.RPlus (TBinOp TERM.RSqrt (TUnOp TERM.RSin (TVar "x")) (TNum 2)) (TBinOp TERM.RSqrt (TUnOp TERM.RCos (TVar "x")) (TNum 2))) (TNum 1)).
*)

(* 和差化积 *)
Definition term_resemble_tri_product (tm : term) : bool :=
  match term_symbolic_simplify tm with
  | TUnOp TERM.RNeg (TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult tm1 tm2)) | TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult tm1 tm2) =>
       andb (term_is_tri tm1) (term_is_tri tm2)
  | _ => false
  end.

Definition prop_resemble_tri_sum2product (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
       if orb (term_resemble_tri_product tm1) (term_resemble_tri_product tm2) then 2
       else 0
  | _ => 0
  end.

Module FORMULA.

Definition one_left (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RPlus (TUnOp TERM.RSin tm1) (TUnOp TERM.RSin tm2) => Some (tm1, tm2)
  | _ => None
  end.

Definition two_left (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RMinus (TUnOp TERM.RSin tm1) (TUnOp TERM.RSin tm2) => Some (tm1, tm2)
  | _ => None
  end.

Definition three_left (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RPlus (TUnOp TERM.RCos tm1) (TUnOp TERM.RCos tm2) => Some (tm1, tm2)
  | _ => None
  end.

Definition four_left (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RMinus (TUnOp TERM.RCos tm1) (TUnOp TERM.RCos tm2) => Some (tm1, tm2)
  | _ => None
  end.

Definition one_right (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult (TUnOp TERM.RSin tm1) (TUnOp TERM.RCos tm2)) => Some (tm1, tm2)
  | TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult (TUnOp TERM.RCos tm1) (TUnOp TERM.RSin tm2)) => Some (tm2, tm1)
  | _ => None
  end.

Definition two_right := one_right.

Definition three_right (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult (TUnOp TERM.RCos tm1) (TUnOp TERM.RCos tm2)) => Some (tm1, tm2)
  | _ => None
  end.

Definition four_right (tm : term) : option (term * term) :=
  match tm with
  | TUnOp TERM.RNeg (TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RMult (TUnOp TERM.RSin tm1) (TUnOp TERM.RSin tm2))) => Some (tm1, tm2)
  | _ => None
  end.

Definition correspondence_one (left right : term) : bool :=
  match one_left left, one_right right with
  | Some (tm11, tm12), Some (tm21, tm22) =>
       orb (andb (test_eqn_R tm11 (TBinOp TERM.RPlus tm21 tm22)) (test_eqn_R tm12 (TBinOp TERM.RMinus tm21 tm22)))
       (andb (test_eqn_R tm12 (TBinOp TERM.RPlus tm21 tm22)) (test_eqn_R tm11 (TBinOp TERM.RMinus tm21 tm22)))
  | _, _ => false
  end.

Definition correspondence_two (left right : term) : bool :=
  match two_left left, two_right right with
  | Some (tm11, tm12), Some (tm21, tm22) =>
       andb (test_eqn_R tm11 (TBinOp TERM.RPlus tm22 tm21)) (test_eqn_R tm12 (TBinOp TERM.RMinus tm22 tm21))
  | _, _ => false
  end.

Definition correspondence_three (left right : term) : bool :=
  match three_left left, three_right right with
  | Some (tm11, tm12), Some (tm21, tm22) =>
       orb (andb (test_eqn_R tm11 (TBinOp TERM.RPlus tm21 tm22)) (orb (test_eqn_R tm12 (TBinOp TERM.RMinus tm21 tm22)) (test_eqn_R tm12 (TBinOp TERM.RMinus tm22 tm21))))
       (andb (test_eqn_R tm12 (TBinOp TERM.RPlus tm21 tm22)) (orb (test_eqn_R tm11 (TBinOp TERM.RMinus tm21 tm22)) (test_eqn_R tm11 (TBinOp TERM.RMinus tm22 tm21))))
  | _, _ => false
  end.

Definition correspondence_four (left right : term) : bool :=
  match four_left left, four_right right with
  | Some (tm11, tm12), Some (tm21, tm22) =>
       andb (test_eqn_R tm11 (TBinOp TERM.RPlus tm21 tm22)) (orb (test_eqn_R tm12 (TBinOp TERM.RMinus tm21 tm22)) (test_eqn_R tm12 (TBinOp TERM.RMinus tm22 tm21)))
  | _, _ => false
  end.

End FORMULA.

Definition tri_sum2product (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
       if orb (orb (orb (FORMULA.correspondence_one tm1 tm2) (FORMULA.correspondence_one tm2 tm1))
       (orb (FORMULA.correspondence_two tm1 tm2) (FORMULA.correspondence_two tm2 tm1)))
       (orb (orb (FORMULA.correspondence_three tm1 tm2) (FORMULA.correspondence_three tm2 tm1))
       (orb (FORMULA.correspondence_four tm1 tm2) (FORMULA.correspondence_four tm2 tm1)))
       then Some nil else None
  | _ => None
  end.

(* 三角恒等式, 最终应该能够包括前面两个solver *)

Definition prop_resemble_tri_identities (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
       if orb (term_contain_tri tm1) (term_contain_tri tm2) then 2
       else 0
  | _ => 0
  end.

Definition prop_match_tri_identities (pg : proof_goal) (p: prop) : option (list prop) :=
  if existsb (fun x => orb (match TERM_PM.pattern_match_prop_rec p (PPBinPred PROP.REq (fst x) (snd x)) nil nil with | Some _ => true | None => false end) (match TERM_PM.pattern_match_prop_rec p (PPBinPred PROP.REq (snd x) (fst x)) nil nil with | Some _ => true | None => false end)) TriIdentities.tri_identities
  then Some nil
  else None.

(* 三角函数计算 *)
Definition prop_resemble_tri_calculate (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
       if orb (term_contain_tri tm1) (term_contain_tri tm2) then 1
       else 0
  | _ => 0
  end.

Definition tri_calculate (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred o tm1 tm2 => 
      match tri_calculator tm1, tri_calculator tm2 with
      | Some tm1', Some tm2' => Some ((PBinPred o tm1' tm2') :: nil)
      | Some tm1', None => Some ((PBinPred o tm1' tm2) :: nil)
      | None, Some tm2' => Some ((PBinPred o tm1 tm2') :: nil)
      | None, None => None
      end
  | _ => None
  end.

(* 等价无穷小替换，要求有 context *)

Fixpoint extract_first_limmult (cont : list prop_context) : option (VarName.t * term) :=
  match cont with
  | nil => None
  | CLimMult (TVar tmvar) tmval :: _ => Some (tmvar, tmval)
  | _ :: cont' => extract_first_limmult cont'
  end.

Definition prop_resemble_small_replace (P : prop) : Z :=
  match P with
  | PCBinPred _ _ _ cont =>
      if existsb (fun x => match x with | CLimMult _ _ => true | _ => false end) cont then 2 else 0
  | _ => 0
  end.

Definition equal_small_replace (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PCBinPred PROP.RGe t1 t2 cont | PCBinPred PROP.RLe t1 t2 cont | PCBinPred PROP.REq t1 t2 cont  =>
    match extract_first_limmult cont with
    | Some (tmvar, tmval) =>
         match equal_small t1 t2 tmvar tmval with
         | (true, _) => Some nil
         | (false, Some P) => Some (P :: nil)
         | (false, None) => None
         end
    | _ => None
    end
  | _ => None
  end.

(* 周期函数，要求有context *)

Fixpoint get_period_from_cont (cont : list prop_context) : option term :=
  match cont with
  | CPeriodicFun period :: _ => Some period
  | nil => None
  | _ :: cont' => get_period_from_cont cont'
  end.

Definition prop_resemble_periodical (P : prop) : Z :=
  match P with
  | PCBinPred _ _ _ cont =>
      if existsb (fun x => match x with | CPeriodicFun _ => true | _ => false end) cont then 2 else 0
  | _ => 0
  end.

Definition equal_periodical (pg : proof_goal) (P : prop) : option (list prop) := (* should use an external solver *)
  match P with
  | PCBinPred PROP.REq tm1 tm2 cont  =>
      match get_period_from_cont cont with
      | Some period =>
          match tm1, tm2 with
          | TBinOp TERM.RPlus tm11 tm12, _ => if term_eq_P tm12 tm2 then Some nil else None
          | _, TBinOp TERM.RPlus tm21 tm22 => if term_eq_P tm21 tm1 then Some nil else None
          | _, _ => None
          end
      | None => None
      end
  | _ => None
  end.

(* 对数的运算 *)

Definition prop_ln_domain (p : prop) : Z :=
  match p with
  | PBinPred o t1 t2 => if (orb (ln_function.term_has_ln t1) (ln_function.term_has_ln t2)) then 1 else 0
  | _ => 0
  end.

Definition ln_simpl (pg : proof_goal) (p : prop) : option (list prop) :=
  match p with
  | PBinPred o t1 t2 =>
       match ln_function.ln_transfer t1, ln_function.ln_transfer t2 with
       | TUnOp TERM.RLn t1', TUnOp TERM.RLn t2' => (* 运用乘除式 solver 做一步判断 *)
            let p' := PBinPred o t1' t2' in
            if orb (Poly_check pg p') (orb (Rational_check pg p') (muldiv_exp_check pg p')) then Some nil else None
       | _ , _ => None
       end
  | _ => None
  end.

Fixpoint term_ressemble_ln_calcu (tm : term) : bool :=
  match tm with
  | TUnOp TERM.RLn (TConst TERM.RE) => true
  | TUnOp _ tm1 => term_ressemble_ln_calcu tm1
  | TBinOp _ tm1 tm2 => orb (term_ressemble_ln_calcu tm1) (term_ressemble_ln_calcu tm2)
  | TApply tm1 tm2 => orb (term_ressemble_ln_calcu tm1) (term_ressemble_ln_calcu tm2)
  | _ => false
  end.

Definition prop_ressemble_ln_calcu (p : prop) : Z :=
  match p with
  | PBinPred o t1 t2 => if orb (term_ressemble_ln_calcu t1) (term_ressemble_ln_calcu t2) then 2 else 0
  | _ => 0
  end.

Fixpoint ln_calcu_helper (tm: term) : term :=
  match tm with
  | TUnOp TERM.RLn (TConst TERM.RE) => TNum 1
  | TUnOp u tm1 => TUnOp u (ln_calcu_helper tm1)
  | TBinOp b tm1 tm2 => TBinOp b (ln_calcu_helper tm1) (ln_calcu_helper tm2)
  | TApply tm1 tm2 => TApply (ln_calcu_helper tm1) (ln_calcu_helper tm2)
  | _ => tm
  end.

Definition ln_calcu (pg : proof_goal) (p : prop) : option (list prop) :=
  match p with
  | PBinPred o t1 t2 => Some (PBinPred o (ln_calcu_helper t1) (ln_calcu_helper t2) :: nil)
  | _ => None
  end.

(* 函数应用 *)
Fixpoint hypo_eq_checker (tm : term) (hypos : list prop) : option term :=
  match hypos with
  | hypo :: hypos' =>
       match hypo with
       | PBinPred PROP.REq tm1 tm2 =>
            if term_eqb tm tm1 then Some tm2 else if term_eqb tm tm2 then Some tm1 else None
       | _ => hypo_eq_checker tm hypos'
       end
  | _ => None
  end.

Fixpoint hypo_eq_checker_list (tm : term) (hypos : list prop) : list term :=
  match hypos with
  | hypo :: hypos' =>
       match hypo with
       | PBinPred PROP.REq tm1 tm2 =>
            if term_eqb tm tm1 then tm2 :: (hypo_eq_checker_list tm hypos') else if term_eqb tm tm2 then tm1 :: (hypo_eq_checker_list tm hypos') else hypo_eq_checker_list tm hypos'
       | _ => hypo_eq_checker_list tm hypos'
       end
  | _ => nil
  end.

Fixpoint term_resemble_func_app (tm : term) : bool :=
  match tm with
  | TApply _ _ => true
  | TUnOp _ t1 => term_resemble_func_app t1
  | TBinOp _ t1 t2 => orb (term_resemble_func_app t1) (term_resemble_func_app t2)
  | TBinder _ _ t1 => term_resemble_func_app t1
  | _ => false
  end.

Definition prop_resemble_func_app (P : prop) : Z :=
  match P with
  | PBinPred _ t1 t2 => if orb (term_resemble_func_app t1) (term_resemble_func_app t2) then 1 else 0
  | _ => 0
  end.

Fixpoint term_func_app (pg : proof_goal) (tm : term) : term * bool :=
  let hypos := map (fun x => snd x) (assu pg) in
  match tm with
  | TApply t1 t2 =>
       match t1 with
       | TVar x =>
            match hypo_eq_checker t1 hypos with
            | Some (TBinder TERM.LambdaB x t1') =>
                 (subst_term t1' ((x, t2) :: nil) , true)
            | _ => (tm, false)
            end
       | TBinder TERM.LambdaB x t1' =>
             (subst_term t1' ((x, t2) :: nil) , true)
       | _ => (tm, false)
       end
  | TUnOp u t1 =>
       let temp1 := (term_func_app pg t1) in
       (TUnOp u (fst temp1), snd temp1)
  | TBinOp b t1 t2 =>
       let temp1 := (term_func_app pg t1) in
       let temp2 := (term_func_app pg t2) in
       (TBinOp b (fst temp1) (fst temp2), orb (snd temp1) (snd temp2))
  | TBinder b x t1 =>
       let temp1 := (term_func_app pg t1) in
       (TBinder b x (fst temp1), snd temp1)
  | TInterval t t1 t2 =>
       let temp1 := (term_func_app pg t1) in
       let temp2 := (term_func_app pg t2) in
       (TInterval t (fst temp1) (fst temp2), orb (snd temp1) (snd temp2))
  | _ => (tm, false)
  end.

Definition prop_func_app (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred o t1 t2 =>
       let temp1 := (term_func_app pg t1) in
       let temp2 := (term_func_app pg t2) in
       if orb (snd temp1) (snd temp2)
       then Some ((PBinPred o (fst temp1) (fst temp2)) :: nil)
       else None
  | _ => None
  end.

(* 求导 *)
Fixpoint term_has_deri (t : term) : bool :=
  match t with
  | TUnOp u t1 =>
      if TERM.UnOp_eqb u TERM.Deri then true
      else term_has_deri t1
  | TBinOp b t1 t2 =>
      orb (term_has_deri t1) (term_has_deri t2)
  | TApply t1 t2 =>
      orb (term_has_deri t1) (term_has_deri t2)
  | TBinder b x t1 =>
      term_has_deri t1
  | TInterval t t1 t2 =>
      orb (term_has_deri t1) (term_has_deri t2)
  | _ => false
  end.

Definition prop_has_deri (P : prop) : Z :=
  match P with
  | PBinPred o t1 t2 => if orb (term_has_deri t1) (term_has_deri t2) then 2 else 0
  | _ => 0
  end.

Module Deri.

Fixpoint has_x (x : VarName.t) (t : term) : bool :=
  match t with
  | TUnOp _ t' => has_x x t'
  | TBinOp _ t1 t2 => has_x x t1 || has_x x t2
  | TVar x' => String.eqb x' x
  | TApply _ t' => has_x x t'
  | _ => false
  end.

Definition apply_fun (t : term) : option term :=
  match t with
  | TApply t1 t2 =>
       match t1 with
       | TBinder TERM.LambdaB x t1' =>
             Some (subst_term t1' ((x, t2) :: nil))
       | _ => None
       end
  | _ => None
  end.

Definition term_minus_one (tm : term) : term :=
  match tm with
  | TNum z => TNum (z - 1)
  | _ => TBinOp TERM.RMinus tm (TNum 1)
  end.

Fixpoint compute_deri (x : VarName.t) (t : term) : option term :=
  let helper := fun tm : option term => match tm with | Some tm' => Some (term_symbolic_simplify' tm') | None => None end in
  helper (match t with
  | TNum z => Some (TNum 0)
  | TConst c => Some (TNum 0)
  | TUnOp u t' =>if Deri.has_x x t' then
                match u with
                | TERM.RSin => match compute_deri x t' with
                              | Some t'' =>
                                    Some (TBinOp TERM.RMult t'' (TUnOp TERM.RCos t'))
                              | None => None
                              end    
                | TERM.RCos =>  match compute_deri x t' with
                              | Some t'' =>
                                    Some (TBinOp TERM.RMult t'' (TUnOp TERM.RNeg (TUnOp TERM.RSin t')))
                              | None => None
                              end
                | TERM.RLn =>  match compute_deri x t' with
                              | Some t'' =>
                                    Some (TBinOp TERM.RDiv t'' t')
                              | None => None
                              end
                | TERM.RNeg => match compute_deri x t' with
                              | Some t'' =>Some (TUnOp u t'')
                              | None => None
                              end
                | TERM.Deri => compute_deri x t'
                | _ => None
                end
                else Some (TNum 0)
  | TBinOp b t1 t2 => match b with
                    | TERM.RDiv => match (compute_deri x t1),(compute_deri x t2) with
                                  | Some t1' ,Some t2' =>                    
                                        Some (TBinOp TERM.RDiv (TBinOp TERM.RMinus (TBinOp TERM.RMult t1' t2)(TBinOp TERM.RMult t2' t1))(TBinOp TERM.RPower t2 (TNum 2)))
                                  | _, _ => None
                                  end      
                    | TERM.RMult => match Deri.has_x x t1, Deri.has_x x t2 with
                                  | true, true =>
                                       match compute_deri x t1, compute_deri x t2 with
                                       | Some t1', Some t2' => Some (TBinOp TERM.RPlus (TBinOp TERM.RMult t1' t2) (TBinOp TERM.RMult t1 t2'))
                                       | _, _ => None
                                       end
                                  | true, false =>
                                       match compute_deri x t1 with
                                       | Some t1' => Some (TBinOp TERM.RMult t1' t2)
                                       | None => None
                                       end
                                  | false, true =>
                                       match compute_deri x t2 with
                                       | Some t2' => Some (TBinOp TERM.RMult t1 t2')
                                       | None => None
                                       end
                                  | false, false => Some (TNum 0)
                                  end
                    | TERM.RMinus => match Deri.has_x x t1, Deri.has_x x t2 with
                                    | true, true =>
                                         match compute_deri x t1, compute_deri x t2 with
                                         | Some t1', Some t2' => Some (TBinOp TERM.RMinus t1' t2')
                                         | _, _ => None
                                         end
                                    | true, false => compute_deri x t1
                                    | false, true => compute_deri x t2
                                    | false, false => Some (TNum 0)
                                    end
                    | TERM.RPlus => match Deri.has_x x t1, Deri.has_x x t2 with
                                    | true, true =>
                                         match compute_deri x t1, compute_deri x t2 with
                                         | Some t1', Some t2' => Some (TBinOp TERM.RPlus t1' t2')
                                         | _, _ => None
                                         end
                                    | true, false => compute_deri x t1
                                    | false, true => compute_deri x t2
                                    | false, false => Some (TNum 0)
                                    end
                    | TERM.RPower => match Deri.has_x x t1, Deri.has_x x t2 with
                                     | true, false =>
                                          match compute_deri x t1 with
                                          | Some t1' => Some (TBinOp TERM.RMult t2 (TBinOp TERM.RMult t1' (TBinOp TERM.RPower t1 (Deri.term_minus_one t2))))
                                          | None => None
                                          end
                                     | false, true =>
                                          match compute_deri x t2 with
                                          | Some t2' => Some (TBinOp TERM.RMult t2' (TBinOp TERM.RMult (TUnOp TERM.RLn t1) (TBinOp TERM.RPower t1 t2)))
                                          | None => None
                                          end
                                     | false, false => Some (TNum 0)
                                     | true, true => None
                                     end
                    | TERM.RSqrt => match (compute_deri x t2) with
                                   | Some t2' =>
                                        Some (TBinOp TERM.RMult t2' (TBinOp TERM.RMult (TBinOp TERM.RDiv (TNum 1) t1) (TBinOp TERM.RPower t2 (TBinOp TERM.RMinus (TBinOp TERM.RDiv (TNum 1) t1) (TNum 1)))))
                                   | None => None 
                                   end
                    | _ => None
                    end
  | TVar x' => if String.eqb x x' then Some (TNum 1)
			   else Some (TNum 0)
  | TApply (TVar f) tm' =>
      match compute_deri x tm' with
	  | None => None
	  | Some (TNum 0) => Some (TNum 0)
	  | Some tm'' => Some (TBinOp TERM.RMult (TApply (TUnOp TERM.Deri (TVar f)) tm') tm'')
	  end (* a temporary expedient for lack of function list *)
  | TBinder TERM.LambdaB x' tm' =>
      match compute_deri x tm' with
      | None => None
      | Some tm'' => Some (TBinder TERM.LambdaB x' tm'')
      end
  | _ => None
  end).

Fixpoint term_deri (hypos : list prop) (t : term) (fee : nat) : option term :=
  match fee with | O => None | S fee' =>
  match t with
  | TUnOp u t1 =>
      match u with
      | TERM.Deri => (* we are always supposed to derive a function *)
          match func_calculator hypos t1 fee' with
          | Some (TBinder TERM.LambdaB x t1') =>
              match Deri.compute_deri x t1' with
              | Some t1'' => Some (TBinder TERM.LambdaB x t1'')
              | None => None
              end
          | _ => None
          end
      | _ =>
          match term_deri hypos t1 fee' with
          | Some t1' => Some (TUnOp u t1')
          | None => None
          end
      end
  | TApply t1 t2 =>
      match term_deri hypos t1 fee', term_deri hypos t2 fee' with
      | Some t1', Some t2' =>
          match func_calculator hypos t1' fee' with
          | Some t1'' => Deri.apply_fun (TApply t1'' t2')
          | None => None
          end
      | Some t1', None =>
          match func_calculator hypos t1' fee' with
          | Some t1'' => Deri.apply_fun (TApply t1'' t2)
          | None => None
          end
      | None, Some t2' => Deri.apply_fun (TApply t1 t2')
      | None, None => None
      end
  | TBinOp b t1 t2 =>
      match term_deri hypos t1 fee', term_deri hypos t2 fee' with
      | Some t1', Some t2' => Some (TBinOp b t1' t2')
      | Some t1', None => Some (TBinOp b t1' t2)
      | None, Some t2' => Some (TBinOp b t1 t2')
      | None, None => None
      end
  | TBinder b x t1 =>
      match term_deri hypos t1 fee' with
      | Some t1' => Some (TBinder b x t1')
      | None => None
      end
  | TInterval t t1 t2 =>
      match term_deri hypos t1 fee', term_deri hypos t2 fee' with
      | Some t1', Some t2' => Some (TInterval t t1' t2')
      | Some t1', None => Some (TInterval t t1' t2)
      | None, Some t2' => Some (TInterval t t1 t2')
      | None, None => None
      end
  | _ => None
  end end
with func_calculator (hypos : list prop) (t : term) (fee : nat) : option term :=
  match fee with | O => None | S fee' =>
  match t with (* calculate the expression of a function, such as f + g *)
  | TBinder TERM.LambdaB _ _ => Some t
  | TUnOp u t1 =>
      match u with
      | TERM.Deri =>
        match term_deri hypos t fee' with
        | Some t' =>
            match term_is_func t' with
            | Some (var1, t1') =>
                Some (TBinder TERM.LambdaB var1 t1')
            | _ => None
            end
        | None => None
        end
      | _ =>
        match term_is_func t1 with
        | Some (var1, t1') =>
            Some (TBinder TERM.LambdaB var1 (TUnOp u t1'))
        | _ => None
        end
      end
  | TBinOp b t1 t2 =>
      match term_is_func t1, term_is_func t2 with
      | Some (var1, t1'), Some (var2, t2') =>
          if (VarName.eqb var1 var2) then Some (TBinder TERM.LambdaB var1 (TBinOp b t1' t2')) else None
      | _, _ => None
      end
  | TApply _ _ =>
      match apply_fun t with
      | Some t' =>
          match term_is_func t' with
          | Some (var, t'') => Some (TBinder TERM.LambdaB var t'')
          | None => None
          end
      | None => None
      end
  | TVar x =>
      match find_term_in_list_prop hypos (TVar x) with
      | Some t' =>
          match term_is_func t' with
          | Some (var, t'') => Some (TBinder TERM.LambdaB var t'')
          | None => None
          end
      | None => None
      end
  | _ => None
  end end.

End Deri.

Module DeriTest.

Definition t1 : term :=
  TBinOp TERM.RPlus (TApply (TUnOp TERM.Deri (TBinder TERM.LambdaB "x" (TBinOp TERM.RPower (TVar "x") (TNum 2)))) (TNum 2)) (TNum 1).

Compute Deri.term_deri nil t1 100.

Definition hypos : list prop :=
(PBinPred PROP.REq (TVar "f") (TBinder TERM.LambdaB "x" (TBinOp TERM.RPower (TVar "x") (TNum 2)))) ::
(PBinPred PROP.REq (TVar "g") (TBinder TERM.LambdaB "x" (TBinOp TERM.RPower (TVar "x") (TNum 3)))) ::
nil.

Definition t2 : term :=
  TApply (TBinOp TERM.RPlus (TUnOp TERM.Deri (TVar "f")) (TUnOp TERM.Deri (TUnOp TERM.Deri (TVar "g")))) (TVar "y").

Compute Deri.term_deri hypos t2 100.

End DeriTest.

Definition prop_deri (pg : proof_goal) (P : prop) : option (list prop) :=
  let hypos := map (fun x => snd x) (assu pg) in
  match P with
  | PBinPred o t1 t2 => match (Deri.term_deri hypos t1 100), (Deri.term_deri hypos t2 100) with
                   | Some t1', Some t2' => Some ((PBinPred o t1' t2') :: nil)
                   | Some t1', None => Some ((PBinPred o t1' t2) :: nil)
                   | None, Some t2' => Some ((PBinPred o t1 t2') :: nil)
                   | None, None => None
                   end
  | _ => None
  end.

(* 洛必达法则 *)
Definition term_resemble_hopital_rule (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RLim _ (TBinder TERM.LambdaB _ (TBinOp TERM.RDiv _ _)) => true
  | _ => false
  end.

Definition prop_resemble_hopital_rule (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq t1 t2 => if andb (term_resemble_hopital_rule t1) (term_resemble_hopital_rule t2) then 1 else 0
  | _ => 0
  end.

Definition hopital_rule (pg : proof_goal) (P : prop) : option (list prop) :=
  let hypos := map (fun x => snd x) (assu pg) in
  match P with
  | PBinPred PROP.REq t1 t2 =>
      match t1, t2 with
      | TBinOp TERM.RLim ta (TBinder TERM.LambdaB vara (TBinOp TERM.RDiv t11 t12)), TBinOp TERM.RLim tb (TBinder TERM.LambdaB varb (TBinOp TERM.RDiv t21 t22)) =>
          if andb (VarName.eqb vara varb) (term_eqb ta tb)
          then match Deri.term_deri hypos (TApply (TUnOp TERM.Deri (TBinder TERM.LambdaB vara t11)) (TVar vara)) 100, Deri.term_deri hypos (TApply (TUnOp TERM.Deri (TBinder TERM.LambdaB varb t12)) (TVar varb)) 100 with
               | Some t11', Some t12' =>
                   let P' := PBinPred PROP.REq (TBinOp TERM.RDiv t11' t12') (TBinOp TERM.RDiv t21 t22) in
                   Rational_check_s pg P'
               | _, _ => None
               end
          else None
      | _, _ => None
      end
  | _ => None
  end.

(* 求极限 *)
Definition find_replace (tm: term) (pg: proof_goal): option term :=
  let helper1 := fix f lst :=
                match lst with
                | p :: lst' =>
                    match p with
                    | PBinPred PROP.REq tm1 tm2 => (tm1, tm2) :: f lst'
                    | _ => f lst'
                    end
                | nil => nil
                end in
  let term_pair := helper1 (map (fun x => snd x) pg.(assu)) in
  let helper2 := fix f (lst: list (term * term)) :=
                match lst with
                | p :: lst' =>
                    let (tm1, tm2) := p in
                    if term_eqb tm tm1 then Some tm2
                    else if term_eqb tm tm2 then Some tm1
                    else f lst'
                | nil => None
                end in
  helper2 term_pair.

Definition relation_after_lim (b: PROP.BinOp): option PROP.BinOp :=
  match b with
  | PROP.HasOrder PROP.REq | PROP.HasOrder PROP.RGe | PROP.HasOrder PROP.RLe => Some b
  | PROP.HasOrder PROP.RGt => Some (PROP.HasOrder PROP.RGe)
  | PROP.HasOrder PROP.RLt => Some (PROP.HasOrder PROP.RLe)
  | _ => None
  end.

Fixpoint term_take_lim (tm: term) (var: VarName.t) (val: term) (pg: proof_goal): option term :=
  match find_replace (TBinOp TERM.RLim val (TBinder TERM.LambdaB var tm)) pg with
  | Some tm' => Some tm'
  | None =>
  match tm with
  | TNum _ | TInfty _ | TConst _ => Some tm
  | TUnOp u tm1 =>
      match term_take_lim tm1 var val pg with
      | Some tm1' => Some (TUnOp u tm1')
      | _ => None
      end
  | TBinOp b tm1 tm2 =>
      match term_take_lim tm1 var val pg, term_take_lim tm2 var val pg with
      | Some tm1', Some tm2' => Some (TBinOp b tm1' tm2')
      | _, _ => None
      end
  | TApply tm1 tm2 =>
      match term_take_lim tm1 var val pg, term_take_lim tm2 var val pg with
      | Some tm1', Some tm2' => Some (TApply tm1' tm2')
      | _, _ => None
      end
  | TVar x =>
      if VarName.eqb x var then Some val else Some tm
  | _ => None
  end
  end.

Definition prop_take_lim (p: prop) (var: VarName.t) (val: term) (pg: proof_goal): option prop :=
  match p with
  | PBinPred b tm1 tm2 =>
      match relation_after_lim b with
      | Some b' =>
          match term_take_lim tm1 var val pg, term_take_lim tm2 var val pg with
          | Some tm1', Some tm2' =>
              Some (PBinPred b' tm1' tm2')
          | _, _ => None
          end
      | None => None
      end
  | _ => None
  end.


(* 夹逼定理 *)
Definition prop_resemble_squeeze_theorem (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq t1 t2 => if andb (term_has_lim t1) (negb (term_has_lim t2)) then 1 else 0
  | _ => 0
  end.

Fixpoint find_order (hypos : list prop) (tm : term) (o : PROP.ROrder) : list term :=
  match hypos with
  | hypo :: hypos' =>
       match hypo with
       | PBinPred (PROP.HasOrder o') t1 t2 =>
            if andb (PROP.ROrder_eqb o o') (term_eqb t1 tm) then t2 :: (find_order hypos' tm o)
            else if andb (PROP.ROrder_eqb o (SYMBOLIC_CHECKER.ROrder_rev o')) (term_eqb t2 tm) then t1 :: (find_order hypos' tm o)
            else find_order hypos' tm o
       | _ => find_order hypos' tm o
       end
  | nil => nil
  end.

Definition squeeze_theorem (pg : proof_goal) (P : prop) : option (list prop) :=
  let hypos := map (fun x => snd x) (assu pg) in
  match P with
  | PBinPred PROP.REq (TBinOp RLim val (TBinder TERM.LambdaB var t1)) t2 =>
       let bigger := app (find_order hypos t1 PROP.RLe) (find_order hypos t1 PROP.RLt) in
       let smaller := app (find_order hypos t1 PROP.RGe) (find_order hypos t1 PROP.RGt) in
       let bigger_lim := concat (map (fun x => hypo_eq_checker_list (TBinOp RLim val (TBinder TERM.LambdaB var x)) hypos) bigger) in
       let smaller_lim := concat (map (fun x => hypo_eq_checker_list (TBinOp RLim val (TBinder TERM.LambdaB var x)) hypos) smaller) in
       let possible_lim := list_extract_dup term_eqb bigger_lim smaller_lim in
       if existsb (term_eqb t2) possible_lim then Some nil else None
  | _ => None
  end.

(* x = e ^ ln (x) 变形，使用乘除式排除指数的潜在干扰 *)
Fixpoint term_resemble_eln (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RPower (TConst TERM.RE) tm2 => ln_function.term_has_ln tm2
  | TBinOp _ tm1 tm2 => orb (term_resemble_eln tm1) (term_resemble_eln tm2)
  | TUnOp _ tm1 => term_resemble_eln tm1
  | TApply tm1 tm2 => orb (term_resemble_eln tm1) (term_resemble_eln tm2)
  | TBinder _ _ tm1 => term_resemble_eln tm1
  | TInterval _ tm1 tm2 => orb (term_resemble_eln tm1) (term_resemble_eln tm2)
  | _ => false
  end.

Definition prop_resemble_eln (P : prop) : Z :=
  match P with
  | PBinPred PROP.REq tm1 tm2 =>
      if orb (term_resemble_eln tm1) (term_resemble_eln tm2) then 2 else 0
  | _ => 0
  end.

Definition eln_transformation (pg : proof_goal) (P : prop) : option (list prop) :=
  match P with
  | PBinPred PROP.REq tm1 tm2 => if term_eq_MDELn tm1 tm2 then Some nil else None
  | _ => None
  end.

Module ELnTest.

(* e^(a*b+c*ln(d)) = e^(a*b)*d^c *)

Definition tm1 := TBinOp TERM.RPower (TConst TERM.RE)
(TBinOp TERM.RPlus (TBinOp TERM.RMult (TVar "a") (TVar "b")) (TBinOp TERM.RMult (TVar "c") (TUnOp TERM.RLn (TVar "d")))).

Definition tm2 := TBinOp TERM.RMult (TBinOp TERM.RPower (TConst TERM.RE) (TBinOp TERM.RMult (TVar "a") (TVar "b")))
(TBinOp TERM.RPower (TVar "d") (TVar "c")).

Compute eln_transformation {| assu := nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} (PBinPred PROP.REq tm1 tm2).

End ELnTest.

(* 去除函数头 *)
Fixpoint term_lambda_remove (tm : term) : term :=
  match tm with
  | TBinder TERM.LambdaB var tm' =>
      term_lambda_remove tm'
  | _ => tm
  end.

Fixpoint prop_lambda_remove (p : prop) : prop :=
  match p with
  | PLongOrder o tm1 p1 => PLongOrder o (term_lambda_remove tm1) (prop_lambda_remove p1)
  | PUnPred u tm1 => PUnPred u (term_lambda_remove tm1)
  | PBinPred b tm1 tm2 => PBinPred b (term_lambda_remove tm1) (term_lambda_remove tm2)
  | PCBinPred b tm1 tm2 cont => PCBinPred b (term_lambda_remove tm1) (term_lambda_remove tm2) cont
  | PUnOp u p1 => PUnOp u (prop_lambda_remove p1)
  | PBinOp b p1 p2 => PBinOp b (prop_lambda_remove p1) (prop_lambda_remove p2)
  | PQuant q x p1 => PQuant q x (prop_lambda_remove p1)
  end.

Definition lambda_remove (pg : proof_goal) (P : prop) : option (list prop) :=
  let P' := prop_lambda_remove P in
  if prop_eqb P P' then None
  else Some (P' :: nil).

(* 等价变形 *)
Definition equ_trans_Poly (pg : proof_goal) (p1 p2 : prop) : bool :=
  match p1, p2 with
  | PBinPred o1 tm11 tm12, PBinPred o2 tm21 tm22 =>
       if PROP.BinOp_eqb o1 o2
       then orb (Poly_check pg (PBinPred o1 (TBinOp TERM.RMinus tm11 tm21) (TBinOp TERM.RMinus tm12 tm22))) (Poly_check pg (PBinPred o1 (TBinOp TERM.RMinus tm11 tm22) (TBinOp TERM.RMinus tm12 tm21)))
       else false
  | _, _ => false
  end.

Definition equ_trans_Rational (pg : proof_goal) (p1 p2 : prop) : bool :=
  match p1, p2 with
  | PBinPred o1 tm11 tm12, PBinPred o2 tm21 tm22 =>
       if PROP.BinOp_eqb o1 o2
       then orb (Rational_check pg (PBinPred o1 (TBinOp TERM.RDiv tm11 tm21) (TBinOp TERM.RDiv tm12 tm22))) (Rational_check pg (PBinPred o1 (TBinOp TERM.RDiv tm11 tm22) (TBinOp TERM.RDiv tm12 tm21)))
       else false
  | _, _ => false
  end.

Definition equ_trans_MuldivExp (pg : proof_goal) (p1 p2 : prop) : bool :=
  match p1, p2 with
  | PBinPred o1 tm11 tm12, PBinPred o2 tm21 tm22 =>
      let t1 := muldiv_exp.diff (muldiv_exp.eval tm11) (muldiv_exp.eval tm21) in
      let t2 := muldiv_exp.diff (muldiv_exp.eval tm12) (muldiv_exp.eval tm22) in
      if muldiv_exp.eqb t1 t2 then
      (match o1, o2 with
      | PROP.REq, PROP.REq => new_MuldivExp_check pg (PBinPred o1 (TBinOp TERM.RDiv tm11 tm21) (TBinOp TERM.RDiv tm12 tm22))
      | PROP.RGe, PROP.RGe | PROP.RLe, PROP.RLe | PROP.RGt, PROP.RGt | PROP.RLt, PROP.RLt =>
          muldiv_exp.sign_determination true t1 (muldiv_exp.prop_transformation pg)
      | PROP.RGe, PROP.RLe | PROP.RLe, PROP.RGe | PROP.RGt, PROP.RLt | PROP.RLt, PROP.RGt =>
          muldiv_exp.sign_determination false t1 (muldiv_exp.prop_transformation pg)
      | _, _ => false
      end) else false
  | _, _ => false
  end.

Module EquTransMuldivExpTest.

Definition p1 := PBinPred PROP.RGt (TBinOp TERM.RMult (TVar "a") (TVar "b")) (TVar "c").

Definition p2 := PBinPred PROP.RGt (TBinOp TERM.RMult (TVar "d") (TBinOp TERM.RMult (TVar "a") (TVar "b"))) (TBinOp TERM.RMult (TVar "d") (TVar "c")).

Definition hypo1 := PBinPred PROP.RGt (TVar "d") (TNum 0).

Compute equ_trans_MuldivExp {| assu := ("1", hypo1) :: nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} p1 p2.

(* ab > c
-> abd/e < cd/e *)

Definition p3 := PBinPred PROP.RGt (TBinOp TERM.RMult (TVar "a") (TVar "b")) (TVar "c").

Definition p4 := PBinPred PROP.RLt (TBinOp TERM.RDiv (TBinOp TERM.RMult (TVar "d") (TBinOp TERM.RMult (TVar "a") (TVar "b"))) (TVar "e")) (TBinOp TERM.RDiv (TBinOp TERM.RMult (TVar "d") (TVar "c")) (TVar "e")).

Definition hypo2 := PBinPred PROP.RLt (TBinOp TERM.RDiv (TNum 1) (TVar "e")) (TNum 0).

Compute equ_trans_MuldivExp {| assu := ("1", hypo1) :: ("2", hypo2) :: nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} p3 p4.

Definition p5 := PBinPred PROP.RGe (TVar "a") (TVar "b").

Definition p6 := PBinPred PROP.RGe (TBinOp TERM.RMult (TUnOp TERM.RAbs (TVar "x")) (TVar "a")) (TBinOp TERM.RMult (TUnOp TERM.RAbs (TVar "x")) (TVar "b")).

Compute equ_trans_MuldivExp {| assu := nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} p5 p6.

End EquTransMuldivExpTest.

Definition equ_trans_MuldivBase (pg : proof_goal) (p1 p2 : prop) : bool :=
  match p1, p2 with
  | PBinPred o1 tm11 tm12, PBinPred o2 tm21 tm22 =>
      let t1 := muldiv_base.diff (muldiv_base.eval tm11) (muldiv_base.eval tm21) in
      let t2 := muldiv_base.diff (muldiv_base.eval tm12) (muldiv_base.eval tm22) in
      if muldiv_base.eqb t1 t2 then
      (match o1, o2 with
      | PROP.REq, PROP.REq => new_MuldivExp_check pg (PBinPred o1 (TBinOp TERM.RDiv tm11 tm21) (TBinOp TERM.RDiv tm12 tm22))
      | PROP.RGe, PROP.RGe | PROP.RLe, PROP.RLe | PROP.RGt, PROP.RGt | PROP.RLt, PROP.RLt =>
          muldiv_base.sign_determination true t1 (muldiv_base.prop_transformation pg)
      | PROP.RGe, PROP.RLe | PROP.RLe, PROP.RGe | PROP.RGt, PROP.RLt | PROP.RLt, PROP.RGt =>
          muldiv_base.sign_determination false t1 (muldiv_base.prop_transformation pg)
      | _, _ => false
      end) else false
  | _, _ => false
  end.

Module EquTransMuldivBaseTest.

(* a^n <= b^n
-> (a/c)^n >= (b/c)^n *)

Definition p1 := PBinPred PROP.RLe (TBinOp TERM.RPower (TVar "a") (TVar "n")) (TBinOp TERM.RPower (TVar "b") (TVar "n")).

Definition p2 := PBinPred PROP.RGe (TBinOp TERM.RPower (TBinOp TERM.RDiv (TVar "a") (TVar "c")) (TVar "n")) (TBinOp TERM.RPower (TBinOp TERM.RDiv (TVar "b") (TVar "c")) (TVar "n")).

Definition hypo1 := PBinPred PROP.RGt (TNum 0) (TBinOp TERM.RPower (TVar "c") (TVar "n")).

Compute equ_trans_MuldivBase {| assu := ("1", hypo1) :: nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} p1 p2.

End EquTransMuldivBaseTest.

Definition equ_trans_MultiMuldivExp (pg : proof_goal) (p1 p2 : prop) : bool :=
  match p1, p2 with
  | PBinPred o1 tm11 tm12, PBinPred o2 tm21 tm22 =>
      let t1 := multi_muldiv_exp.diff (multi_muldiv_exp.eval tm11) (multi_muldiv_exp.eval tm21) in
      let t2 := multi_muldiv_exp.diff (multi_muldiv_exp.eval tm12) (multi_muldiv_exp.eval tm22) in
      match t1, t2 with
      | Some t1', Some t2' =>
          match multi_muldiv_exp.squash t1', multi_muldiv_exp.squash t2' with
          | Some t1'', Some t2'' =>
              if muldiv_exp.eqb t1'' t2'' then
              (match o1, o2 with
              | PROP.REq, PROP.REq => new_MuldivExp_check pg (PBinPred o1 (TBinOp TERM.RDiv tm11 tm21) (TBinOp TERM.RDiv tm12 tm22))
              | PROP.RGe, PROP.RGe | PROP.RLe, PROP.RLe | PROP.RGt, PROP.RGt | PROP.RLt, PROP.RLt =>
                  muldiv_exp.sign_determination true t1'' (muldiv_exp.prop_transformation pg)
              | PROP.RGe, PROP.RLe | PROP.RLe, PROP.RGe | PROP.RGt, PROP.RLt | PROP.RLt, PROP.RGt =>
                  muldiv_exp.sign_determination false t1'' (muldiv_exp.prop_transformation pg)
              | _, _ => false
              end) else false
          | _, _ => false
          end
      | _, _ => false
      end
  | _, _ => false
  end.

Module EquTransMultiMuldivExpTest.

Definition p1 := PBinPred PROP.RGe (TBinOp TERM.RPlus (TVar "a") (TVar "b"))
(TBinOp TERM.RMinus (TVar "c") (TVar "d")).

Definition p2 := PBinPred PROP.RLe (TBinOp TERM.RPlus (TBinOp TERM.RMult (TVar "e") (TBinOp TERM.RDiv (TVar "a") (TVar "f"))) (TBinOp TERM.RMult (TVar "e") (TBinOp TERM.RDiv (TVar "b") (TVar "f"))))
(TBinOp TERM.RMinus (TBinOp TERM.RMult (TVar "e") (TBinOp TERM.RDiv (TVar "c") (TVar "f"))) (TBinOp TERM.RMult (TVar "e") (TBinOp TERM.RDiv (TVar "d") (TVar "f")))).

Definition hypo1 := PBinPred PROP.RLt (TVar "e") (TNum 0).

Definition hypo2 := PBinPred PROP.RGt (TVar "f") (TNum 0).

Compute equ_trans_MultiMuldivExp {| assu := ("1", hypo1) :: ("2", hypo2) :: nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} p1 p2.

End EquTransMultiMuldivExpTest.

Definition equ_trans_MultiMuldivBase (pg : proof_goal) (p1 p2 : prop) : bool :=
  match p1, p2 with
  | PBinPred o1 tm11 tm12, PBinPred o2 tm21 tm22 =>
      let t1 := multi_muldiv_base.diff (multi_muldiv_base.eval tm11) (multi_muldiv_base.eval tm21) in
      let t2 := multi_muldiv_base.diff (multi_muldiv_base.eval tm12) (multi_muldiv_base.eval tm22) in
      match t1, t2 with
      | Some t1', Some t2' =>
          match multi_muldiv_base.squash t1', multi_muldiv_base.squash t2' with
          | Some t1'', Some t2'' =>
              if muldiv_base.eqb t1'' t2'' then
              (match o1, o2 with
              | PROP.REq, PROP.REq => new_MuldivExp_check pg (PBinPred o1 (TBinOp TERM.RDiv tm11 tm21) (TBinOp TERM.RDiv tm12 tm22))
              | PROP.RGe, PROP.RGe | PROP.RLe, PROP.RLe | PROP.RGt, PROP.RGt | PROP.RLt, PROP.RLt =>
                  muldiv_base.sign_determination true t1'' (muldiv_base.prop_transformation pg)
              | PROP.RGe, PROP.RLe | PROP.RLe, PROP.RGe | PROP.RGt, PROP.RLt | PROP.RLt, PROP.RGt =>
                  muldiv_base.sign_determination false t1'' (muldiv_base.prop_transformation pg)
              | _, _ => false
              end) else false
          | _, _ => false
          end
      | _, _ => false
      end
  | _, _ => false
  end.

Definition equ_trans_rewrite_find_prop_helper (hypo p1 : prop) : bool :=
  match hypo, p1 with
  | PBinPred PROP.REq tm11 tm12, PBinPred PROP.REq tm21 tm22 =>
      let patterns := match tm11, tm12 with
                      | TVar f1, TVar f2 => Some (TPApply (TPVar f1) (TPTVar "rewrite_var"), TPApply (TPVar f2) (TPTVar "rewrite_var")) 
					  | TVar f1, TBinder TERM.LambdaB x2 tm2 => Some (TPApply (TPVar f1) (TPTVar x2), tm2tmp_with_var tm2 x2)
					  | TBinder TERM.LambdaB x1 tm1, TVar f2 => Some (tm2tmp_with_var tm1 x1, TPApply (TPVar f2) (TPTVar x1))
					  | TBinder TERM.LambdaB x1 tm1, TBinder TERM.LambdaB x2 tm2 => Some (tm2tmp_with_var tm1 x1, tm2tmp_with_var tm2 x1)
					  | _, _ => None
					  end in
      match patterns with
      | Some (tm11p, tm12p) =>
          match equivalent_infinitesimal_pattern.pattern_match_double_term_rec (tm21, tm22) (tm11p, tm12p) nil nil with
          | Some _ => true
          | None => false
          end
      | _ => false
      end
  | _, _ => false
  end. 

Fixpoint equ_trans_rewrite_find_prop (hypos : list prop) (p1 : prop) : bool :=
  match hypos with
  | hypo :: hypos' =>
      match hypo with
      | PBinPred PROP.REq _ _ => orb (orb (equ_trans_rewrite_find_prop_helper hypo p1) (equ_trans_rewrite_find_prop_helper (prop_opposite hypo) p1)) (equ_trans_rewrite_find_prop hypos' p1)
      | _ => equ_trans_rewrite_find_prop hypos' p1
      end
  | nil => false
  end.

Definition equ_trans_rewrite (pg : proof_goal) (p1 p2 : prop) : bool :=
  let hypos := map (fun x => snd x) pg.(assu) in
  match p1, p2 with
  | PBinPred o1 tm11 tm12, PBinPred o2 tm21 tm22 =>
      if PROP.BinOp_eqb o1 o2
      then let temp := term_simpl_local_detect tm11 tm21 ++ term_simpl_local_detect tm12 tm22 in
      let prop_eqb' := fun x y => orb (prop_eqb x y) (prop_eqb x (prop_opposite y)) in
      let unsolved := filter (fun x => negb (list_in prop_eqb' hypos x)) (map (fun x => PBinPred PROP.REq (fst x) (snd x)) temp) in
      forallb (equ_trans_rewrite_find_prop hypos) unsolved
      else false
  | _, _ => false
  end.



Definition equ_trans_list :=
  equ_trans_Poly :: equ_trans_Rational :: equ_trans_MuldivExp :: equ_trans_MuldivBase :: equ_trans_MultiMuldivExp :: equ_trans_MultiMuldivBase :: equ_trans_rewrite :: nil.

Definition equ_trans (pg : proof_goal) (p1 p2 : prop) : bool :=
  existsb (fun x => x pg (prop_lambda_remove p1) (prop_lambda_remove p2)) equ_trans_list.



Module EquTransTest.

Definition p1 :=
  (PBinPred PROP.REq (TBinOp TERM.RMult
	((TNum 2))	(((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "y" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPower
	((TVar "z" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2))))))))))))) (TBinOp TERM.RMult
	((TNum 3))	((TBinOp TERM.RMult
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 1))	((TNum 2)))))))	(((TBinOp TERM.RPlus
	((TVar "y" ))	((TVar "z" ))))))))).

Definition p2 :=
  (PBinPred PROP.REq (TBinOp TERM.RDiv
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPlus
	((TVar "y" ))	((TVar "z" )))))(TBinOp TERM.RDiv
	((TBinOp TERM.RMult
	((TNum 3))	((TBinOp TERM.RPower
	((TVar "x" ))	((TNum 2))))))	((TBinOp TERM.RMult
	((TNum 2))	(((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "y" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPower
	((TVar "z" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))))))))))).

Compute equ_trans {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} p1 p2.

(* ab + ac - ad = ae 
-> b + c - d = e *)

Definition p3 :=
  (PBinPred PROP.REq
(TBinOp TERM.RMinus (TBinOp TERM.RPlus (TBinOp TERM.RMult (TVar "a") (TVar "b")) (TBinOp TERM.RMult (TVar "a") (TVar "c"))) (TBinOp TERM.RMult (TVar "a") (TVar "d")))
(TBinOp TERM.RMult (TVar "a") (TVar "e"))).

Definition p4 :=
  (PBinPred PROP.REq
(TBinOp TERM.RMinus (TBinOp TERM.RPlus ((TVar "b")) ((TVar "c"))) ((TVar "d"))) ((TVar "e"))).

Compute equ_trans {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} p3 p4.

(* a^2 + b^2 - c^2 = d^2
-> (a/d)^2 + (b/d)^2 - (c/d)^2 = 1 *)

Definition p5 :=
  PBinPred PROP.REq (TBinOp TERM.RMinus (TBinOp TERM.RPlus (TBinOp TERM.RPower (TVar "a") (TNum 2)) (TBinOp TERM.RPower (TVar "b") (TNum 2)))
(TBinOp TERM.RPower (TVar "c") (TNum 2))) (TBinOp TERM.RPower (TVar "d") (TNum 2)).

Definition p6 :=
  PBinPred PROP.REq (TBinOp TERM.RMinus (TBinOp TERM.RPlus (TBinOp TERM.RPower (TBinOp TERM.RDiv (TVar "a") (TVar "d")) (TNum 2))
  (TBinOp TERM.RPower (TBinOp TERM.RDiv (TVar "b") (TVar "d")) (TNum 2))) (TBinOp TERM.RPower (TBinOp TERM.RDiv (TVar "c") (TVar "d")) (TNum 2))) (TNum 1).

Compute equ_trans {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1) ; cont := nil |} p5 p6.

End EquTransTest.



Definition sol_squeeze_theorem : solver :=
  {|func := squeeze_theorem;
  fee :=1;
  pri :=1;
  pri_prop := prop_resemble_squeeze_theorem |}.

Definition sol_deri_compute : solver :=
  {|func := prop_deri;
  fee :=1;
  pri :=1;
  pri_prop := prop_has_deri |}.

Definition sol_hopital_rule : solver :=
  {|func := hopital_rule;
  fee := 1;
  pri := 1;
  pri_prop := prop_resemble_hopital_rule |}.

Definition sol_func_app : solver :=
  {|func := prop_func_app;
  fee := 1;
  pri := 1;
  pri_prop := prop_resemble_func_app |}.

Definition sol_ln_simpl : solver :=
  {|func:= ln_simpl;
   fee:=1;
   pri:=1;
   pri_prop:= prop_ln_domain |}.

Definition sol_ln_calcu : solver :=
  {|func:= ln_calcu;
   fee:=1;
   pri:=1;
   pri_prop:= prop_ressemble_ln_calcu |}.

Definition sol_equal_small : solver := 
 {|func:= equal_small_replace;
  fee:=1;
  pri:=1;
  pri_prop:=prop_resemble_small_replace |}.

Definition sol_periodical_fun : solver := 
 {|func:= equal_periodical;
  fee:=1;
  pri:=1;
  pri_prop:= prop_resemble_periodical |}.

Definition sol_tri_identity : solver := {|
  func := tri_identity_replace ;
  fee := 1 ;
  pri := 1 ;
  pri_prop := prop_resemble_tri_identity
|}.

Definition sol_tri_sum2product : solver := {|
  func := tri_sum2product ;
  fee := 1 ;
  pri := 1 ;
  pri_prop := prop_resemble_tri_sum2product ;
|}.

Definition sol_tri_calculate : solver := {|
  func := tri_calculate ;
  fee := 1 ;
  pri := 1 ;
  pri_prop := prop_resemble_tri_calculate ;
|}.

Definition sol_tri_identities : solver := {|
  func := prop_match_tri_identities ;
  fee := 1 ;
  pri := 1 ;
  pri_prop := prop_resemble_tri_identities ;
|}.

Definition sol_lim_operation : solver := {|
  func := lim_operation ;
  fee := 1 ;
  pri := 1 ;
  pri_prop := prop_resemble_lim_operation ;
|}.

Definition sol_lim_replace :solver := 
{|func:= lim_replace;
  fee:=1;
  pri:=6;
  pri_prop:=prop_resemble_lim_replace |} .

Definition sol_term_remove :solver := 
{|func:= term_rm_s;
  fee:=1;
  pri:=7;
  pri_prop:=fun _ =>0 |} .

Definition sol_poly_check :solver:=
  {|func:= Poly_check_s;
  fee:=1;
  pri:=1;
  pri_prop:=fun _ =>0 |} .

Definition sol_rational_check :solver:=
  {|func:= Rational_check_s;
  fee:=1;
  pri:=1;
  pri_prop:=fun _ =>0|} .

Definition sol_infty_check : solver :=
  {|func:= infty_check_s;
  fee:=1;
  pri:=1;
  pri_prop:= prop_resemble_infty_check |}.

Definition sol_rational_shape :solver := 
  {|func:= Rational_shape_check_s;
  fee:=1;
  pri:=1;
  pri_prop:=fun _ =>0|} .

Definition sol_muldiv_exp_check : solver :=
  {|func := muldiv_exp_check_s;
  fee := 1;
  pri := 1;
  pri_prop:= prop_resemble_muldiv_exp
  |}.

Definition sol_muldiv_base_check : solver :=
  {|func := muldiv_base_check_s;
  fee := 1;
  pri := 1;
  pri_prop:= prop_resemble_muldiv_base
  |}.

Definition sol_eln_transformation : solver :=
  {|func := eln_transformation;
  fee := 1;
  pri := 1;
  pri_prop:= prop_resemble_eln
  |}.

Definition sol_abs :solver :=
  {|func:= remove_abs_s;
  fee:=1;
  pri:=3;
  pri_prop:=prop_has_abs|} .

Definition sol_new_abs :solver :=
  {|func:= new_remove_abs_s;
  fee:=1;
  pri:=3;
  pri_prop:=prop_has_abs|} .

Definition sol_abs_add_neg : solver :=
  {|func := abs_add_neg;
  fee := 1;
  pri := 3;
  pri_prop:=prop_resemble_abs_add_neg|}.

Definition sol_divide_absmul :solver :=
  {|func:= divide_absmul_s;
  fee:=1;
  pri:=3;
  pri_prop:=prop_has_absmul|} .

Definition sol_replace :solver := 
  {|func:= replace_term_s;
  fee:=1;
  pri:=2;
  pri_prop:=fun _ =>0|} .

Definition sol_multi_replace :solver := 
  {|func := multi_replace_term_s;
  fee := 1 ;
  pri := 2 ;
  pri_prop := prop_resemble_multi_replace_term|}.

Definition sol_term_simpl :solver:=
  {|func:= term_simpl;
  fee:=1;
  pri:=4;
  pri_prop:=fun _ =>0 |} .

Definition sol_local_detect :solver:=
  {|func:= local_detect;
  fee:=1;
  pri:=4;
  pri_prop:=fun _ =>0 |} .

Definition sol_cancel_context : solver :=
  {|func := cancel_context;
  fee := 1;
  pri := 4;
  pri_prop := prop_resemble_cancel_context|}.

Definition sol_lambda_remove : solver :=
  {|func:= lambda_remove;
  fee:=1;
  pri:=4;
  pri_prop:=fun _ =>0 |} .

Definition sol_final :solver := 
  {|func:= final_check;
  fee:=1;
  pri:=1;
  pri_prop:=fun _ =>0|} .



Definition list_solver : list (solver*bool) :=
  (sol_final,true)::(sol_infty_check, true)::(sol_muldiv_exp_check,true)::(sol_muldiv_base_check,true)::(sol_rational_shape,true)::(sol_term_remove,true)::(sol_replace,true)::(sol_multi_replace,true)::(sol_term_simpl,true)::(sol_local_detect,true)::(sol_cancel_context,true)::(sol_divide_absmul,true)::
  (sol_tri_sum2product,true)::(sol_tri_calculate,true)::(sol_abs,true)::(sol_new_abs,true)::(sol_lim_operation, true)::(sol_lim_replace, true)::(sol_abs_add_neg, true)::(sol_ln_simpl,true)::(sol_ln_calcu,true) ::(sol_func_app,true)::(sol_deri_compute,true)::(sol_hopital_rule,true)::(sol_eln_transformation,true)::(sol_lambda_remove,true)::(sol_tri_identities,true)::nil.

Definition all_solver := map (fun x => fst x) list_solver.

Definition universal_solver : list solver :=
  sol_lambda_remove :: sol_final :: sol_rational_shape :: sol_term_remove :: sol_replace :: sol_multi_replace :: sol_term_simpl :: sol_local_detect :: nil.

Definition conditional_solver : list solver :=
  sol_ln_calcu :: sol_deri_compute :: sol_divide_absmul :: sol_tri_sum2product :: sol_tri_calculate :: sol_abs :: sol_new_abs :: sol_lim_operation :: sol_lim_replace :: sol_periodical_fun :: sol_equal_small :: sol_ln_simpl :: sol_muldiv_exp_check :: sol_muldiv_base_check :: sol_cancel_context :: sol_func_app :: sol_hopital_rule :: sol_infty_check :: sol_eln_transformation :: sol_tri_identities :: nil.

Definition useable_solver (l : list (solver * bool)) (P : prop) (pg : proof_goal) : list solver :=
  match l with
   | (s, t) :: n =>
             let temp := map (fun x => (x.(pri_prop) P, x)) conditional_solver in
             let solver_2 := map (fun x => snd x) (filter (fun x => Z.eqb (fst x) 2) temp) in
             let solver_1 := map (fun x => snd x) (filter (fun x => Z.eqb (fst x) 1) temp) in
             solver_2 ++ solver_1 ++ universal_solver
   | _ => nil
  end.

Definition apply_solver (pg : proof_goal) (P : prop) (cp : list (solver * bool) -> proof_goal -> prop -> bool) (s : solver) : bool :=
   match (func s) pg P with
   | None => false
   | Some nil => true
   | Some list_prop => forallb (fun P' => if prop_eqb P P' then false else cp ((s,true)::nil) pg P') list_prop
   end.

Fixpoint check_prop_by_solver (fee : nat) (l : list (solver * bool)) (pg : proof_goal) (P : prop) : bool :=
  match fee with
  | O => false
  | S fee' => let l' := useable_solver l P pg in
              existsb (apply_solver pg P (check_prop_by_solver fee')) l'
  end.