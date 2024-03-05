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
(PQuant PROP.QForall "a"(PQuant PROP.QForall "b"(PBinPred PROP.RGe (TBinOp TERM.RPlus ((TVar "a")) ((TVar "b")))(TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))))))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PBinPred PROP.RGe (TBinOp TERM.RPower (((TBinOp TERM.RMinus ((TBinOp TERM.RSqrt (TNum 2) ((TVar "a")))) ((TBinOp TERM.RSqrt (TNum 2) ((TVar "b"))))))) ((TNum 2)))(TNum 0)))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PBinPred PROP.RGe (TBinOp TERM.RMinus ((TBinOp TERM.RPlus ((TVar "a")) ((TVar "b")))) ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))))))))(TNum 0)))
((((PrPoseWithoutProof 6 6 PROOF.FNoHint)(PBinPred PROP.RGe (TBinOp TERM.RPlus ((TVar "a")) ((TVar "b")))(TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))))))))
((PrConclWithoutProof 7 7 PROOF.FNoHint))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
