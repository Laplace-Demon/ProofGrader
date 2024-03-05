Require Import ExplicitName.
Require Import Lang.
Require Import Poly.
Require Import Solver.
Require Import Elaborator.
Require Import Checker.
Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.
Definition premise: list prop :=
(PBinPred PROP.RGt (TVar "a")(TNum 0))::(PBinPred PROP.RGt (TVar "b")(TNum 0))::(PBinPred PROP.RGt (TVar "x")(TNum 0))::(PBinPred PROP.RGt (TVar "y")(TNum 0))::(PBinPred PROP.RGe (TVar "b")(TVar "a"))::(PBinPred PROP.RGe (TVar "x")(TVar "y"))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.RGe (TBinOp TERM.RDiv ((TVar "x")) ((TBinOp TERM.RPlus ((TVar "a")) ((TVar "x")))))(TBinOp TERM.RDiv ((TVar "y")) ((TBinOp TERM.RPlus ((TVar "b")) ((TVar "y")))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 11 13 PROOF.FNoHint)(PBinPred PROP.RGe (TBinOp TERM.RMult ((TVar "b")) ((TVar "x")))(TBinOp TERM.RMult ((TVar "a")) ((TVar "y")))))
((((PrPoseWithoutProof 14 16 PROOF.FNoHint)(PBinPred PROP.RGe (TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "b")) ((TVar "x")))) ((TBinOp TERM.RMult ((TVar "x")) ((TVar "y")))))(TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "y")))) ((TBinOp TERM.RMult ((TVar "x")) ((TVar "y")))))))
((((PrPoseWithoutProof 17 19 PROOF.FNoHint)(PBinPred PROP.RGe (TBinOp TERM.RMult ((TVar "x")) (((TBinOp TERM.RPlus ((TVar "b")) ((TVar "y"))))))(TBinOp TERM.RMult ((TVar "y")) (((TBinOp TERM.RPlus ((TVar "a")) ((TVar "x"))))))))
((((PrPoseWithoutProof 20 22 PROOF.FNoHint)(PBinPred PROP.RGt (TBinOp TERM.RPlus ((TVar "a")) ((TVar "x")))(TNum 0)))
((((PrPoseWithoutProof 23 25 PROOF.FNoHint)(PBinPred PROP.RGt (TBinOp TERM.RPlus ((TVar "b")) ((TVar "y")))(TNum 0)))
(((PrPoseWithoutProof 26 28 (PROOF.FEquTrans "___hyp8")
(PBinPred PROP.RGe (TBinOp TERM.RDiv ((TVar "x")) ((TBinOp TERM.RPlus ((TVar "a")) ((TVar "x")))))(TBinOp TERM.RDiv ((TVar "y")) ((TBinOp TERM.RPlus ((TVar "b")) ((TVar "y")))))))
((PrConclWithoutProof 29 29 PROOF.FNoHint))))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
