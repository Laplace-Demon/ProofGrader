From lib Require Import ExplicitName.
From lib Require Import Lang.
From lib Require Import Solver.
From lib Require Import Poly.
From lib Require Import Elaborator.
From lib Require Import Checker.
Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.

(*
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
| TSet (l: list VarName.t) (t:term) (P: prop)

with prop :=
| PLongOrder (o: PROP.ROrder) (t: term) (P: prop)
| PUnPred (p: PROP.UnOp) (t1: term)
| PBinPred (p: PROP.BinOp) (t1 t2: term)
| PCBinPred (p: PROP.BinOp) (t1 t2: term) (cont: context)
| PUnOp (u: PROP.UniConnect) (P: prop)
| PBinOp (b: PROP.BinConnect) (P Q: prop)
| PQuant (q: PROP.Quant) (x: VarName.t) (P: prop)

with context :=
| CEvenFun
| CLimPlus (t1 t2 : term)
| CLimMult (t1 t2 : term)
.

Inductive proof :=
| PrAssum (z1 z2: Z) (H: HypName.t)
| PrPoseWithoutProof (z1 z2: Z) (PrF: PROOF.Fwd) (P: prop) (pr: proof)
| PrPoseAndProve (z1 z2: Z) (PrF: PROOF.Fwd) (P: prop) (pr1 pr2: proof)
| PrConclWithoutProof (z1 z2: Z) (PrF: PROOF.Fwd)
| PrConclAndProof (z1 z2: Z) (PrF: PROOF.Fwd) (pr: proof)
| PrClaimSuffice (z1 z2: Z) (PrB: PROOF.Bwd) (P: prop) (pr: proof)
| PrProveSuffice (z1 z2: Z) (PrB: PROOF.Bwd) (P: prop) (pr1 pr2: proof)
| PrAction (z1 z2: Z) (PrA: PROOF.Act) (pr: proof)
.

Record proof_goal: Type := {
  assu: list (HypName.t * prop);
  concl: prop;
}.
*)

Definition premise: list prop := nil.
Module Goal001.

Definition stmt: prop :=
  PQuant PROP.QForall "a"
  (PBinOp PROP.CImpl
  (PUnPred PROP.BoundedAbove (TVar "a"))
  (PBinOp PROP.CImpl
  (PUnPred PROP.MonoInc (TVar "a"))
  (PQuant PROP.QExists "A"
  (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A"))))).
  
(*
an: (TApply (TVar "a") (TVar "n"))
an 有上界：PUnPred PROP.BoundedAbove (TApply (TVar "a") (TVar "n"))
an 有上确界：PQuant PROP.QExists "A" (PBinPred PROP.REq (TVar "A") (TUnOp TERM.RSup (TApply (TVar "a") (TVar "n"))))
下面证明...：PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A")
an 中存在...：PQuant PROP.QExists "N" (PBinPred PROP.RGt (TApply (TVar "a") (TVar "N")) (TBinOp TERM.RMinus (TVar "A") (TVar "epsilon")))
所以对于...： PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n") (TVar "N")) (PBinPred PROP.RGt (TApply (TVar "a") (TVar "n")) (TApply (TVar "a") (TVar "N"))))
因此，对于...： PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n") (TVar "N")) (PLongOrder PROP.RGt (TApply (TVar "a") (TVar "n")) (PBinPred PROP.RGt (TApply (TVar "a") (TVar "N")) (TBinOp TERM.RMinus (TVar "A") (TVar "epsilon")))))
所以对于任意...： PQuant PROP.QForall "n" (PBinPred PROP.RLt (TApply (TVar "a") (TVar "n")) (TVar "A"))
因此，对于...： PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n") (TVar "N")) (PLongOrder PROP.RLt (TBinOp TERM.RMinus (TVar "A") (TVar "epsilon")) (PBinPred PROP.RLt (TApply (TVar "a") (TVar "n")) (TBinOp TERM.RPlus (TVar "A") (TVar "epsilon")))))
我们有： PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A")
*)

(*Proof starts here*)
Definition pr: proof :=
(PrAction 1 1 (PROOF.ASuppose (PUnPred PROP.BoundedAbove (TVar "a")))
(PrAction 2 2 (PROOF.ASuppose (PUnPred PROP.MonoInc (TVar "a")))
(PrPoseWithoutProof 3 3 (PROOF.FTheorem PROOF.SupremumAndInfimum nil) (PQuant PROP.QExists "A" (PBinPred
  PROP.REq (TVar "A") (TUnOp TERM.RSup (TVar "a"))))
(PrAction 4 4 (PROOF.ASet "A" (TUnOp TERM.RSup (TVar "a")))
(PrPoseAndProve 5 5 PROOF.FNoHint (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder
  TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A"))
(PrPosePartialProof 6 6 (PROOF.APoseVar "epsilon" ((PBinPred PROP.RGt (TVar "epsilon") (TNum 0)) :: nil))
(PrPoseWithoutProof 7 7 (PROOF.FDefinition PROOF.Supremum) (PQuant PROP.QExists "N" (PBinPred PROP.RGt
  (TApply (TVar "a") (TVar "N")) (TBinOp TERM.RMinus (TVar "A") (TVar "epsilon"))))
(PrPoseWithoutProof 8 8 (PROOF.FCausalInfer (PUnPred PROP.MonoInc (TVar "a"))) (PQuant PROP.QForall "n"
  (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n") (TVar "N")) (PBinPred PROP.RGt (TApply (TVar "a")
  (TVar "n")) (TApply (TVar "a") (TVar "N")))))
(PrPoseWithoutProof 9 9 PROOF.FNoHint (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGt
  (TVar "n") (TVar "N")) (PLongOrder PROP.RGt (TApply (TVar "a") (TVar "n")) (PBinPred PROP.RGt (TApply
  (TVar "a") (TVar "N")) (TBinOp TERM.RMinus (TVar "A") (TVar "epsilon"))))))
(PrPoseWithoutProof 10 10 (PROOF.FCausalInfer (PBinPred PROP.BoundedAboveBy (TVar "a") (TVar "A")))
  (PQuant PROP.QForall "n" (PBinPred PROP.RLt (TApply (TVar "a") (TVar "n")) (TVar "A")))
(PrPoseWithoutProof 11 11 PROOF.FNoHint (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGt
  (TVar "n") (TVar "N")) (PLongOrder PROP.RLt (TBinOp TERM.RMinus (TVar "A") (TVar "epsilon")) (PBinPred
  PROP.RLt (TApply (TVar "a") (TVar "n")) (TBinOp TERM.RPlus (TVar "A") (TVar "epsilon"))))))
(PrEndPartialProof))))))
(PrPoseWithoutProof 12 12 (PROOF.FDefinition PROOF.SeqLimit) (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty
  TERM.Positive_Infty) (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A"))
(PrConclWithoutProof 13 13 PROOF.FNoHint)))
(PrConclWithoutProof 14 14 PROOF.FNoHint)))))).



Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil |}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr':= snd temp.

Compute pg'.
Compute pr'.

Definition check_result := check_rec' pg' pr'.

Definition goal := check_rec'_show_pg pg' pr' 100.

Compute goal.

Compute check_result.

End Goal001.
