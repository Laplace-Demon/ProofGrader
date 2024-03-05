From MParser.lib Require Import ExplicitName.

Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.

(* list tools that will be used later *)
Definition eqb_of_list {X : Type} (eqb_of_term : X -> X -> bool) : (list X -> list X -> bool) :=
  let cancel_one_in_list :=
  fix f pt tm := match pt with
                 | nil => None
                 | tm' :: pt' =>
                      if eqb_of_term tm tm' then Some pt'
                      else match f pt' tm with
                           | None => None
                           | Some res => Some (tm' :: res)
                           end
                 end in
  fix f t1 t2 := match t1 with
                 | nil =>
                      match t2 with
                      | nil => true
                      | _ => false
                      end
                 | tm1 :: t1' =>
                      match cancel_one_in_list t2 tm1 with
                      | Some t2' => f t1' t2'
                      | None => false
                      end
                 end.

Fixpoint list_no_dup {X : Type} (eqb_of_term : X -> X -> bool) (l1 l2 : list X) : list X :=
  match l2 with
  | nil => l1
  | n :: l2' =>
       if existsb (eqb_of_term n) l1 then list_no_dup eqb_of_term l1 l2'
       else list_no_dup eqb_of_term (n :: l1) l2'
  end.

Fixpoint list_in {X : Type} (eqb_of_term : X -> X -> bool) (l1 : list X) (x : X) : bool :=
  match l1 with
  | nil => false
  | n :: l1' => orb (eqb_of_term x n) (list_in eqb_of_term l1' x)
  end.

