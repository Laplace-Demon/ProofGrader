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
Definition premise: list prop := nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.REq (TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 12)))))(TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TBinOp TERM.RSqrt (TNum 2) ((TNum 6)))) ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2)))))) ((TNum 4)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PBinPred PROP.REq (TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 12)))(TBinOp TERM.RMinus ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 3)))) ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 4)))))))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PLongOrder PROP.REq ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 12)))))) ((PLongOrder PROP.REq ((TUnOp TERM.RSin (((TBinOp TERM.RMinus ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 3)))) ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 4))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 3)))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 4)))))))) ((TBinOp TERM.RMult ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 3)))))) ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 4)))))))))) (PBinPred PROP.REq (TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 3)))) ((TNum 2)))) ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2)))) ((TNum 2)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) ((TBinOp TERM.RDiv ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2)))) ((TNum 2)))))))(TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TBinOp TERM.RSqrt (TNum 2) ((TNum 6)))) ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2)))))) ((TNum 4))))))))))
((PrConclWithoutProof 6 6 PROOF.FNoHint))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
