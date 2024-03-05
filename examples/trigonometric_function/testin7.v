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
(PBinPred PROP.REq (TUnOp TERM.RCos (((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 535)) ((TConst TERM.RPi)))) ((TNum 3))))))(TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PBinPred PROP.REq (TNum 535) (TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TNum 178)) ((TNum 3)))) ((TNum 1)))))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PLongOrder PROP.REq ((TUnOp TERM.RCos (((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 535)) ((TConst TERM.RPi)))) ((TNum 3))))))) ((PLongOrder PROP.REq ((TUnOp TERM.RCos (((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TNum 178)) ((TConst TERM.RPi)))) ((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 3))))))))) (PBinPred PROP.REq (TUnOp TERM.RCos (((TBinOp TERM.RDiv ((TConst TERM.RPi)) ((TNum 3))))))(TBinOp TERM.RDiv ((TNum 1)) ((TNum 2))))))))
((PrConclWithoutProof 6 6 PROOF.FNoHint))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