Fixpoint list_del {X : Type} (eqb_of_term : X -> X -> bool) (l1 : list X) (x : X) : list X :=
  match l1 with
  | nil => nil
  | n :: l1' =>
       if eqb_of_term x n then l1'
       else n :: (list_del eqb_of_term l1' x)
  end.

Fixpoint list_del_dup {X : Type} (eqb_of_term : X -> X -> bool) (l1 l2 : list X) : list X :=
  match l2 with
  | nil => l1
  | n :: l2' => list_del_dup eqb_of_term (list_del eqb_of_term l1 n) l2'
  end.

Fixpoint list_extract_dup {X : Type} (eqb_of_term : X -> X -> bool) (l1 l2 : list X) : list X :=
  match l1 with
  | nil => nil
  | n :: l1' =>
       if list_in eqb_of_term l2 n then n :: (list_extract_dup eqb_of_term l1' (list_del eqb_of_term l2 n))
       else list_extract_dup eqb_of_term l1' l2
  end.

Module TERM.

Inductive Const: Type :=
| RPi
| RE.

Inductive Infty: Type :=
| Positive_Infty
| Negative_Infty
.

Inductive UnOp: Type :=
| RAbs
| RNeg
| ZCeil
| ZFloor
| RSin
| RCos
| SeqLimit
| RLn
| Deri
| RSup
| RInf
.

Inductive BinOp: Type :=
| RDiv
| RMult
| RPlus
| RMinus
| RPower
| RSqrt
| RMax
| RMin
| RLim
.

Inductive Interval_type: Type :=
| LOpen_RClosed_interval
| LOpen_ROpen_interval
| LClosed_ROpen_interval
| LClosed_RClosed_interval
.

Definition Interval_type_eqb (b1 b2: Interval_type): bool :=
match b1, b2 with
  | LOpen_RClosed_interval, LOpen_RClosed_interval => true
  | LOpen_ROpen_interval, LOpen_ROpen_interval => true
  | LClosed_ROpen_interval, LClosed_ROpen_interval => true
  | LClosed_RClosed_interval, LClosed_RClosed_interval => true
  | _, _ =>false
end.

Definition Infty_eqb (b1 b2: Infty): bool :=
match b1,b2 with
  | Positive_Infty, Positive_Infty => true
  | Negative_Infty, Negative_Infty => true
  | _, _ =>true
end.

Definition Infty_opposite (b1 : Infty) : Infty :=
  match b1 with
  | Positive_Infty => Negative_Infty
  | Negative_Infty => Positive_Infty
  end.

Inductive Binder: Type :=
| SeqLimitB
| LambdaB.

Definition Const_eqb (c1 c2: Const): bool :=
  match c1, c2 with
  | RPi, RPi => true
  | RE, RE => true
  | _, _ => false
  end.

Definition bool_eqb (b1 b2 :bool):bool := 
  match b1, b2 with  
  | true, true => true
  | false,false => true
  | _, _ => false
end.

Definition UnOp_eqb (u1 u2: UnOp): bool :=
  match u1, u2 with
  | RAbs, RAbs => true
  | RNeg, RNeg => true
  | ZCeil, ZCeil => true
  | ZFloor, ZFloor => true
  | RSin, RSin => true
  | RCos, RCos => true
  | SeqLimit, SeqLimit => true
  | RLn, RLn => true
  | Deri, Deri => true
  | RSup, RSup => true
  | RInf, RInf => true
  | _, _ => false
  end.

Definition BinOp_eqb (b1 b2: BinOp): bool :=
  match b1, b2 with
  | RDiv, RDiv => true
  | RMult, RMult => true
  | RPlus, RPlus => true
  | RMinus, RMinus => true
  | RPower, RPower => true
  | RSqrt, RSqrt => true
  | RMax, RMax => true
  | RMin, RMin => true
  | RLim, RLim => true
  | _, _ => false
  end.

Definition Binder_eqb (b1 b2: Binder): bool :=
  match b1, b2 with
  | SeqLimitB, SeqLimitB => true
  | LambdaB, LambdaB => true
  | _, _ => false
  end.

End TERM.

Module PROP.

Inductive ROrder: Type :=
| RLt
| RGt
| RLe
| RGe
| REq
| RNeq
.

Definition ROrder_strict (o: ROrder) :bool :=
  match o with
  | RLt | RGt => true
  | _ => false
  end.

Definition ROrder_modify_strict (o: ROrder): ROrder :=
  match o with
  | RLt => RLe
  | RGt => RGe
  | _ => o
  end.

Inductive UnOp: Type :=
| Convergent
| Divergent
| Continue
| UContinue
| BoundedAbove
| BoundedBelow
| Bounded
| MonoInc
| MonoDec
| SMonoInc
| SMonoDec
| Unique
| IsNat
| CauchySeq
.

Inductive BinOp: Type :=
| HasOrder (o: ROrder)
| SeqHasLimit
| ContinueOn
| UContinueOn
| In
| BoundedAboveBy
| BoundedBelowBy
| IsSubseq
.

Definition BinOp_strict (b: BinOp) :bool :=
  match b with
  | HasOrder o => ROrder_strict o
  | _ => false
  end.

Definition BinOp_modify_strict (b: BinOp): BinOp :=
  match b with
  | HasOrder o => HasOrder (ROrder_modify_strict o)
  | _ => b
  end.

Inductive UniConnect: Type :=
| CNot.

Inductive BinConnect: Type :=
| CAnd
| COr
| CImpl
| CIff.

Inductive Quant: Type :=
| QForall
| QExists.

Definition ROrder_eqb (o1 o2: ROrder): bool :=
  match o1, o2 with
  | RLt, RLt => true
  | RGt, RGt => true
  | RLe, RLe => true
  | RGe, RGe => true
  | REq, REq => true
  | RNeq, RNeq => true
  | _, _ => false
  end.

Definition UnOp_eqb (b1 b2: UnOp): bool :=
  match b1, b2 with
  | Convergent, Convergent => true
  | Divergent, Divergent => true
  | Continue, Continue => true
  | UContinue, UContinue => true
  | BoundedAbove, BoundedAbove => true
  | BoundedBelow, BoundedBelow => true
  | MonoInc, MonoInc => true
  | MonoDec, MonoDec => true
  | SMonoInc, SMonoInc => true
  | SMonoDec, SMonoDec => true
  | Unique, Unique => true
  | IsNat, IsNat => true
  | Bounded, Bounded => true
  | CauchySeq, CauchySeq => true
  | _, _ => false
  end.

Definition BinOp_eqb (b1 b2: BinOp): bool :=
  match b1, b2 with
  | HasOrder o1, HasOrder o2 => ROrder_eqb o1 o2
  | SeqHasLimit, SeqHasLimit => true
  | ContinueOn, ContinueOn => true
  | UContinueOn, UContinueOn => true
  | In, In => true
  | BoundedAboveBy, BoundedAboveBy => true
  | BoundedBelowBy, BoundedBelowBy => true
  | IsSubseq, IsSubseq => true
  | _, _ => false
  end.

Definition UniConnect_eqb (u1 u2: UniConnect): bool :=
  match u1, u2 with
  | CNot, CNot => true
  end.

Definition BinConnect_eqb (b1 b2: BinConnect): bool :=
  match b1, b2 with
  | CAnd, CAnd => true
  | COr, COr => true
  | CImpl, CImpl => true
  | CIff, CIff => true
  | _, _ => false
  end.

Definition Quant_eqb (q1 q2: Quant): bool :=
  match q1, q2 with
  | QForall, QForall => true
  | QExists, QExists => true
  | _, _ => false
  end.

End PROP.

Coercion PROP.HasOrder: PROP.ROrder >-> PROP.BinOp.

Module VarName := StringName.
Module HypName := StringName.

Inductive term :=
| TNum (z: Z)
| TInfty (i: TERM.Infty)
| TConst (c: TERM.Const)
| TUnOp (u: TERM.UnOp) (t: term)
| TBinOp (b: TERM.BinOp) (t1 t2: term)
| TApply (t1 t2: term)
| TBinder (b: TERM.Binder) (x: VarName.t) (t: term)
| TVar (x: VarName.t)
| TInterval (t : TERM.Interval_type) (t1: term) (t2: term)
| TSet (l: list VarName.t) (t: term) (P: prop)

with prop :=
| PLongOrder (o: PROP.ROrder) (t1: term) (P: prop)
| PUnPred (p: PROP.UnOp) (t1: term)
| PBinPred (p: PROP.BinOp) (t1 t2: term)
| PCBinPred (p: PROP.BinOp) (t1 t2: term) (cont: list prop_context)
| PUnOp (u: PROP.UniConnect) (P: prop)
| PBinOp (b: PROP.BinConnect) (P Q: prop)
| PQuant (q: PROP.Quant) (x: VarName.t) (P: prop)

with prop_context :=
| CPeriodicFun (t1 : term)
| CEvenFun
| CLimPlus (t1 t2 : term)
| CLimMult (t1 t2 : term)
.

Definition subst_task: Type := list (VarName.t * term).

Definition subst_var (x: VarName.t) (st: subst_task): term :=
  match VarName.look_up x st with
  | Some t => t
  | None => TVar x
  end.

Fixpoint freely_occurs_in_term (t: term): list VarName.t :=
  match t with
  | TNum z => nil
  | TConst c => nil
  | TInfty i => nil
  | TUnOp u t1 => freely_occurs_in_term t1
  | TBinOp b t1 t2 => freely_occurs_in_term t1 ++ freely_occurs_in_term t2
  | TApply t1 t2 => freely_occurs_in_term t1 ++ freely_occurs_in_term t2
  | TVar x => x :: nil
  | TBinder b x t1 => filter (fun x0 => negb (VarName.eqb x0 x)) (freely_occurs_in_term t1)
  | TInterval b t1 t2 => freely_occurs_in_term t1 ++ freely_occurs_in_term t2
  | TSet l t P => filter (fun x0 => negb (list_in VarName.eqb l x0)) (freely_occurs_in_term t ++ freely_occurs_in_prop P)
  end

with freely_occurs_in_prop (P: prop): list VarName.t :=
  match P with
  | PLongOrder o t P => freely_occurs_in_term t ++ freely_occurs_in_prop P
  | PUnPred u t1 => freely_occurs_in_term t1
  | PBinPred b t1 t2 => freely_occurs_in_term t1 ++ freely_occurs_in_term t2
  | PCBinPred b t1 t2 cont => freely_occurs_in_term t1 ++ freely_occurs_in_term t2 ++ concat (map freely_occurs_in_prop_cont cont) 
  | PUnOp u P1 => freely_occurs_in_prop P1
  | PBinOp b P1 P2 => freely_occurs_in_prop P1 ++ freely_occurs_in_prop P2
  | PQuant q x P1 => filter (fun x0 => negb (VarName.eqb x0 x)) (freely_occurs_in_prop P1)
  end

with freely_occurs_in_prop_cont (cont : prop_context) : list VarName.t :=
  match cont with
  | CPeriodicFun t1 => freely_occurs_in_term t1
  | CEvenFun => nil
  | CLimPlus t1 t2 | CLimMult t1 t2 => freely_occurs_in_term t1 ++ freely_occurs_in_term t2
  end.

Definition freely_occurs_in_terms {A: Type} (st: list (A * term)): list VarName.t :=
  concat (map (fun xt => freely_occurs_in_term (snd xt)) st).

Definition freely_occur_term x t: bool :=
  existsb (VarName.eqb x) (freely_occurs_in_term t).

Definition freely_occur_terms {A: Type} x (st: list (A * term)): bool :=
  existsb (VarName.eqb x) (freely_occurs_in_terms st).

Fixpoint subst_term_helper (terms: list VarName.t) (l: list VarName.t) : (list VarName.t) * subst_task :=
  match l with
  | x :: l' => let x' := VarName.next_name_with_prefix terms "x" in
               let (lvar, st) := subst_term_helper (x' :: terms) l' in
               (x' :: lvar, (x, TVar x') :: st)
  | nil => (nil, nil)
  end.

Fixpoint subst_term (t: term) (st: subst_task): term :=
  match t with
  | TNum z => TNum z
  | TConst c => TConst c
  | TInfty i => TInfty i
  | TUnOp u t1 => TUnOp u (subst_term t1 st)
  | TBinOp b t1 t2 => TBinOp b (subst_term t1 st) (subst_term t2 st)
  | TApply t1 t2 => TApply (subst_term t1 st) (subst_term t2 st)
  | TVar x => subst_var x st
  | TBinder b x t1 => let st' := VarName.remove x st in
                      if freely_occur_terms x st'
                      then let x' := VarName.next_name_with_prefix
                                       (freely_occurs_in_terms st ++ freely_occurs_in_term t1)
                                       "x"
                           in
                           TBinder b x' (subst_term t1 ((x, TVar x') :: st'))
                      else TBinder b x (subst_term t1 st')
  | TInterval b t1 t2 => TInterval b (subst_term t1 st) (subst_term t2 st)
  | TSet l t P => let st' := fold_left (fun l x0 => VarName.remove x0 l) l st in
                  let l_free := filter (fun x0 => negb (freely_occur_terms x0 st')) l in
                  let l_binded := filter (fun x0 => freely_occur_terms x0 st') l in
                  let (l_binded_change_name, name_map) := subst_term_helper (freely_occurs_in_terms st ++ freely_occurs_in_term t ++ freely_occurs_in_prop P) l_binded in
                  TSet (l_free ++ l_binded_change_name) (subst_term t (name_map ++ st)) (subst_prop P (name_map ++ st))
  end

with subst_prop (P: prop) (st: subst_task): prop :=
  match P with
  | PLongOrder o t P => PLongOrder o (subst_term t st) (subst_prop P st)
  | PUnPred u t1 => PUnPred u (subst_term t1 st)
  | PBinPred b t1 t2 => PBinPred b (subst_term t1 st) (subst_term t2 st)
  | PCBinPred b t1 t2 cont => PCBinPred b (subst_term t1 st) (subst_term t2 st) (map (fun x => subst_prop_cont x st) cont)
  | PUnOp u P1 => PUnOp u (subst_prop P1 st)
  | PBinOp b P1 P2 => PBinOp b (subst_prop P1 st) (subst_prop P2 st)
  | PQuant q x P1 => let st' := VarName.remove x st in
                     if freely_occur_terms x st'
                     then let x' := VarName.next_name_with_prefix
                                       (freely_occurs_in_terms st ++ freely_occurs_in_prop P1)
                                       "x"
                          in
                          PQuant q x' (subst_prop P1 ((x, TVar x') :: st))
                     else PQuant q x (subst_prop P1 st)
  end

with subst_prop_cont (cont: prop_context) (st: subst_task): prop_context :=
  match cont with
  | CPeriodicFun t1 => CPeriodicFun (subst_term t1 st)
  | CEvenFun => CEvenFun
  | CLimPlus t1 t2 => CLimPlus (subst_term t1 st) (subst_term t2 st)
  | CLimMult t1 t2 => CLimMult (subst_term t1 st) (subst_term t2 st)
  end.

Fixpoint term_eqb (t1 t2 : term) : bool :=
  match t1, t2 with
  | TNum z1, TNum z2 => Z.eqb z1 z2
  | TConst c1, TConst c2 => TERM.Const_eqb c1 c2
  | TInfty i1, TInfty i2 => TERM.Infty_eqb i1 i2
  | TUnOp u1 t11, TUnOp u2 t21 => TERM.UnOp_eqb u1 u2 && term_eqb t11 t21
  | TBinOp b1 t11 t12, TBinOp b2 t21 t22 => TERM.BinOp_eqb b1 b2 && term_eqb t11 t21 && term_eqb t12 t22
  | TApply t11 t12, TApply t21 t22 => term_eqb t11 t21 && term_eqb t12 t22
  | TVar x1, TVar x2 => VarName.eqb x1 x2
  | TBinder b1 x1 t1, TBinder b2 x2 t2 => TERM.Binder_eqb b1 b2 && term_eqb t1 (subst_term t2 ((x2, TVar x1) :: nil))
  | TInterval b1 t11 t12 , TInterval b2 t21 t22 => TERM.Interval_type_eqb b1 b2 &&  term_eqb t11 t21 && term_eqb t12 t22
  | TSet l1 t1 P1, TSet l2 t2 P2 => (eqb_of_list VarName.eqb) l1 l2 && term_eqb t1 t2 && prop_eqb P1 P2
  | _, _ => false
  end

with prop_eqb (P1 P2: prop): bool :=
  match P1, P2 with
  | PLongOrder o1 t1 P11, PLongOrder o2 t2 P21 => PROP.ROrder_eqb o1 o2 && term_eqb t1 t2 && prop_eqb P11 P21
  | PUnPred p1 t11, PUnPred p2 t21 => PROP.UnOp_eqb p1 p2 && term_eqb t11 t21
  | PBinPred p1 t11 t12, PBinPred p2 t21 t22 => PROP.BinOp_eqb p1 p2 && term_eqb t11 t21 && term_eqb t12 t22
  | PCBinPred p1 t11 t12 _, PCBinPred p2 t21 t22 _ => PROP.BinOp_eqb p1 p2 && term_eqb t11 t21 && term_eqb t12 t22
  | PUnOp u1 P1, PUnOp u2 P2 => PROP.UniConnect_eqb u1 u2 && prop_eqb P1 P2
  | PBinOp b1 P1 Q1, PBinOp b2 P2 Q2 => PROP.BinConnect_eqb b1 b2 && prop_eqb P1 P2 && prop_eqb Q1 Q2
  | PQuant q1 x1 P1, PQuant q2 x2 P2 => PROP.Quant_eqb q1 q2 && prop_eqb P1 (subst_prop P2 ((x2, TVar x1) :: nil))
  | _, _ => false
  end.

Definition prop_cont_eqb (c1 c2: prop_context): bool :=
  match c1,c2 with 
  | CEvenFun,CEvenFun => true
  | CLimPlus t1 t2,CLimPlus t1' t2' => term_eqb t1 t1' && term_eqb t2 t2'
  | CLimMult t1 t2,CLimMult t1' t2' => term_eqb t1 t1' && term_eqb t2 t2'
  | _, _ =>false
  end.

Definition prop_is_strict (P: prop): bool :=
  match P with
  | PBinPred b _ _ => PROP.BinOp_strict b
  | _ => false
  end.

Definition prop_modify_strict (P: prop): prop :=
  match P with
  | PBinPred b tm1 tm2 => PBinPred (PROP.BinOp_modify_strict b) tm1 tm2
  | _ => P
  end.

Definition prop_opposite (P : prop) : prop :=
  match P with
  | PBinPred PROP.REq tm1 tm2 => PBinPred PROP.REq tm2 tm1
  | PBinPred PROP.RLe tm1 tm2 => PBinPred PROP.RGe tm2 tm1
  | PBinPred PROP.RLt tm1 tm2 => PBinPred PROP.RGt tm2 tm1
  | PBinPred PROP.RGe tm1 tm2 => PBinPred PROP.RLe tm2 tm1
  | PBinPred PROP.RGt tm1 tm2 => PBinPred PROP.RLt tm2 tm1
  | PBinPred PROP.RNeq tm1 tm2 => PBinPred PROP.RNeq tm2 tm1
  | _ => P
  end.

Definition prop_interval_inequality_transition (P: prop) :option prop :=
  match P with
  | PBinPred PROP.In t (TInterval type t1 t2) =>
      match t1, t2 with
      | TInfty TERM.Negative_Infty, TInfty TERM.Positive_Infty => None
      | TInfty TERM.Negative_Infty, _ =>
          match type with
          | TERM.LOpen_RClosed_interval | TERM.LClosed_RClosed_interval =>
              Some (PBinPred PROP.RLe t t2)
          | TERM.LOpen_ROpen_interval | TERM.LClosed_ROpen_interval =>
              Some (PBinPred PROP.RLt t t2)
          end
      | _, TInfty TERM.Positive_Infty =>
          match type with
          | TERM.LOpen_RClosed_interval | TERM.LOpen_ROpen_interval =>
              Some (PBinPred PROP.RGt t t1)
          | TERM.LClosed_ROpen_interval | TERM.LClosed_RClosed_interval =>
              Some (PBinPred PROP.RGe t t1)
          end
      | _, _ => 
          match type with
          | TERM.LOpen_RClosed_interval =>
              Some (PBinOp PROP.CAnd (PBinPred PROP.RGt t t1) (PBinPred PROP.RLe t t2))
          | TERM.LOpen_ROpen_interval =>
              Some (PBinOp PROP.CAnd (PBinPred PROP.RGt t t1) (PBinPred PROP.RLt t t2))
          | TERM.LClosed_ROpen_interval =>
              Some (PBinOp PROP.CAnd (PBinPred PROP.RGe t t1) (PBinPred PROP.RLt t t2))
          | TERM.LClosed_RClosed_interval =>
              Some (PBinOp PROP.CAnd (PBinPred PROP.RGe t t1) (PBinPred PROP.RLe t t2))
          end
      end
  | _ => None
  end.

Definition prop_equivalent (P Q : prop) : bool := (* 目前只有属于区间和范围的等价 *)
  match prop_interval_inequality_transition Q with
  | Some Q' => prop_eqb P Q'
  | None => false
  end.

Fixpoint find_term_in_list_prop (hypos : list prop) (tm : term) : option term :=
  match hypos with
  | hypos :: hypos' =>
      match hypos with
      | PBinPred PROP.REq t1 t2 =>
          if term_eqb t1 tm then Some t2
          else if term_eqb t2 tm then Some t1
          else find_term_in_list_prop hypos' tm
      | _ => find_term_in_list_prop hypos' tm
      end
  | nil => None
  end.

Module PROOF.

Inductive Def : Type :=
| SeqLimit
| SeqConvergence
| Continuity
| UContinuity
| UpperBound
| LowerBound
| Unique
| Bounded
| Supremum
| Infimum
| MonoInc
| MonoDec
| SMonoInc
| SMonoDec
| CauchySeq
.

Inductive Thm : Type :=
| AGAverage
| SGAverage
| Squeeze
| SupremumAndInfimum
| MonoConvergence
| BolzanoWeierstrass
.

Inductive Fwd: Type :=
| FNoHint
| FAddEqn (hs: list HypName.t)
| FSubEqn (h1 h2: HypName.t)
| FAGAverage
| FSGAverage
| FSqueezeTheorem
| FEquTrans (h1: VarName.t)
| FDeriBothTerms (var: option VarName.t)
| FTakeLimOnBothTerms (var: VarName.t) (val: term)
| FSquareBothTerms
| FSeqLimitDef
| Continuity_x0_Def
| UContinuity_Def
| FDefinition (d: Def)
| FTheorem (th: Thm) (l: list term)
| FProperty (d: Def)
| FCausalInfer (P: prop).

Inductive Bwd: Type :=
| BNoHint
| BContra.

Inductive Act: Type :=
| AIntros (x: VarName.t)
| AExists (t: term)
| ASuppose (p: prop)
| ASet (x: VarName.t) (t: term)
| ASetProp (p: prop)
| AExistVar (x: VarName.t)
.

(*取什么，在哪取，取完是什么*)

Inductive PoseAct: Type :=
| APoseVar (x: VarName.t) (l : list prop)
| APoseProp (p: prop)
.

End PROOF.

Inductive proof :=
| PrAssum (z1 z2: Z) (H: HypName.t)
| PrPoseWithoutProof (z1 z2: Z) (PrF: PROOF.Fwd) (P: prop) (pr: proof)
| PrPoseAndProve (z1 z2: Z) (PrF: PROOF.Fwd) (P: prop) (pr1 pr2: proof)
| PrConclWithoutProof (z1 z2: Z) (PrF: PROOF.Fwd)
| PrConclAndProof (z1 z2: Z) (PrF: PROOF.Fwd) (pr: proof)
| PrClaimSuffice (z1 z2: Z) (PrB: PROOF.Bwd) (P: prop) (pr: proof)
| PrProveSuffice (z1 z2: Z) (PrB: PROOF.Bwd) (P: prop) (pr1 pr2: proof)
| PrAction (z1 z2: Z) (PrA: PROOF.Act) (pr: proof)
| PrPosePartialProof (z1 z2: Z) (PrP : PROOF.PoseAct) (pr1 pr2 : proof)
| PrEndPartialProof 
.


Record proof_goal: Type := {
  assu: list (HypName.t * prop);
  concl: prop;
  cont: list (VarName.t + prop);
}.

Definition context_entry_eqb (cont_entry1 cont_entry2: VarName.t + prop): bool :=
  match cont_entry1, cont_entry2 with
  | inl var1, inl var2 => VarName.eqb var1 var2
  | inr p1, inr p2 => prop_eqb p1 p2
  | _, _ => false
  end.

Fixpoint vars_in_context (cont: list (VarName.t + prop)): list VarName.t:=
  match cont with
  | (inl var) :: cont' => var :: (vars_in_context cont')
  | (inr _) :: cont' => vars_in_context cont'
  | nil => nil
  end.

Fixpoint props_in_context (cont: list (VarName.t + prop)): list prop:=
  match cont with
  | (inr p) :: cont' => p :: (props_in_context cont')
  | (inl _) :: cont' => props_in_context cont'
  | nil => nil
  end.

