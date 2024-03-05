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
(PQuant PROP.QForall "a" (PQuant PROP.QForall "b" (PBinOp PROP.CImpl (PQuant PROP.QForall "n" (PBinPred PROP.RLe (TApply (TVar "a" ) (TVar "n" ))(TApply (TVar "b" ) (TVar "n" ))))(PBinOp PROP.CImpl (PUnPred PROP.MonoInc (TVar "a"))(PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "b"))(PUnPred PROP.Convergent (TVar "a"))))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PQuant PROP.QForall "n" (PBinPred PROP.RLe (TApply (TVar "a" ) (TVar "n" ))(TApply (TVar "b" ) (TVar "n" ))))))
)
(((PrAction 5 5(PROOF.ASuppose ((PUnPred PROP.MonoInc (TVar "a"))))
)
(((PrAction 6 6(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "b"))))
)
(((PrPoseWithoutProof 7 7 (PROOF.FCausalInfer ((PUnPred PROP.Convergent (TVar "b"))))
(PUnPred PROP.Bounded (TVar "b")))
((((PrPoseWithoutProof 8 8 PROOF.FNoHint)(PUnPred PROP.BoundedAbove  (TVar "b")))
(((PrPoseWithoutProof 9 9 (PROOF.FCausalInfer ((PQuant PROP.QForall "n" (PBinPred PROP.RLe (TApply (TVar "a" ) (TVar "n" ))(TApply (TVar "b" ) (TVar "n" ))))))
(PUnPred PROP.BoundedAbove  (TVar "a")))
(((PrPoseWithoutProof 10 10 (PROOF.FTheorem PROOF.MonoConvergence nil) 
(PUnPred PROP.Convergent (TVar "a")))
((PrConclWithoutProof 11 11 PROOF.FNoHint))))))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
