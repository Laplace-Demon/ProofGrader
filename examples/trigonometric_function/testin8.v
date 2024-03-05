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
(PBinPred PROP.REq (TUnOp TERM.RCos ((TVar "x")))(TBinOp TERM.RDiv ((TNum 4)) ((TNum 5))))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.REq (TUnOp TERM.RCos (((TBinOp TERM.RMinus ((TConst TERM.RPi)) ((TVar "x"))))))(TBinOp TERM.RDiv ((TNum 4)) ((TNum 5)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 6 6 PROOF.FNoHint)(PLongOrder PROP.REq ((TUnOp TERM.RCos (((TBinOp TERM.RMinus ((TConst TERM.RPi)) ((TVar "x"))))))) (PBinPred PROP.REq (TUnOp TERM.RCos ((TVar "x")))(TBinOp TERM.RDiv ((TNum 4)) ((TNum 5))))))
((PrConclWithoutProof 7 7 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