Definition subst_proof_goal (st: subst_task) (pg: proof_goal) : proof_goal :=
  let assumption := map (fun x => (fst x, subst_prop (snd x) st)) pg.(assu) in
  let conclusion := subst_prop pg.(concl) st in
  let context := map (fun x => match x with | inl _ => x | inr p => inr (subst_prop p st) end) pg.(cont) in
  {| assu := assumption ; concl := conclusion ; cont := context |}.

Definition proof_goal_eqb (pg1 pg2: proof_goal) : bool :=
  let (assu1, concl1, cont1) := pg1 in
  let (assu2, concl2, cont2) := pg2 in
  let hypos1 := map (fun x => snd x) assu1 in
  let hypos2 := map (fun x => snd x) assu2 in
  andb ((eqb_of_list prop_eqb) hypos1 hypos2) (andb (prop_eqb concl1 concl2) ((eqb_of_list context_entry_eqb) cont1 cont2)).

Fixpoint freely_occurs_in_proof (pr : proof) : list VarName.t :=
  match pr with
  | PrPoseWithoutProof _ _ _ p1 pr1 => (freely_occurs_in_prop p1) ++ (freely_occurs_in_proof pr1)
  | PrPoseAndProve _ _ _ p1 pr1 pr2 => (freely_occurs_in_prop p1) ++ (freely_occurs_in_proof pr1) ++ (freely_occurs_in_proof pr2)
  | PrConclAndProof _ _ _ pr1 => freely_occurs_in_proof pr1
  | PrClaimSuffice _ _ _ p1 pr1 => (freely_occurs_in_prop p1) ++ (freely_occurs_in_proof pr1)
  | PrProveSuffice _ _ _ p1 pr1 pr2 => (freely_occurs_in_prop p1) ++ (freely_occurs_in_proof pr1) ++ (freely_occurs_in_proof pr2)
  | PrAction _ _ ac pr1 =>
      let free_vars := freely_occurs_in_proof pr1 in
      match ac with
      | PROOF.AIntros x => filter (fun x0 => negb (VarName.eqb x0 x)) free_vars
      | PROOF.AExists t => (freely_occurs_in_term t) ++ free_vars
      | PROOF.ASet x t => filter (fun x0 => negb (VarName.eqb x0 x)) ((freely_occurs_in_term t) ++ free_vars)
      | PROOF.AExistVar x => filter (fun x0 => negb (VarName.eqb x0 x)) free_vars
      | _ => free_vars
      end
  | PrPosePartialProof _ _ pac pr1 pr2 =>
      let free_vars := (freely_occurs_in_proof pr1) ++ (freely_occurs_in_proof pr2) in
      match pac with
      | PROOF.APoseVar x _ => filter (fun x0 => negb (VarName.eqb x0 x)) free_vars
      | _ => free_vars
      end
  | _ => nil
  end.

Definition freely_occurs_in_proof_goal (pg : proof_goal) : list VarName.t :=
  let temp := pg.(concl) :: (app (map (fun x => snd x) pg.(assu)) (props_in_context pg.(cont))) in
  list_no_dup VarName.eqb nil (list_del_dup VarName.eqb (concat (map (fun x => freely_occurs_in_prop x) temp)) (vars_in_context pg.(cont))).

Fixpoint subprop_in_prop (p1 p2: prop) : bool :=
  if orb (prop_eqb p1 p2) (prop_eqb (prop_opposite p1) p2)
  then true
  else match p2 with
  | PBinOp PROP.CAnd p21 p22 => orb (subprop_in_prop p1 p21) (subprop_in_prop p1 p22)
  | _ => false
  end.

Fixpoint prop_in_list_prop (hypos : list prop) (P : prop) : bool :=
  match hypos with
  | hypo :: hypos' =>
       if subprop_in_prop P hypo then true else prop_in_list_prop hypos' P
  | _ => false
  end.

Definition prop_in_proof_goal (pg : proof_goal) (P : prop) : bool :=
  prop_in_list_prop (map (fun x => snd x) (assu pg)) P.

Definition find_prop_in_proof_goal (pg : proof_goal) (h : VarName.t) : option prop :=
  let helper := fix f hypos h :=
      match hypos with
      | hypo :: hypos' =>
          match hypo with
          | (h', P) => if VarName.eqb h h' then Some P else f hypos' h
          end
      | nil => None
      end in
  match pg with 
  | {|assu := assum ; concl := concl |} => helper assum h
  end.

(** Constant Simplify *)

Module RationalConstant.

Definition RNeg_eval (zp: Z * Z): Z * Z :=
  (- fst zp, snd zp).

Definition RDiv_eval_unsafe (zp1 zp2: Z * Z): Z * Z :=
  (fst zp1 * snd zp2, fst zp2 * snd zp1).

Definition RMult_eval (zp1 zp2: Z * Z): Z * Z :=
  (fst zp1 * fst zp2, snd zp1 * snd zp2).

Definition RPlus_eval (zp1 zp2: Z * Z): Z * Z :=
  (fst zp1 * snd zp2 + fst zp2 * snd zp1, snd zp1 * snd zp2).

Definition RMinus_eval (zp1 zp2: Z * Z): Z * Z :=
  (fst zp1 * snd zp2 - fst zp2 * snd zp1, snd zp1 * snd zp2).

Definition unop_eval (u: TERM.UnOp) (zp: Z * Z): option (Z * Z) :=
  match u with
  | TERM.RAbs => None
  | TERM.RNeg => Some (RNeg_eval zp)
  | TERM.ZCeil => None
  | TERM.ZFloor => None
  | TERM.RSin => None
  | TERM.RCos => None
  | TERM.SeqLimit => None
  | TERM.RLn => None
  | _ => None
  end.

Definition binop_eval (b: TERM.BinOp) (zp1 zp2: Z * Z): option (Z * Z) :=
  match b with
  | TERM.RDiv =>
      if Z.eqb (fst zp2) 0
      then None
      else Some (RDiv_eval_unsafe zp1 zp2)
  | TERM.RMult =>
      Some (RMult_eval zp1 zp2)
  | TERM.RPlus =>
      Some (RPlus_eval zp1 zp2)
  | TERM.RMinus =>
      Some (RMinus_eval zp1 zp2)
  | TERM.RPower =>
      if (Z.eqb (fst zp2) 2 && Z.eqb (snd zp2) 1)%bool
      then Some (RMult_eval zp1 zp1)
      else if (Z.eqb (fst zp2) 3 && Z.eqb (snd zp2) 1)%bool
           then Some (RMult_eval zp1 (RMult_eval zp1 zp1))
           else None
  | TERM.RSqrt =>
      None
  | TERM.RMax =>
      None
  | TERM.RMin =>
      None
  | TERM.RLim =>
      None
  end.

Fixpoint eval (t: term): option (Z * Z) :=
  match t with
  | TNum z => Some (z, 1)
  | TUnOp u t1 => match eval t1 with
                  | Some zp => unop_eval u zp
                  | _ => None
                  end
  | TBinOp b t1 t2 => match eval t1, eval t2 with
                      | Some zp1, Some zp2 => binop_eval b zp1 zp2
                      | _, _ => None
                      end
  | _ => None
  end.

Definition simplify (zp: Z * Z): Z * Z :=
  let g := Z.gcd (fst zp) (snd zp) in
  (fst zp / g, snd zp / g).

End RationalConstant.

(** Poly *)

Record poly_term: Type := {
  coef: Z * Z;
  prods: list term;
}.

Definition poly: Type := list poly_term.

Module Poly.

Definition RNeg_eval (pol: poly): poly :=
  map (fun pt => {| coef := RationalConstant.RNeg_eval (coef pt); prods := prods pt |}) pol.
  
Definition RDiv_eval (pol1 pol2: poly): option poly :=
  match pol2 with
  | Build_poly_term coef2 nil :: nil =>
      if Z.eqb (fst coef2) 0
      then None
      else Some (map (fun pt => {| coef := RationalConstant.RDiv_eval_unsafe (coef pt) coef2; prods := prods pt |}) pol1)
  | _ => None
  end.

Definition RMult_eval (pol1 pol2: poly): poly :=
  concat
    (map (fun pt1 => map (fun pt2 =>
                            {| coef := RationalConstant.RMult_eval (coef pt1) (coef pt2);
                               prods := prods pt1 ++ prods pt2 |}) pol2) pol1).

Definition RPlus_eval (pol1 pol2: poly): poly :=
  pol1 ++ pol2.

Definition RMinus_eval (pol1 pol2: poly): poly :=
  pol1 ++ RNeg_eval pol2.

Definition unop_eval (u: TERM.UnOp) (pol: poly): option poly :=
  match u with
  | TERM.RAbs => None
  | TERM.RNeg => Some (RNeg_eval pol)
  | TERM.ZCeil => None
  | TERM.ZFloor => None
  | TERM.RSin => None
  | TERM.RCos => None
  | TERM.SeqLimit => None
  | TERM.RLn => None
  | _ => None
  end.

Definition poly_is_2 (pol: poly): bool :=
  match pol with
  | Build_poly_term co nil :: nil =>
      (Z.eqb (fst co) 2 && Z.eqb (snd co) 1)%bool
  | _ => false
  end.

Definition poly_is_3 (pol: poly): bool :=
  match pol with
  | Build_poly_term co nil :: nil =>
      (Z.eqb (fst co) 3 && Z.eqb (snd co) 1)%bool
  | _ => false
  end.

Definition binop_eval (b: TERM.BinOp) (pol1 pol2: poly): option poly :=
  match b with
  | TERM.RDiv => RDiv_eval pol1 pol2
  | TERM.RMult => Some (RMult_eval pol1 pol2)
  | TERM.RPlus => Some (RPlus_eval pol1 pol2)
  | TERM.RMinus => Some (RMinus_eval pol1 pol2)
  | TERM.RPower => if poly_is_2 pol2
                   then Some (RMult_eval pol1 pol1)
                   else if poly_is_3 pol2
                        then Some (RMult_eval pol1 (RMult_eval pol1 pol1))
                        else None
  | TERM.RSqrt => None
  | TERM.RMax => None
  | TERM.RMin => None
  | TERM.RLim => None
  end.

Fixpoint eval (t: term): poly :=
  match t with
  | TNum z => {| coef := (z, 1); prods := nil |} :: nil
  | TUnOp u t1 => match unop_eval u (eval t1) with
                  | Some pol => pol
                  | None => {| coef := (1, 1); prods := t :: nil |} :: nil
                  end
  | TBinOp b t1 t2 => match binop_eval b (eval t1) (eval t2) with
                      | Some pol => pol
                      | None => {| coef := (1, 1); prods := t :: nil |} :: nil
                      end
  | _ => {| coef := (1, 1); prods := t :: nil |} :: nil
  end.

Fixpoint cancel_one_in_prods (l: list term) (t: term): option (list term) :=
  match l with
  | nil => None
  | t0 :: l0 =>
      if term_eqb t0 t
      then Some l0
      else match cancel_one_in_prods l0 t with
           | Some res => Some (t0 :: res)
           | None => None
           end
  end.

Fixpoint prods_eqb (l1 l2: list term): bool :=
  match l2 with
  | nil => match l1 with
           | nil => true
           | _ => false
           end
  | t :: l2' => match cancel_one_in_prods l1 t with
                | Some l1' => prods_eqb l1' l2'
                | None => false
                end
  end.

Fixpoint add_one_poly_term (pol: poly) (pt: poly_term): poly :=
  match pol with
  | nil => pt :: nil
  | pt0 :: pol0 =>
      if prods_eqb (prods pt0) (prods pt)
      then let coef' := RationalConstant.RPlus_eval (coef pt0) (coef pt) in
           if Z.eqb (fst coef') 0
           then pol0
           else {| coef := coef'; prods := prods pt0 |} :: pol0
      else pt0 :: (add_one_poly_term pol0 pt)
  end.

Definition simplify (pol: poly): poly :=
  filter (fun pt =>negb (Z.eqb (fst (coef pt)) 0))(fold_left add_one_poly_term pol nil).

(*Fixpoint is_poly_term_in_poly (pol: poly) (pt: poly_term) : bool:=
  match pol with 
  | nil => false
  | pt0::pol0 =>if prods_eqb (prods pt0) (prods pt)
               then let coef' := RationalConstant.RMinus_eval (coef pt0) (coef pt) in
                    if Z.eqb (fst coef') 0
                    then true
                    else is_poly_term_in_poly pol0 pt
                else is_poly_term_in_poly pol0 pt
  end.

Definition common_poly_term (pol1:poly) (pol2 :poly) :poly:=
  filter (fun pt => is_poly_term_in_poly pol2 pt) pol1.

Fixpoint simpl_poly_poly (pol1:poly) (pol2 :poly) (pol_c :poly): poly*poly:=
  match pol_c with
  |nil => (pol1,pol2)
  |pt0::pol=>simpl_poly_poly (add_one_poly_term pol1 pt0) (add_one_poly_term pol2 pt0) pol
  end.
*)
Definition  poly_eqn (pol1 :poly) (pol2 :poly) : bool :=
  let pol:=simplify (RMinus_eval pol1 pol2) in
  match pol with 
  |nil => true
  |_=>false
  end. 




(*Definition eval_simpl (t : term) : poly:= simplify (eval t) .*)
End Poly.

Record Rational_term :Type :=
{
	Numerator : poly;
  Denominator : poly;
}.

Module Rational.

Definition RNeg_eval (Rat : Rational_term) : Rational_term :=
  {| Numerator := Poly.RNeg_eval (Numerator Rat); Denominator := Denominator Rat |} .

Definition  RMult_eval (Rat1 :Rational_term) (Rat2 :Rational_term) :Rational_term :=
  {| Numerator := Poly.RMult_eval (Numerator Rat1) (Numerator Rat2) ;
   Denominator := Poly.RMult_eval (Denominator Rat1) (Denominator Rat2)|} .

Definition  RDiv_eval (Rat1 :Rational_term) (Rat2 :Rational_term) : option Rational_term :=
 let h:= (forallb (fun pt => Z.eqb (fst (coef pt)) 0) (Poly.simplify (Numerator Rat2))) in
  if h
  then None
  else Some {| Numerator := Poly.RMult_eval (Numerator Rat1) (Denominator Rat2) ;
   Denominator := Poly.RMult_eval (Denominator Rat1) (Numerator Rat2)|} 
 .

Definition  RPlus_eval (Rat1 :Rational_term) (Rat2 :Rational_term) :Rational_term :=
  {| Numerator := Poly.RPlus_eval (Poly.RMult_eval (Numerator Rat1)(Denominator Rat2)) (Poly.RMult_eval (Numerator Rat2)(Denominator Rat1));
    Denominator := Poly.RMult_eval (Denominator Rat1) (Denominator Rat2) |}.

Definition  RMinus_eval (Rat1 :Rational_term) (Rat2 :Rational_term) :Rational_term:= 
  RPlus_eval Rat1 (RNeg_eval Rat2 ).

Definition unop_eval (u: TERM.UnOp) (Rat : Rational_term): option Rational_term :=
  match u with
  | TERM.RAbs => None
  | TERM.RNeg => Some (RNeg_eval Rat)
  | TERM.ZCeil => None
  | TERM.ZFloor => None
  | TERM.RSin => None
  | TERM.RCos => None
  | TERM.SeqLimit => None
  | TERM.RLn => None
  | _ => None
  end.

Definition binop_eval (b: TERM.BinOp) (Rat1 Rat2: Rational_term): option Rational_term :=
  match b with
  | TERM.RDiv => RDiv_eval Rat1 Rat2
  | TERM.RMult => Some (RMult_eval Rat1 Rat2)
  | TERM.RPlus => Some (RPlus_eval Rat1 Rat2)
  | TERM.RMinus => Some (RMinus_eval Rat1 Rat2)
  |_ => None
  end.

Fixpoint eval (t: term): Rational_term :=
  match t with
  | TNum z =>{|Numerator:= {| coef := (z, 1); prods := nil |} :: nil ; Denominator := {| coef := (1, 1); prods := nil |} :: nil |}
  | TUnOp u t1 => match unop_eval u (eval t1) with
                  | Some rat => rat
                  | None => {|Numerator:= {| coef := (1, 1); prods := t :: nil |} :: nil ; Denominator := {| coef := (1, 1); prods := nil |} :: nil |}
                  end
  | TBinOp b t1 t2 => match binop_eval b (eval t1) (eval t2) with
                      | Some rat => rat
                      | None =>{|Numerator:= {| coef := (1, 1); prods := t :: nil |} :: nil ; Denominator := {| coef := (1, 1); prods := nil |} :: nil |}
                      end
  | _ => {|Numerator:= {| coef := (1, 1); prods := t :: nil |} :: nil ; Denominator := {| coef := (1, 1); prods := nil |} :: nil |}
  end.

(*Compute eval 
(TBinOp TERM.RDiv
	((TNum 1))	((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))))	((TNum 2))))). *)

