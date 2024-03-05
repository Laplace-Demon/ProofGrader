From MParser Require Import ExplicitName.
From MParser Require Import Lang.
From MParser Require Import Poly.
From MParser Require Import Solver.
From MParser Require Import Elaborator.
From MParser Require Import Checker.
Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.
Definition premise: list prop := nil. 
Module Goal001.
Definition stmt: prop :=
(PQuant PROP.QForall "x" (PBinOp PROP.CImpl (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x")))) ((TNum 5)))(TNum 17))(PBinPred PROP.REq (TVar "x")(TNum 4)))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 6(PROOF.ASuppose ((PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x")))) ((TNum 5)))(TNum 17))))
)
(((PrPoseWithoutProof 7 9 (PROOF.FEquTrans "___hyp0")
(PBinPred PROP.REq (TBinOp TERM.RMult ((TNum 3)) ((TVar "x")))(TNum 12)))
(((PrPoseWithoutProof 10 12 (PROOF.FEquTrans "___hyp1")
(PBinPred PROP.REq (TVar "x")(TNum 4)))
((PrConclWithoutProof 13 13 PROOF.FNoHint))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
