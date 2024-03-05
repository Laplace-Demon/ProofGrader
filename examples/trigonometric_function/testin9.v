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
(PQuant PROP.QForall "x" (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TUnOp TERM.RSin (((TBinOp TERM.RMinus ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3))))))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((TUnOp TERM.RSin (((TBinOp TERM.RPlus ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3))))))))))(TNum 0))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PLongOrder PROP.REq ((TUnOp TERM.RSin (((TBinOp TERM.RMinus ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3))))))))) (PBinPred PROP.REq (TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TVar "x")))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3)))))))) ((TBinOp TERM.RMult ((TUnOp TERM.RCos ((TVar "x")))) ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3)))))))))(TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TUnOp TERM.RNeg ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 3)))) ((TNum 2)))) ((TUnOp TERM.RCos ((TVar "x"))))))))))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PLongOrder PROP.REq ((TUnOp TERM.RSin (((TBinOp TERM.RPlus ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3))))))))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TVar "x")))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3)))))))) ((TBinOp TERM.RMult ((TUnOp TERM.RCos ((TVar "x")))) ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3)))))))))(TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TUnOp TERM.RNeg ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 3)))) ((TNum 2)))) ((TUnOp TERM.RCos ((TVar "x"))))))))))
((((PrPoseWithoutProof 6 6 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TUnOp TERM.RSin (((TBinOp TERM.RMinus ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3))))))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((TUnOp TERM.RSin (((TBinOp TERM.RPlus ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TConst TERM.RPi)))) ((TNum 3))))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus (((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TUnOp TERM.RNeg ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 3)))) ((TNum 2)))) ((TUnOp TERM.RCos ((TVar "x"))))))))) ((TUnOp TERM.RSin ((TVar "x")))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TUnOp TERM.RNeg ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 3)))) ((TNum 2)))) ((TUnOp TERM.RCos ((TVar "x"))))))))))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TBinOp TERM.RMinus ((TNum 1)) ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))))) ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2))))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 3)))) ((TNum 2)))) ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 3)))) ((TNum 2))))))) ((TUnOp TERM.RCos ((TVar "x")))))))(TNum 0))))))
((PrConclWithoutProof 7 7 PROOF.FNoHint))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