Definition Simplify (Rat: Rational_term) :Rational_term :=
  {| Numerator := Poly.simplify (Numerator Rat) ;
   Denominator := Poly.simplify (Denominator Rat) |} .

Definition reciprocal (Rat: Rational_term) : option Rational_term :=
 RDiv_eval (eval(TNum 1)) Rat .

(*Compute reciprocal 
(eval(TBinOp TERM.RDiv
	((TNum 1))	((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))))	((TNum 2)))))). *)
Definition Rational_eqn (Rat1 Rat2 : Rational_term):bool :=
   Poly.poly_eqn (Poly.RMult_eval (Numerator Rat1) (Denominator Rat2))
   (Poly.RMult_eval (Numerator Rat2) (Denominator Rat1)).

Definition Rational_eqn_pair (Rat1 Rat2 Rat1' Rat2' : Rational_term):bool :=
  Rational_eqn Rat1 Rat1' && Rational_eqn Rat2 Rat2' .

Definition Rational_inverse_true (Rat1 Rat2 Rat1' Rat2' : Rational_term):bool :=
  match reciprocal Rat1' with
  |Some Rat11 => match reciprocal Rat2' with 
                |Some Rat22 => Rational_eqn_pair Rat1 Rat2 Rat11 Rat22
                |None =>false
                end
  |None =>false
  end.
End Rational.




Module TermVarName := StringName.

Inductive term_pattern :=
| TPNum (z: Z)
| TPInfty (i: TERM.Infty)
| TPConst (c: TERM.Const)
| TPUnOp (u: TERM.UnOp) (t: term_pattern)
| TPBinOp (b: TERM.BinOp) (t1 t2: term_pattern)
| TPApply (t1 t2: term_pattern)
| TPVar (x: VarName.t)
| TPBinder (b: TERM.Binder) (x: TermVarName.t) (t1: term_pattern)
| TPTVar (x: TermVarName.t)
| TPInterval (b: TERM.Interval_type) (t1 t2: term_pattern)
| TPSet (l: list VarName.t) (t: term_pattern) (P: prop_pattern)

with prop_pattern :=
| PPLongOrder (o: PROP.ROrder) (t: term_pattern) (P: prop_pattern)
| PPUnPred (u: PROP.UnOp) (t1: term_pattern)
| PPBinPred (b: PROP.BinOp) (t1 t2: term_pattern)
| PPCBinPred (p: PROP.BinOp) (t1 t2: term_pattern) (cont: list prop_context_pattern)
| PPUnOp (u: PROP.UniConnect) (P: prop_pattern)
| PPBinOp (b: PROP.BinConnect) (P Q: prop_pattern)
| PPQuant (q: PROP.Quant) (x: VarName.t) (P: prop_pattern)

with prop_context_pattern :=
| CPPeriodicFun (t1: term_pattern)
| CPEvenFun
| CPLimPlus (t1 t2: term_pattern)
| CPLimMult (t1 t2: term_pattern)
.

Fixpoint tm2tmp (tm: term) : term_pattern :=
  match tm with
  | TNum z => TPNum z
  | TInfty i => TPInfty i
  | TConst c => TPConst c
  | TUnOp u t1 => TPUnOp u (tm2tmp t1)
  | TBinOp b t1 t2 => TPBinOp b (tm2tmp t1) (tm2tmp t2)
  | TApply t1 t2 => TPApply (tm2tmp t1) (tm2tmp t2)
  | TBinder b x t1 => TPBinder b x (tm2tmp t1)
  | TVar x => TPVar x
  | TInterval t t1 t2 => TPInterval t (tm2tmp t1) (tm2tmp t2)
  | TSet l t P => TPSet l (tm2tmp t) (p2pp P)
  end

with p2pp (P: prop) : prop_pattern :=
  match P with
  | PLongOrder o t P => PPLongOrder o (tm2tmp t) (p2pp P)
  | PUnPred u t1 => PPUnPred u (tm2tmp t1)
  | PBinPred b t1 t2 => PPBinPred b (tm2tmp t1) (tm2tmp t2)
  | PCBinPred b t1 t2 cont => PPCBinPred b (tm2tmp t1) (tm2tmp t2) (map cont2pcontp cont)
  | PUnOp u P => PPUnOp u (p2pp P)
  | PBinOp b P Q => PPBinOp b (p2pp P) (p2pp Q)
  | PQuant q x P => PPQuant q x (p2pp P)
  end

with cont2pcontp (cont: prop_context) :=
  match cont with
  | CPeriodicFun t1 => CPPeriodicFun (tm2tmp t1)
  | CEvenFun => CPEvenFun
  | CLimPlus t1 t2 => CPLimPlus (tm2tmp t1) (tm2tmp t2)
  | CLimMult t1 t2 => CPLimMult (tm2tmp t1) (tm2tmp t2)
  end.

Fixpoint tm2tmp_with_var (tm: term) (var: VarName.t) : term_pattern :=
  match tm with
  | TNum z => TPNum z
  | TInfty i => TPInfty i
  | TConst c => TPConst c
  | TUnOp u t1 => TPUnOp u (tm2tmp_with_var t1 var)
  | TBinOp b t1 t2 => TPBinOp b (tm2tmp_with_var t1 var) (tm2tmp_with_var t2 var)
  | TApply t1 t2 => TPApply (tm2tmp_with_var t1 var) (tm2tmp_with_var t2 var)
  | TBinder b x t1 => TPBinder b x (tm2tmp_with_var t1 var)
  | TVar x => if VarName.eqb var x then TPTVar x else TPVar x
  | TInterval t t1 t2 => TPInterval t (tm2tmp_with_var t1 var) (tm2tmp_with_var t2 var)
  | TSet l t P => TPSet l (tm2tmp_with_var t var) (p2pp_with_var P var)
  end

with p2pp_with_var (P: prop) (var: VarName.t) :=
  match P with
  | PLongOrder o t P => PPLongOrder o (tm2tmp_with_var t var) (p2pp_with_var P var)
  | PUnPred u t1 => PPUnPred u (tm2tmp_with_var t1 var)
  | PBinPred b t1 t2 => PPBinPred b (tm2tmp_with_var t1 var) (tm2tmp_with_var t2 var)
  | PCBinPred b t1 t2 cont => PPCBinPred b (tm2tmp_with_var t1 var) (tm2tmp_with_var t2 var) (map (fun x => cont2pcontp_with_var x var) cont)
  | PUnOp u P => PPUnOp u (p2pp_with_var P var)
  | PBinOp b P Q => PPBinOp b (p2pp_with_var P var) (p2pp_with_var Q var)
  | PQuant q x P => PPQuant q x (p2pp_with_var P var)
  end

with cont2pcontp_with_var (cont: prop_context) (var: VarName.t) :=
  match cont with
  | CPeriodicFun t1 => CPPeriodicFun (tm2tmp_with_var t1 var)
  | CEvenFun => CPEvenFun
  | CLimPlus t1 t2 => CPLimPlus (tm2tmp_with_var t1 var) (tm2tmp_with_var t2 var)
  | CLimMult t1 t2 => CPLimMult (tm2tmp_with_var t1 var) (tm2tmp_with_var t2 var)
  end.

Definition prop_pattern_opposite (pp : prop_pattern) : prop_pattern :=
  match pp with
  | PPBinPred PROP.REq tm1 tm2 => PPBinPred PROP.REq tm2 tm1
  | PPBinPred PROP.RLe tm1 tm2 => PPBinPred PROP.RGe tm2 tm1
  | PPBinPred PROP.RLt tm1 tm2 => PPBinPred PROP.RGt tm2 tm1
  | PPBinPred PROP.RGe tm1 tm2 => PPBinPred PROP.RLe tm2 tm1
  | PPBinPred PROP.RGt tm1 tm2 => PPBinPred PROP.RLt tm2 tm1
  | PPBinPred PROP.RNeq tm1 tm2 => PPBinPred PROP.RNeq tm2 tm1
  | _ => pp
  end.

Module TERM_PM.

Fixpoint look_up (asgn: list (TermVarName.t * term)) (x: TermVarName.t) : option term :=
  match asgn with
  | nil => None
  | (x0, t0) :: asgn0 =>
      if TermVarName.eqb x0 x
      then Some t0
      else look_up asgn0 x
  end.

Fixpoint pattern_match_term_rec (t1: term) (t2: term_pattern) (binded: list VarName.t) (res: list (TermVarName.t * term)): option (list (TermVarName.t * term)) :=
  match t1, t2 with
  | TNum z1, TPNum z2 =>
      if Z.eqb z1 z2
      then Some res
      else None
  | TConst c1, TPConst c2 =>
      if TERM.Const_eqb c1 c2
      then Some res
      else None
  | TInfty i1, TPInfty i2 =>
      if TERM.Infty_eqb i1 i2
      then Some res
      else None
  | TUnOp u1 t1, TPUnOp u2 t2 =>
      if TERM.UnOp_eqb u1 u2
      then pattern_match_term_rec t1 t2 binded res
      else None
  | TBinOp b1 t11 t12, TPBinOp b2 t21 t22 =>
      if TERM.BinOp_eqb b1 b2
      then match pattern_match_term_rec t11 t21 binded res with
           | Some res' => pattern_match_term_rec t12 t22 binded res'
           | None => None
           end
      else None
  | TApply t11 t12, TPApply t21 t22 =>
      match pattern_match_term_rec t11 t21 binded res with
      | Some res' => pattern_match_term_rec t12 t22 binded res'
      | None => None
      end
  | TVar x1, TPVar x2 =>
      if VarName.eqb x1 x2
      then Some res
      else None
  | TBinder b1 x1 t11, TPBinder b2 x2 t21 =>
      pattern_match_term_rec (subst_term t11 ((x1, TVar x2) :: nil)) t21 (x2 :: binded) res
  | _, TPTVar x =>
     if existsb (fun x => freely_occur_term x t1) binded
      then None
      else match look_up res x with
           | Some t1' => if term_eqb t1 t1'
                         then Some res
                         else None
           | None => Some ((x, t1) :: res)
           end
  | _, _ => None
  end.

