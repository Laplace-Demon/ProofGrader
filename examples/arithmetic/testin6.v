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
(PQuant PROP.QForall "x" (PBinOp PROP.CImpl (PBinPred PROP.REq (TBinOp TERM.RMinus ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMinus ((TVar "x")) ((TNum 2)))))) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMinus ((TVar "x")) ((TNum 4)))))))(TNum 1))(PBinPred PROP.REq (TVar "x")(TBinOp TERM.RDiv ((TNum 17)) ((TNum 4)))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 6(PROOF.ASuppose ((PBinPred PROP.REq (TBinOp TERM.RMinus ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMinus ((TVar "x")) ((TNum 2)))))) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMinus ((TVar "x")) ((TNum 4)))))))(TNum 1))))
)
(((PrPoseWithoutProof 7 9 (PROOF.FEquTrans "___hyp0")
(PBinPred PROP.REq (TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMinus ((TVar "x")) ((TNum 2)))))(TBinOp TERM.RPlus ((TNum 1)) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMinus ((TVar "x")) ((TNum 4)))))))))
(((PrPoseWithoutProof 10 12 PROOF.FSquareBothTerms (PBinPred PROP.REq (TBinOp TERM.RMinus ((TVar "x")) ((TNum 2)))(TBinOp TERM.RMinus ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TNum 1)) ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMinus ((TVar "x")) ((TNum 4)))))))))) ((TVar "x")))) ((TNum 4)))))
(((PrPoseWithoutProof 13 15 (PROOF.FEquTrans "___hyp2")
(PBinPred PROP.REq (TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMinus ((TVar "x")) ((TNum 4)))))))(TNum 1)))
(((PrPoseWithoutProof 16 18 PROOF.FSquareBothTerms (PBinPred PROP.REq (TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 4)) ((TVar "x")))) ((TNum 16)))(TNum 1)))
(((PrPoseWithoutProof 19 21 (PROOF.FEquTrans "___hyp4")
(PBinPred PROP.REq (TBinOp TERM.RMult ((TNum 4)) ((TVar "x")))(TNum 17)))
(((PrPoseWithoutProof 22 24 (PROOF.FEquTrans "___hyp5")
(PBinPred PROP.REq (TVar "x")(TBinOp TERM.RDiv ((TNum 17)) ((TNum 4)))))
((PrConclWithoutProof 25 25 PROOF.FNoHint))))))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