Fixpoint pattern_match_prop_rec (P1: prop) (P2: prop_pattern) (binded: list VarName.t) (res: list (TermVarName.t * term)): option (list (TermVarName.t * term)) :=
  match P1, P2 with
  | PUnPred u1 t11, PPUnPred u2 t21 =>
      if PROP.UnOp_eqb u1 u2
      then pattern_match_term_rec t11 t21 binded res
      else None
  | PBinPred b1 t11 t12, PPBinPred b2 t21 t22 =>
      if PROP.BinOp_eqb b1 b2
      then match pattern_match_term_rec t11 t21 binded res with
           | Some res' => pattern_match_term_rec t12 t22 binded res'
           | None => None
           end
      else None
  | PUnOp u1 P1, PPUnOp u2 P2 =>
      if PROP.UniConnect_eqb u1 u2
      then pattern_match_prop_rec P1 P2 binded res
      else None
  | PBinOp b1 P11 P12, PPBinOp b2 P21 P22 =>
      if PROP.BinConnect_eqb b1 b2
      then match pattern_match_prop_rec P11 P21 binded res with
           | Some res' => pattern_match_prop_rec P12 P22 binded res'
           | None => None
           end
      else None
  | PQuant q1 x1 P11, PPQuant q2 x2 P21 =>
      pattern_match_prop_rec (subst_prop P11 ((x1, TVar x2) :: nil)) P21 (x2 :: binded) res
  | _, _ => None
  end.

Definition subst_pattern_tvar (x: TermVarName.t) (st: list (TermVarName.t * term)): term :=
  match TermVarName.look_up x st with
  | Some t => t
  | None => TNum 0 (* should not happend *)
  end.

Fixpoint freely_occurs_in_term_pattern (t: term_pattern): list VarName.t :=
  match t with
  | TPUnOp u t1 => freely_occurs_in_term_pattern t1
  | TPBinOp b t1 t2 => freely_occurs_in_term_pattern t1 ++ freely_occurs_in_term_pattern t2
  | TPApply t1 t2 => freely_occurs_in_term_pattern t1 ++ freely_occurs_in_term_pattern t2
  | TPVar x => x :: nil
  | TPBinder b x t1 => filter (fun x0 => negb (VarName.eqb x0 x)) (freely_occurs_in_term_pattern t1)
  | TPInterval b t1 t2 => freely_occurs_in_term_pattern t1 ++ freely_occurs_in_term_pattern t2
  | TPSet l t P => filter (fun x0 => negb (list_in VarName.eqb l x0)) (freely_occurs_in_term_pattern t ++ freely_occurs_in_prop_pattern P)
  | _ => nil
  end

with freely_occurs_in_prop_pattern (P: prop_pattern): list VarName.t :=
  match P with
  | PPLongOrder o t P => freely_occurs_in_term_pattern t ++ freely_occurs_in_prop_pattern P
  | PPUnPred u t1 => freely_occurs_in_term_pattern t1
  | PPBinPred b t1 t2 => freely_occurs_in_term_pattern t1 ++ freely_occurs_in_term_pattern t2
  | PPCBinPred b t1 t2 cont => freely_occurs_in_term_pattern t1 ++ freely_occurs_in_term_pattern t2 ++ concat (map freely_occurs_in_prop_cont_pattern cont)
  | PPUnOp u P1 => freely_occurs_in_prop_pattern P1
  | PPBinOp b P1 P2 => freely_occurs_in_prop_pattern P1 ++  freely_occurs_in_prop_pattern P2
  | PPQuant q x P1 => filter (fun x0 => negb (VarName.eqb x0 x)) (freely_occurs_in_prop_pattern P1)
  end

with freely_occurs_in_prop_cont_pattern (cont: prop_context_pattern): list VarName.t :=
  match cont with
  | CPPeriodicFun t1 => freely_occurs_in_term_pattern t1
  | CPEvenFun => nil
  | CPLimPlus t1 t2 => (freely_occurs_in_term_pattern t1) ++ (freely_occurs_in_term_pattern t2)
  | CPLimMult t1 t2 => (freely_occurs_in_term_pattern t1) ++ (freely_occurs_in_term_pattern t2)
  end.

Fixpoint pattern_subst_term_helper (terms: list VarName.t) (l: list VarName.t) : (list VarName.t) * (list (TermVarName.t * term)) :=
  match l with
  | x :: l' => let x' := VarName.next_name_with_prefix terms "x" in
               let (lvar, st) := pattern_subst_term_helper (x' :: terms) l' in
               (x' :: lvar, (x, TVar x') :: st)
  | nil => (nil, nil)
  end.

Fixpoint pattern_subst_term (t: term_pattern) (st: subst_task) (st': list (VarName.t * term)): term :=
  match t with
  | TPNum z =>
      TNum z
  | TPConst c =>
      TConst c
  | TPUnOp u t1 =>
      TUnOp u (pattern_subst_term t1 st st')
  | TPBinOp b t1 t2 =>
      TBinOp b (pattern_subst_term t1 st st') (pattern_subst_term t2 st st')
  | TPApply t1 t2 =>
      TApply (pattern_subst_term t1 st st') (pattern_subst_term t2 st st')
  | TPVar x =>
      subst_var x st'
  | TPTVar x =>
      subst_pattern_tvar x st
  | TPBinder b x t1 =>
      let st'' := VarName.remove x st' in
      if (freely_occur_terms x st || freely_occur_terms x st'')%bool
      then let x' := VarName.next_name_with_prefix
                       (freely_occurs_in_terms st ++
                        freely_occurs_in_terms st'' ++
                        freely_occurs_in_term_pattern t1)
                       "x" in
           TBinder b x' (pattern_subst_term t1 st ((x, TVar x') :: st''))
      else TBinder b x (pattern_subst_term t1 st st'')
  | TPInfty i =>
     TInfty i
  | TPInterval b t1 t2 => TInterval b (pattern_subst_term t1 st st') (pattern_subst_term t2 st st')
  | TPSet l t P => let st'' := fold_left (fun l x0 => VarName.remove x0 l) l st' in
                   let l_free := filter (fun x0 => negb (orb (freely_occur_terms x0 st) (freely_occur_terms x0 st''))) l in
                   let l_binded := filter (fun x0 => orb (freely_occur_terms x0 st) (freely_occur_terms x0 st'')) l in
                   let (l_binded_change_name, name_map) := subst_term_helper (freely_occurs_in_terms st ++ freely_occurs_in_terms st'' ++ freely_occurs_in_term_pattern t ++ freely_occurs_in_prop_pattern P) l_binded in
                   TSet (l_free ++ l_binded_change_name) (pattern_subst_term t st (name_map ++ st'')) (pattern_subst_prop P st (name_map ++ st''))
  end

with pattern_subst_prop (P: prop_pattern) (st: list (TermVarName.t * term)) (st': list (VarName.t * term)): prop :=
  match P with
  | PPLongOrder o t P =>
      PLongOrder o (pattern_subst_term t st st') (pattern_subst_prop P st st')
  | PPUnPred u t1 =>
      PUnPred u (pattern_subst_term t1 st st')
  | PPBinPred b t1 t2 =>
      PBinPred b (pattern_subst_term t1 st st') (pattern_subst_term t2 st st')
  | PPCBinPred b t1 t2 cont =>
      PCBinPred b (pattern_subst_term t1 st st') (pattern_subst_term t2 st st') (map (fun x => pattern_subst_cont x st st') cont)
  | PPUnOp u P1 =>
      PUnOp u (pattern_subst_prop P1 st st')
  | PPBinOp b P1 P2 =>
      PBinOp b (pattern_subst_prop P1 st st') (pattern_subst_prop P2 st st')
  | PPQuant q x P1 =>
      let st'' := VarName.remove x st' in
      if (freely_occur_terms x st || freely_occur_terms x st'')%bool
      then let x' := VarName.next_name_with_prefix
                       (freely_occurs_in_terms st ++
                        freely_occurs_in_terms st'' ++
                        freely_occurs_in_prop_pattern P1) "x" in
                          PQuant q x' (pattern_subst_prop P1 ((x, TVar x') :: st) st'')
                     else PQuant q x (pattern_subst_prop P1 st st'')
  end

with pattern_subst_cont (cont: prop_context_pattern) (st: list (TermVarName.t * term)) (st': list (VarName.t * term)): prop_context :=
  match cont with
  | CPPeriodicFun t1 => CPeriodicFun (pattern_subst_term t1 st st')
  | CPEvenFun => CEvenFun
  | CPLimPlus t1 t2 => CLimPlus (pattern_subst_term t1 st st') (pattern_subst_term t2 st st')
  | CPLimMult t1 t2 => CLimMult (pattern_subst_term t1 st st') (pattern_subst_term t2 st st')
  end.

End TERM_PM.

Fixpoint match_in_list_prop (hypos : list prop) (pp : prop_pattern) : bool :=
  match hypos with
  | hypo :: hypos' =>
      match (TERM_PM.pattern_match_prop_rec hypo pp nil nil), (TERM_PM.pattern_match_prop_rec hypo (prop_pattern_opposite pp) nil nil) with
      | None, None => match_in_list_prop hypos' pp
      | _, _ => true
      end
  | _ => false
  end.

Fixpoint Beta_rec (t: term) (st: subst_task): term :=
  match t with
  | TApply (TBinder TERM.LambdaB x t1) t2 =>
      Beta_rec t1 ((x, t2) :: st)
  | _ =>
      subst_term t st
  end.

Fixpoint Beta_term (t: term) :=
  match t with
  | TNum z => TNum z
  | TConst c => TConst c
  | TInfty i => TInfty i
  | TUnOp u t1 => TUnOp u (Beta_term t1)
  | TBinOp b t1 t2 => TBinOp b (Beta_term t1) (Beta_term t2)
  | TApply (TBinder TERM.LambdaB _ _) _ => Beta_rec t nil
  | TApply t1 t2 => TApply (Beta_term t1) (Beta_term t2)
  | TVar x => TVar x
  | TBinder b x t1 => TBinder b x (Beta_term t1)
  | TInterval b t1 t2 => TInterval b (Beta_term t1) (Beta_term t2)
  | TSet l t P => TSet l (Beta_term t) (Beta_prop P)
  end

with Beta_prop (P: prop) :=
  match P with
  | PLongOrder o t P1 => PLongOrder o (Beta_term t) (Beta_prop P1)
  | PUnPred u t1 => PUnPred u (Beta_term t1)
  | PBinPred b t1 t2 => PBinPred b (Beta_term t1) (Beta_term t2)
  | PCBinPred b t1 t2 cont => PCBinPred b (Beta_term t1) (Beta_term t2) (map Beta_prop_cont cont)
  | PUnOp u P1 => PUnOp u (Beta_prop P1)
  | PBinOp b P1 P2 => PBinOp b (Beta_prop P1) (Beta_prop P2)
  | PQuant q x P1 => PQuant q x (Beta_prop P1)
  end

with Beta_prop_cont (cont : prop_context) :=
  match cont with
  | CPeriodicFun t1 => CPeriodicFun (Beta_term t1)
  | CEvenFun => CEvenFun
  | CLimPlus t1 t2 => CLimPlus (Beta_term t1) (Beta_term t2)
  | CLimMult t1 t2 => CLimMult (Beta_term t1) (Beta_term t2)
  end.

Module SYMBOLIC_CHECKER.

Definition new_hyp_name (hs: list (HypName.t * prop)) (s: string): option HypName.t :=
  Some (HypName.next_name_with_prefix (map fst hs) s).

Fixpoint multi_give_new_hyp_name (hs: list (HypName.t * prop)) (s: string) (props: list prop): option (list (HypName.t * prop)) :=
  match props with
  | nil => Some nil
  | p :: props' =>
      match new_hyp_name hs s with
      | Some h =>
          match multi_give_new_hyp_name ((h, p) :: hs) s props' with
          | Some res => Some ((h, p) :: res)
          | None => None
          end
      | None => None
      end
  end.

Fixpoint assum_auto (hs: list (HypName.t * prop)) : list (HypName.t * prop) :=
  match hs with
     | (h,PBinPred o t1 t2) :: h' =>
        match o with
         | PROP.REq => match t2 with
                  | TUnOp TERM.ZCeil t' =>
                      match new_hyp_name hs "___hyp" with 
                      | Some h1 => let hs' := (h1,PBinPred PROP.RGe t1 t')::hs in
                                match new_hyp_name hs' "___hyp" with
                                 | Some h2 =>
                                    (h2,PBinPred PROP.RLt t1 (TBinOp TERM.RPlus (t') (TNum(1))))::hs'
                                 | None => hs'
                                 end
                      | None => hs
                      end
                  | TUnOp TERM.ZFloor t' =>
                      match new_hyp_name hs "___hyp" with 
                     | Some h1 => let hs' := (h1,PBinPred PROP.RGe t1 t')::hs in
                            match new_hyp_name hs' "___hyp" with
                             | Some h2 =>
                                (h2,PBinPred PROP.RLt t1 (TBinOp TERM.RPlus (t') (TNum(1))))::hs'
                             | None => hs'
                             end
                      | None => hs
                      end
                  | _ => (h,PBinPred o t1 t2)::(assum_auto h')
                  end
          |_ =>(h,PBinPred o t1 t2)::(assum_auto h')
          end    
     | t :: h' =>t::(assum_auto h')
     | nil => hs
      end.

Definition assum_auto_inference (pg : proof_goal) : proof_goal :=
  match pg with 
  | {|assu :=assum; concl:=concl; cont := cont |}=> let hs := assum_auto assum in
                               {|assu :=hs++assum; concl:=concl; cont:=cont |}
  end.

(*complete assumption_auto_inference with ceil and floor*)                                                            
Compute assum_auto_inference {|assu := ("h",PBinPred PROP.REq (TVar "x") (TUnOp TERM.ZCeil
(TBinOp TERM.RMult
   (TBinOp TERM.RDiv (TNum 6) (TNum 25))
   (TBinOp TERM.RDiv (TNum 1) (TVar "eps")))))::nil ; concl:= (PBinPred PROP.RGt (TVar "eps") (TNum 0)) |}.


Definition test_eqn_R (t1 t2 :term):bool :=
  Rational.Rational_eqn (Rational.eval t1) (Rational.eval t2).

(* to test whether test_eqn_R is right
 Compute test_eqn_R
(TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 2))	(((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))))	((TNum 2)))))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" )))))))
  (TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 2))	(((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" )))))))	((TBinOp TERM.RMult
	((TNum 2))	(((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" )))))))). *)

Definition test_eqn_pair_R (t1 t2 t1' t2': term): bool :=
  (test_eqn_R t1 t1' && test_eqn_R t2 t2').

Definition test_eqn (t1 t2: term): bool :=
  let pol := Poly.simplify (Poly.eval (TBinOp TERM.RMinus t1 t2)) in
  match pol with
  | nil => true
  | _ => false
  end.

Definition test_eqn_pair (t1 t2 t1' t2': term): bool :=
  (test_eqn t1 t1' && test_eqn t2 t2').

Definition get_prop_from_hyp_name (pg: proof_goal) (h: HypName.t): option prop :=
  (fix get_prop_from_assu (l: list (HypName.t * prop)): option prop :=
    match l with
    | nil => None
    | (h0, P) :: l0 => if HypName.eqb h0 h then Some P else get_prop_from_assu l0
    end) (assu pg).

Definition ROrder_sum (o1 o2: PROP.ROrder): option PROP.ROrder :=
  match o1, o2 with
  | PROP.REq, PROP.REq => Some PROP.REq
  | PROP.REq, PROP.RLt => Some PROP.RLt
  | PROP.REq, PROP.RLe => Some PROP.RLe
  | PROP.REq, PROP.RGt => Some PROP.RGt
  | PROP.REq, PROP.RGe => Some PROP.RGe
  | PROP.RLt, PROP.RLt => Some PROP.RLt
  | PROP.RLt, PROP.RLe => Some PROP.RLt
  | PROP.RLt, PROP.REq => Some PROP.RLt
  | PROP.RLe, PROP.RLt => Some PROP.RLt
  | PROP.RLe, PROP.RLe => Some PROP.RLe
  | PROP.RLe, PROP.REq => Some PROP.RLe
  | PROP.RGt, PROP.RGt => Some PROP.RGt
  | PROP.RGt, PROP.RGe => Some PROP.RGt
  | PROP.RGt, PROP.REq => Some PROP.RGt
  | PROP.RGe, PROP.RGt => Some PROP.RGt
  | PROP.RGe, PROP.RGe => Some PROP.RGe
  | PROP.RGe, PROP.REq => Some PROP.RGe
  | _, _ => None
  end.

Definition ROrder_revo (o: PROP.ROrder): option PROP.ROrder :=
  match o with
  | PROP.REq => Some PROP.REq
  | PROP.RLt => Some PROP.RGt
  | PROP.RLe => Some PROP.RGe
  | PROP.RGt => Some PROP.RLt
  | PROP.RGe => Some PROP.RLe
  | PROP.RNeq => None
  end.

Definition ROrder_rev (o: PROP.ROrder): PROP.ROrder :=
  match o with
  | PROP.REq => PROP.REq
  | PROP.RLt => PROP.RGt
  | PROP.RLe => PROP.RGe
  | PROP.RGt => PROP.RLt
  | PROP.RGe => PROP.RLe
  | PROP.RNeq => PROP.RNeq
  end.


Definition prop_sum (P Q: prop): option prop :=
  match P, Q with
  | PBinPred (PROP.HasOrder o1) t11 t12, PBinPred (PROP.HasOrder o2) t21 t22 =>
      match ROrder_sum o1 o2 with
      | Some o => Some (PBinPred o (TBinOp TERM.RPlus t11 t21) (TBinOp TERM.RPlus t12 t22))
      | None => None
      end
  | _, _ => None
  end.

Definition prop_diff (P Q: prop): option prop :=
  match P, Q with
  | PBinPred (PROP.HasOrder o1) t11 t12, PBinPred (PROP.HasOrder o2) t21 t22 =>
      match ROrder_revo o2 with
      | Some ro2 =>
          match ROrder_sum o1 ro2 with
          | Some o =>
              Some (PBinPred o (TBinOp TERM.RMinus t11 t21) (TBinOp TERM.RMinus t12 t22))
          | None =>
              None
          end
      | None => None
      end
  | _, _ => None
  end.

Definition option_prop_sum (oP oQ: option prop): option prop :=
  match oP, oQ with
  | Some P, Some Q => prop_sum P Q
  | _, _ => None
  end.

Definition option_prop_diff (oP oQ: option prop): option prop :=
  match oP, oQ with
  | Some P, Some Q => prop_diff P Q
  | _, _ => None
  end.

(*有理数判断正负*)
Definition R_ge_0 (coef : Z*Z) : bool :=
 ((Z.geb (fst coef) 0) && (Z.gtb (snd coef) 0)) || ((Z.leb (fst coef) 0) && (Z.ltb (snd coef) 0)).

Definition R_gt_0 (coef : Z*Z) : bool :=
 ((Z.gtb (fst coef) 0) && (Z.gtb (snd coef) 0)) || ((Z.ltb (fst coef) 0) && (Z.ltb (snd coef) 0)).

Definition R_le_0 (coef : Z*Z) : bool :=
 ((Z.leb (fst coef) 0) && (Z.gtb (snd coef) 0)) || ((Z.geb (fst coef) 0) && (Z.ltb (snd coef) 0)).

Definition R_lt_0 (coef : Z*Z) : bool :=
 ((Z.ltb (fst coef) 0) && (Z.gtb (snd coef) 0)) || ((Z.gtb (fst coef) 0) && (Z.ltb (snd coef) 0)).

 
(*判断简单包含有理数和常数的多项式正负*)
Fixpoint poly_ge_0 (pol :poly) : bool :=
 match pol with 
  | nil =>true
  | p::pt0 => 
     match p with 
     | {| coef :=coef; prods:=prods |} =>
       match prods with 
       |nil =>if R_ge_0 coef then poly_ge_0 pt0 else false
       | t::_ =>match t with 
              |TConst c => if R_ge_0 coef then poly_ge_0 pt0 else false 
              |_ =>false
             end
       end
    end
 end.

Fixpoint poly_gt_0 (pol :poly) : bool :=
 match pol with 
  | nil =>true
  | p::pt0 => 
     match p with 
     | {| coef :=coef; prods:=prods |} =>
       match prods with 
       |nil =>if R_gt_0 coef then poly_gt_0 pt0 else false
       | t::_ =>match t with 
              |TConst c => if R_gt_0 coef then poly_gt_0 pt0 else false 
              |_ =>false
             end
       end
    end
 end.

Fixpoint poly_le_0 (pol :poly) : bool :=
 match pol with 
  | nil =>true
  | p::pt0 => 
     match p with 
     | {| coef :=coef; prods:=prods |} =>
       match prods with 
       |nil =>if R_le_0 coef then poly_le_0 pt0 else false
       | t::_ =>match t with 
              |TConst c => if R_le_0 coef then poly_le_0 pt0 else false 
              |_ =>false
             end
       end
    end
  end.

Fixpoint poly_lt_0 (pol :poly) : bool :=
 match pol with 
  | nil =>true
  | p::pt0 => 
     match p with 
     | {| coef :=coef; prods:=prods |} =>
       match prods with 
       |nil =>if R_lt_0 coef then poly_lt_0 pt0 else false
       | t::_ =>match t with 
              |TConst c => if R_lt_0 coef then poly_lt_0 pt0 else false 
              |_ =>false
             end
       end
    end
  end.

(*利用上面多项式的判断来判断有理式的情况*)
Definition rational_ge_0 (rat : Rational_term) :bool :=
  (poly_ge_0 (Poly.simplify(Numerator rat)) && poly_gt_0 (Poly.simplify(Denominator rat)))
  ||((poly_le_0 (Poly.simplify(Numerator rat)))&& (poly_lt_0 (Poly.simplify(Denominator rat)))).

Definition rational_gt_0 (rat : Rational_term) :bool :=
  (poly_gt_0 (Poly.simplify(Numerator rat)) && poly_gt_0 (Poly.simplify(Denominator rat)))
  ||((poly_lt_0 (Poly.simplify(Numerator rat)))&& (poly_lt_0 (Poly.simplify(Denominator rat)))).

Definition rational_le_0 (rat : Rational_term) :bool :=
  (poly_ge_0 (Poly.simplify(Numerator rat)) && poly_lt_0 (Poly.simplify(Denominator rat)))
  ||((poly_le_0 (Poly.simplify(Numerator rat)))&& (poly_gt_0 (Poly.simplify(Denominator rat)))).

Definition rational_lt_0 (rat : Rational_term) :bool :=
  (poly_gt_0 (Poly.simplify(Numerator rat)) && poly_lt_0 (Poly.simplify(Denominator rat)))
  ||((poly_lt_0 (Poly.simplify(Numerator rat)))&& (poly_gt_0 (Poly.simplify(Denominator rat)))).

(*比较两个有理式大小，采用对角相乘再相减，转化为多项式正负的判断，但分母需要满足一定条件*)
Definition compare_r_le (r1 r2 : Rational_term) :bool :=
  let pol :=Poly.RMinus_eval (Poly.RMult_eval (Numerator r2) (Denominator r1))  (Poly.RMult_eval (Numerator r1) (Denominator r2)) in
  poly_ge_0 (Poly.simplify pol).

Definition compare_r_lt (r1 r2 : Rational_term) :bool :=
  let pol :=Poly.RMinus_eval (Poly.RMult_eval (Numerator r2) (Denominator r1))  (Poly.RMult_eval (Numerator r1) (Denominator r2)) in
  poly_gt_0 (Poly.simplify pol).

Definition compare_r_ge (r1 r2 : Rational_term) :bool :=
  let pol :=Poly.RMinus_eval (Poly.RMult_eval (Numerator r1) (Denominator r2))  (Poly.RMult_eval (Numerator r2) (Denominator r1)) in
  poly_ge_0 (Poly.simplify pol). 

Definition compare_r_gt (r1 r2 : Rational_term) :bool :=
  let pol :=Poly.RMinus_eval (Poly.RMult_eval (Numerator r1) (Denominator r2))  (Poly.RMult_eval (Numerator r2) (Denominator r1)) in
  poly_gt_0 (Poly.simplify pol).  


(*利用形如 t>0 的前提来判断 t 的正负*)
Definition term_ge_0_u (t:term) (P:prop)  :bool :=
  match P with 
  | PBinPred PROP.REq _ (TNum (z)) => if Z.geb z 0 then true
                                 else false
  | PBinPred PROP.RGe _ (TNum (z)) => if Z.geb z 0 then true
                                 else false
  | PBinPred PROP.RGt _ (TNum (z)) => if Z.geb z 0 then true
                                 else false
  | PBinPred PROP.REq (TNum (z)) _  => if Z.geb z 0 then true
                                 else false  
  | PBinPred PROP.RLe (TNum (z)) _  => if Z.geb z 0 then true
                                 else false             
  | PBinPred PROP.RLt (TNum (z)) _  => if Z.geb z 0 then true
                                 else false
  | _ =>false                                   
  end.

Definition term_gt_0_u (t:term) (P:prop)  :bool :=
  match P with 
  | PBinPred PROP.REq _ (TNum (z)) => if Z.gtb z 0 then true
                                 else false
  | PBinPred PROP.RGe _ (TNum (z)) => if Z.gtb z 0 then true
                                 else false
  | PBinPred PROP.RGt _ (TNum (z)) => if Z.geb z 0 then true
                                 else false
  | PBinPred PROP.REq (TNum (z)) _  => if Z.gtb z 0 then true
                                 else false  
  | PBinPred PROP.RLe (TNum (z)) _  => if Z.gtb z 0 then true
                                 else false             
  | PBinPred PROP.RLt (TNum (z)) _  => if Z.geb z 0 then true
                                 else false
  | _ =>false                                   
  end.

Definition term_le_0_u (t:term) (P:prop)  :bool :=
  match P with 
  | PBinPred PROP.REq _ (TNum (z)) => if Z.leb z 0 then true
                                 else false
  | PBinPred PROP.RLe _ (TNum (z)) => if Z.leb z 0 then true
                                 else false
  | PBinPred PROP.RLt _ (TNum (z)) => if Z.leb z 0 then true
                                 else false
  | PBinPred PROP.REq (TNum (z)) _  => if Z.leb z 0 then true
                                 else false  
  | PBinPred PROP.RGe (TNum (z)) _  => if Z.leb z 0 then true
                                 else false             
  | PBinPred PROP.RGt (TNum (z)) _  => if Z.leb z 0 then true
                                 else false
  | _ =>false                                   
  end.

Definition term_lt_0_u (t:term) (P:prop)  :bool :=
  match P with 
  | PBinPred PROP.REq _ (TNum (z)) => if Z.ltb z 0 then true
                                 else false
  | PBinPred PROP.RLe _ (TNum (z)) => if Z.ltb z 0 then true
                                 else false
  | PBinPred PROP.RLt _ (TNum (z)) => if Z.leb z 0 then true
                                 else false
  | PBinPred PROP.REq (TNum (z)) _  => if Z.ltb z 0 then true
                                 else false  
  | PBinPred PROP.RGe (TNum (z)) _  => if Z.ltb z 0 then true
                                 else false             
  | PBinPred PROP.RGt (TNum (z)) _  => if Z.leb z 0 then true
                                 else false
  | _ =>false                                   
  end.

(*利用当前证明中的前提对term判断正负*)
Definition term_ge_0_hint (pg :proof_goal) (t1 :term) :bool :=
  existsb (term_ge_0_u t1) (map snd pg.(assu)).

Definition term_gt_0_hint (pg :proof_goal) (t1 :term) :bool :=
  existsb (term_gt_0_u t1) (map snd pg.(assu)).

Definition term_le_0_hint (pg :proof_goal) (t1 :term) :bool :=
  existsb (term_le_0_u t1) (map snd pg.(assu)).

Definition term_lt_0_hint (pg :proof_goal) (t1 :term) :bool :=
  existsb (term_lt_0_u t1) (map snd pg.(assu)).


Fixpoint term_ge_0 (pg :proof_goal) (t :term) :bool :=
  match t with
  | TNum z => if Z.geb z 0 then true else false
  | TConst _ => true
  | TUnOp u t1 => match u with 
                 | TERM.RAbs => true
                 | TERM.RNeg => term_le_0 pg t1
                 | TERM.ZCeil => term_ge_0 pg t1
                 | TERM.ZFloor => term_ge_0 pg t1
                 | _ =>false
                 end
  | TBinOp b t1 t2 => match b with
                    | TERM.RPlus =>(term_ge_0 pg t1)&&(term_ge_0 pg t2)
                    | TERM.RMinus => compare_r_ge (Rational.eval t1)(Rational.eval t2) || (term_ge_0 pg t1)&&(term_le_0 pg t2)
                    | TERM.RMult => ((term_ge_0 pg t1)&&(term_ge_0 pg t2)) || ((term_le_0 pg t1)&&(term_le_0 pg t2))
                    | TERM.RDiv => ((term_ge_0 pg t1)&&(term_ge_0 pg t2)) || ((term_le_0 pg t1)&&(term_le_0 pg t2))
                    | TERM.RPower => match t2 with 
                                     | TNum z => if Z.even z then true
                                                else (term_ge_0 pg t1)
                                     | _ => false
                                     end
                    | TERM.RSqrt => term_ge_0 pg t1
                    | TERM.RMax => (term_ge_0 pg t1) || (term_ge_0 pg t2)
                    | TERM.RMin => (term_ge_0 pg t1) && (term_ge_0 pg t2)
                    | TERM.RLim =>   term_ge_0 pg t2
                   
                    (* to be fixed *)
                    end
  |_ => term_ge_0_hint pg t
  end

with term_le_0 (pg :proof_goal) (t :term) :bool :=
  match t with  
  | TNum z => if Z.leb z 0 then true else false
  | TConst _ => false
  | TUnOp u t1 => match u with
                 | TERM.RAbs => false
                 | TERM.RNeg => term_ge_0 pg t1
                 | TERM.ZCeil => term_le_0 pg t1
                 | TERM.ZFloor => term_le_0 pg t1  
                 | _ =>false
                 end
  | TBinOp b t1 t2 => match b with
                    | TERM.RPlus =>(term_le_0 pg t1)&&(term_le_0 pg t2)
                    | TERM.RMinus => (term_le_0 pg t1)&&(term_ge_0 pg t2) || (compare_r_le (Rational.eval t1)(Rational.eval t2))
                    | TERM.RMult => ((term_ge_0 pg t1)&&(term_le_0 pg t2)) ||((term_le_0 pg t1)&&(term_ge_0 pg t2))
                    | TERM.RDiv => ((term_ge_0 pg t1)&&(term_le_0 pg t2)) || ((term_le_0 pg t1)&&(term_ge_0 pg t2))
                    | TERM.RPower => match t2 with 
                                     | TNum z => if Z.even z then false
                                                else (term_le_0 pg t1)
                                     | _ => false
                                     end
                    | TERM.RSqrt => term_le_0 pg t1
                    | TERM.RMax => (term_le_0 pg t1) && (term_le_0 pg t2)
                    | TERM.RMin => (term_le_0 pg t1) || (term_le_0 pg t2)
                    | TERM.RLim =>  term_le_0 pg t2
             
                    (* to be fixed *)
                    end
  |_ => term_le_0_hint pg t
  end.

(*对角相乘比大小需要的一定前提*)
Definition eval_is_positive (t1 :term)(t2 :term) (pg :proof_goal) :bool :=
  match t1 with 
  |TBinOp TERM.RDiv t11 t12 =>if term_ge_0 pg t12 then 
                             match t2 with 
                            |TBinOp TERM.RDiv t21 t22 => term_ge_0 pg t22
                            | _ =>true
                             end
                             else if term_le_0 pg t12 then 
                             match t2 with 
                            |TBinOp TERM.RDiv t21 t22 => term_le_0 pg t22
                            | _ =>false
                             end
                             else false
  |_ => match t2 with 
       |TBinOp TERM.RDiv t21 t22 => term_ge_0 pg t22
       | _ =>true
        end
  end.

Definition eval_is_negative (t1 :term)(t2 :term) (pg :proof_goal) :bool :=
  match t1 with 
  |TBinOp TERM.RDiv t11 t12 =>if term_ge_0 pg t12 then 
                             match t2 with 
                            |TBinOp TERM.RDiv t21 t22 => term_le_0 pg t22
                            | _ =>false
                             end
                             else if term_le_0 pg t12 then 
                             match t2 with 
                            |TBinOp TERM.RDiv t21 t22 => term_ge_0 pg t22
                            | _ =>true
                             end
                             else false
  |_ => match t2 with 
       |TBinOp TERM.RDiv t21 t22 => term_le_0 pg t22
       | _ =>false
        end
  end.

Definition remove_abs (pg : proof_goal) (t : term) : term :=
  match t with
  | TUnOp u t1 => match u with 
                  | TERM.RAbs => if (term_ge_0 pg t1)
                                 then t1 
                                 else if rational_ge_0 (Rational.eval t1)
                                 then t1
                                 else if (term_le_0 pg t1)
                                 then (TUnOp TERM.RNeg t1)
                                 else if rational_le_0 (Rational.eval t1)
                                 then (TUnOp TERM.RNeg t1)
                                 else t
                  | _ => t
                  end
  | _ => t
  end.

(*为了方便比较判断，对两边的term做一些简单的预处理*)
Fixpoint term_simpl (t1: term) (t2: term) : term*term :=
  match t1 with 
  |TBinOp b1 t11 t12 => if (TERM.BinOp_eqb b1 TERM.RPlus)
                    then  match t2 with
                       |TBinOp b2 t21 t22 =>if (TERM.BinOp_eqb b1 b2) 
                              then if (Rational.Rational_eqn (Rational.eval t12) (Rational.eval t22))
                                 then term_simpl t11 t21 
                                 else if (Rational.Rational_eqn (Rational.eval t11) (Rational.eval t21))
                                 then term_simpl t12 t22   
                                 else (t1,t2)
                              else (t1,t2)
                       |_ => (t1,t2)
                        end
                    else if (TERM.BinOp_eqb b1 TERM.RMinus)
                    then  match t2 with
                       |TBinOp b2 t21 t22 =>if (TERM.BinOp_eqb b1 b2) 
                              then if (Rational.Rational_eqn (Rational.eval t12) (Rational.eval t22))
                                 then term_simpl t11 t21
                                 else (t1,t2)
                              else (t1,t2)
                       |_ => (t1,t2)
                        end
                    else if (TERM.BinOp_eqb b1 TERM.RMult)
                     then match t11 with
                     | TNum z => match t2 with 
                             |TBinOp b2 t21 t22 => if (TERM.BinOp_eqb b1 b2)
                                  then if (Rational.Rational_eqn (Rational.eval t11) (Rational.eval t21))
                                  then match (Z.geb z 0) with
                                  |true => term_simpl t12 t22
                                  |false => (t1,t2)
                                  end
                                  else (t1,t2) 
                                  else (t1,t2) 
                            |_ =>(t1,t2)
                            end
                     |_ => (t1,t2)
                     end
                     else (t1,t2)
  | _ => (t1,t2)
  end.

(*
Fixpoint term_simpl_context (t1 : term) (t2 : term)  :term*term :=
  match t1 with 
  |TBinOp b1 t11 t12 => if (TERM.BinOp_eqb b1 TERM.RPlus)
                    then (t1,t2)
                    else if (TERM.BinOp_eqb b1 TERM.RMinus)
                    then  (t1,t2)
                    else if (TERM.BinOp_eqb b1 TERM.RMult)
                     then match t2 with
                     |TBinOp b2 t21 t22 => if (TERM.BinOp_eqb b1 b2)
                                           then if (term_eqb t11 t21) 
                                                then term_simpl_context t12 t22
                                                else if (term_eqb t12 t22) 
                                                then term_simpl_context t11 t21
                                                else (t1,t2)
                                            else (t1,t2)
                     |_ => (t1,t2)
                     end
                    else if (TERM.BinOp_eqb b1 TERM.RDiv)
                    then match t2 with
                     |TBinOp b2 t21 t22 => if (TERM.BinOp_eqb b1 b2)
                                          then if (term_eqb t11 t21) 
                                               then term_simpl_context t12 t22
                                               else if (term_eqb t12 t22) 
                                               then term_simpl_context t11 t21
                                               else (t1,t2)
                                           else (t1,t2)
                     |_ => (t1,t2)
                    end
                  else if (TERM.BinOp_eqb b1 TERM.RLim)
                    then match t2 with
                       |TBinOp b2 t21 t22 => if (TERM.BinOp_eqb b1 b2)
                                       then term_simpl_context t12 t22
                                       else (t1,t2)
                       |_ => (t1,t2)
                      end
                  else if (TERM.BinOp_eqb b1 TERM.RSqrt)
                    then match t2 with
                    |TBinOp b2 t21 t22 => if (TERM.BinOp_eqb b1 b2)
                                    then if (term_eqb t11 t21) 
                                         then term_simpl_context t12 t22
                                          else (t1,t2)
                                    else (t1,t2)
                    |_ => (t1,t2)
                   end
                   else if (TERM.BinOp_eqb b1 TERM.RPower)
                    then match t2 with
                    |TBinOp b2 t21 t22 => if (TERM.BinOp_eqb b1 b2)
                                    then if (term_eqb t12 t22) 
                                         then term_simpl_context t11 t21
                                          else (t1,t2)
                                    else (t1,t2)
                    |_ => (t1,t2)
                   end
                  else (t1,t2)
  |TUnOp u1 t1' =>match u1 with
                |TERM.RAbs
                |TERM.RNeg
                |TERM.ZCeil
                |TERM.ZFloor
                |TERM.RSin 
                |TERM.RCos =>match t2 with
                            |TUnOp u2 t2'=>if (TERM.UnOp_eqb u1 u2)
                                         then term_simpl_context t1' t2'  
                                         else (t1,t2)  
                            |_ =>(t1,t2)
                           end
                |_ => (t1,t2)
                end  
  |TBinder b1 x1 t1'=>match t2 with
                     |TBinder b2 x2 t2'=>if (TERM.Binder_eqb b1 b2)
                                         then if (VarName.eqb x1 x2)
                                              then term_simpl_context t1' t2' 
                                              else (t1,t2)
                                         else (t1,t2)
                     |_ =>(t1,t2)
                    end
                     
  | _ => (t1,t2)
  end.

Compute term_simpl_context
(TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "x"
	(TBinOp TERM.RSqrt ((TNum 3)) ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 2)))))	))
(TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "x"
	(TBinOp TERM.RSqrt ((TNum 3)) ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 2)))))	)).
*)

(*Compute term_simpl 
(TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 2 ))	((TVar "y" ))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "z" ))))	((TBinOp TERM.RMult
	((TVar "z" ))	((TVar "x" )))))))
  (TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 2 ))	((TVar "y" ))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "z" ))))	((TBinOp TERM.RMult
	((TVar "z" ))	((TVar "x" ))))))).*)
	



Definition check_concl_auto_with_hint_R (P Q: prop) :bool :=
  match P,Q with
  | PBinPred PROP.REq t1 t2, PBinPred PROP.REq t1' t2' =>
      test_eqn_pair_R t1 t2 t1' t2' ||
      test_eqn_pair_R t1 t2 t2' t1'
  | PBinPred PROP.RLe t1 t2, PBinPred PROP.RLe t1' t2'
  | PBinPred PROP.RLt t1 t2, PBinPred PROP.RLt t1' t2'
  | PBinPred PROP.RGe t1 t2, PBinPred PROP.RGe t1' t2'
  | PBinPred PROP.RGt t1 t2, PBinPred PROP.RGt t1' t2' =>
      test_eqn_pair_R t1 t2 t1' t2' ||
      Rational.Rational_inverse_true (Rational.eval t1) (Rational.eval t2)  (Rational.eval t2')  (Rational.eval t1') 
  | PBinPred PROP.RLe t1 t2, PBinPred PROP.RGe t1' t2'
  | PBinPred PROP.RLt t1 t2, PBinPred PROP.RGt t1' t2'
  | PBinPred PROP.RGe t1 t2, PBinPred PROP.RLe t1' t2'
  | PBinPred PROP.RGt t1 t2, PBinPred PROP.RLt t1' t2' =>
      test_eqn_pair_R t1 t2 t2' t1' ||
      Rational.Rational_inverse_true (Rational.eval t1) (Rational.eval t2)  (Rational.eval t1')  (Rational.eval t2')
  | _, _ => false
  end.

(* to test whether check_concl_auto_with_hint_R is right
Compute check_concl_auto_with_hint_R
(PBinPred PROP.RLe (TBinOp TERM.RMult
	((TVar "x" ))	((TVar "y" )))(TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))))	((TNum 2))))
(PBinPred PROP.RGe (TBinOp TERM.RDiv
	((TNum 1))	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "y" )))))(TBinOp TERM.RDiv
	((TNum 1))	((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))))	((TNum 2)))))). *)

Definition fwd_result (b: bool): option (list prop) :=
  if b then Some nil else None.

Definition check_concl_auto_with_assumption (pg: proof_goal) (P: prop): bool :=
  orb (existsb (check_concl_auto_with_hint_R P) (map snd pg.(assu))) (existsb (check_concl_auto_with_hint_R (prop_opposite P)) (map snd pg.(assu))).

(* list prop 为该命题化简出的若干小命题，两个 term 分别为最左端和最右端的表达式，ROrder 为两端表达式的关系 *)
Fixpoint LongOrder_deduction (P: prop): option (PROP.ROrder * list prop * term * term) :=
  match P with
  | PBinPred (PROP.HasOrder o) t1 t2 =>
      Some (o, (P :: nil), t1, t2)
  | PLongOrder o1 t1 Q => 
      match LongOrder_deduction Q with
      | Some (o2, l, t2, t3) =>
          match ROrder_sum o1 o2 with
          | Some o => Some (o, (PBinPred o1 t1 t2) :: l, t1, t3)
          | _ => None
          end
      | _ => None
      end
  | _ => None
  end.

  (* 简单地将 LongOrder 分解成若干命题 *)
Definition LongOrderBreak (P: prop): option (list prop) :=
  match P with
  | PLongOrder o1 t1 Q => 
      match LongOrder_deduction P with
      | Some (_, l, _, _) => Some l
      | None => None
      end
  | _ => Some (P :: nil)
  end.

(* 利用前提将 term 往各个方向放缩 *)
Definition replace_term_le (t :term) (P: prop) : term :=
  match t with 
  | TVar x => match P with 
            | PBinPred PROP.REq t1 t2 => if term_eqb t t1 then t2
                                  else if term_eqb t t2 then t1
                                  else t
            | PBinPred PROP.RLe t1 t2 => if term_eqb t t1 then t2
                                  else t
            | PBinPred PROP.RLt t1 t2 => if term_eqb t t1 then t2 
                                  else t
            | PBinPred PROP.RGe t1 t2 => if term_eqb t t2 then t1
                                  else t
            | PBinPred PROP.RGt t1 t2 => if term_eqb t t2 then t1
                                  else t
            | _ => t
            end
  | _ => t
  end.

Definition replace_term_ge (t :term) (P: prop) : term :=
  match t with 
  | TVar x => match P with 
            | PBinPred PROP.REq t1 t2 => if term_eqb t t1 then t2
                                  else if term_eqb t t2 then t1
                                  else t
            | PBinPred PROP.RLe t1 t2 => if term_eqb t t2 then t1
                                  else t
            | PBinPred PROP.RLt t1 t2 => if term_eqb t t2 then t1 
                                  else t
            | PBinPred PROP.RGe t1 t2 => if term_eqb t t1 then t2
                                  else t
            | PBinPred PROP.RGt t1 t2 => if term_eqb t t1 then t2 
                                  else t
            | _ => t
            end
  | _ => t
  end.

Definition replace_term_lt (t :term ) (P: prop) : term :=
  match t with 
  | TVar x => match P with 
            | PBinPred PROP.RLt t1 t2 => if term_eqb t t1 then t2 
                                  else t
            | PBinPred PROP.RGt t1 t2 => if term_eqb t t2 then t1
                                  else t
            | _ => t
            end
  | _ => t
  end.

Definition replace_term_gt (t :term ) (P: prop) : term :=
  match t with 
  | TVar x => match P with 
            | PBinPred PROP.RLt t1 t2 => if term_eqb t t2 then t1
                                  else t
            | PBinPred PROP.RGt t1 t2 => if term_eqb t t1 then t2
                                  else t
            | _ => t
            end
  | _ => t
  end.

Definition replace_term_eq (t :term ) (P: prop) : term :=
  match t with 
  | TVar x => match P with 
            | PBinPred PROP.REq t1 t2 => if term_eqb t t1 then t2
                                  else if term_eqb t t2 then t1
                                  else t
            | _ => t
            end
  | _ => t
  end.

Fixpoint replace_Eq (t :term) (P:prop) (pg: proof_goal) :term :=
  match t with
  |TBinOp u t1 t2 => TBinOp u (replace_Eq t1 P pg) (replace_Eq t2 P pg)
  |TUnOp u t1 => TUnOp u (replace_Eq t1 P pg)
  |TVar x=> replace_term_eq t P
  |TBinder b x t1 => TBinder b x (replace_Eq t1 P pg) 
  |_ => t 
  end.

Fixpoint replace_Le (t :term) (P:prop) (pg : proof_goal):term :=
  match t with 
  |TBinOp u t1 t2 =>match u with
                   |TERM.RPlus =>
                          match t1,t2 with 
                               | TVar x,TVar y =>TBinOp u (replace_term_le t1 P) (replace_term_le t2 P)
                               | TVar x, _ 
                                 => TBinOp u (replace_term_le t1 P) (replace_Le t2 P pg)
                               | _ , TVar x
                                 => TBinOp u (replace_Le t1 P pg) (replace_term_le t2 P)
                               | _ ,_ => TBinOp u (replace_Le t1 P pg) (replace_Le t2 P pg)
                              end
                   |TERM.RMinus =>
                          match t1,t2 with
                               | TVar x,TVar y =>TBinOp u (replace_term_le t1 P) (replace_term_ge t2 P) 
                               | TVar x, _ 
                                 => TBinOp u (replace_term_le t1 P) (replace_Ge t2 P pg)
                               | _ , TVar x
                                 => TBinOp u (replace_Le t1 P pg) (replace_term_ge t2 P)
                               | _ ,_ => TBinOp u (replace_Le t1 P pg) (replace_Ge t2 P pg)
                              end
                   |TERM.RMult =>
                           match t1,t2 with 
                               | TVar x, _ 
                                =>if term_ge_0 pg t2 then
                                       if term_ge_0 pg t1 then
                                       TBinOp u (replace_term_le t1 P) (replace_Le t2 P pg)
                                       else if term_le_0 pg t1 then
                                       TBinOp u (replace_term_le t1 P) (replace_Ge t2 P pg)
                                       else TBinOp u (replace_term_le t1 P) t2
                                 else if term_le_0 pg t2 then
                                       if term_ge_0 pg t1 then
                                       TBinOp u (replace_term_ge t1 P) (replace_Le t2 P pg)
                                       else if term_le_0 pg t1 then
                                       TBinOp u (replace_term_ge t1 P) (replace_Ge t2 P pg)
                                       else TBinOp u (replace_term_ge t1 P) t2
                                 else  if term_ge_0 pg t1 then
                                       TBinOp u t1 (replace_Le t2 P pg)
                                       else if term_le_0 pg t1 then
                                       TBinOp u (replace_term_ge t1 P) (replace_Ge t2 P pg)
                                       else t
                               | _ , TVar x
                                 => TBinOp u (replace_Le t1 P pg) (replace_term_le t2 P)
                               | _ ,_ => TBinOp u (replace_Le t1 P pg) (replace_Le t2 P pg)
                              end
                   |TERM.RDiv =>
                          match t1,t2 with 
                               | TVar x, _ 
                                 => TBinOp u (replace_term_le t1 P ) (replace_Ge t2 P pg)
                               | _ , TVar x
                                 => TBinOp u (replace_Le t1 P pg) (replace_term_ge t2 P)
                               | _ ,_ => TBinOp u (replace_Le t1 P pg) (replace_Ge t2 P pg)
                              end
                   |TERM.RPower =>
                          if rational_ge_0 (Rational.eval t1)
                          then TBinOp u (replace_Le t1 P pg) t2 
                          else t
                    | TERM.RSqrt => TBinOp u t1 (replace_Le t2 P pg)
                    | TERM.RMax => TBinOp u (replace_Le t1 P pg) (replace_Le t2 P pg)
                    | TERM.RMin => TBinOp u (replace_Le t1 P pg) (replace_Le t2 P pg)
                    | TERM.RLim => TBinOp u t1 (replace_Le t2 P pg)
                   end
  | _ => t
  end

with replace_Ge (t :term) (P:prop) (pg : proof_goal) :term :=
  match t with 
  |TBinOp u t1 t2 =>match u with
                   |TERM.RPlus =>
                          match t1,t2 with
                               | TVar x, TVar y 
                                 => TBinOp u (replace_term_ge t1 P) (replace_term_ge t2 P)
                               | TVar x, _ 
                                 => TBinOp u (replace_term_ge t1 P) (replace_Ge t2 P pg)
                               | _ , TVar x
                                 => TBinOp u (replace_Ge t1 P pg) (replace_term_ge t2 P)
                               | _ ,_ => TBinOp u (replace_Ge t1 P pg) (replace_Ge t2 P pg)
                              end
                   |TERM.RMinus =>
                          match t1,t2 with 
                               | TVar x, TVar y 
                                 => TBinOp u (replace_term_ge t1 P) (replace_term_le t2 P)
                               | TVar x, _ 
                                 => TBinOp u (replace_term_ge t1 P) (replace_Le t2 P pg)
                               | _ , TVar x
                                 => TBinOp u (replace_Ge t1 P pg) (replace_term_le t2 P)
                               | _ ,_ => TBinOp u (replace_Ge t1 P pg) (replace_Le t2 P pg)
                              end
                   |TERM.RMult =>
                           match t1,t2 with 
                               | TVar x, _ 
                                 => TBinOp u (replace_term_ge t1 P) (replace_Ge t2 P pg)
                               | _ , TVar x
                                 => TBinOp u (replace_Ge t1 P pg) (replace_term_ge t2 P)
                               | _ ,_ => TBinOp u (replace_Ge t1 P pg) (replace_Ge t2 P pg)
                              end
                   |TERM.RDiv =>
                          match t1,t2 with 
                               | TVar x, _ 
                                 => TBinOp u (replace_term_ge t1 P) (replace_Le t2 P pg)
                               | _ , TVar x
                                 => TBinOp u (replace_Ge t1 P pg) (replace_term_le t2 P)
                               | _ ,_ => TBinOp u (replace_Ge t1 P pg) (replace_Le t2 P pg)
                              end
                   |TERM.RPower =>
                          if rational_ge_0 (Rational.eval t1)
                          then TBinOp u (replace_Ge t1 P pg) t2 
                          else t
                    | TERM.RSqrt => TBinOp u (replace_Ge t1 P pg) t2
                    | TERM.RMax => TBinOp u (replace_Ge t1 P pg) (replace_Ge t2 P pg)
                    | TERM.RMin => TBinOp u (replace_Ge t1 P pg) (replace_Ge t2 P pg)
                    | TERM.RLim => TBinOp u t1 (replace_Ge t2 P pg)
                    
                   end
  | _ => t
  end.

Definition replace_term (pg : proof_goal) (P1:prop) (P2:prop)  : bool := 
  match P1 with 
  |PBinPred PROP.RLe t1 t2 => test_eqn_R (replace_Le t1 P2 pg) t2 ||compare_r_le (Rational.eval (replace_Le t1 P2 pg)) (Rational.eval t2)
  |PBinPred PROP.RGe t1 t2 => test_eqn_R (replace_Ge t1 P2 pg) t2 || compare_r_ge (Rational.eval (replace_Le t1 P2 pg)) (Rational.eval t2)
  | _ => false
  end.


Definition compare_prop (P :prop) (pg : proof_goal) : bool :=
  let pg':= (assum_auto_inference pg) in
  existsb  (replace_term pg' P) (map  snd pg'.(assu)) .

End SYMBOLIC_CHECKER.
