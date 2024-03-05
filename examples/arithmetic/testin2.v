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
(PBinPred PROP.RGt (TBinOp TERM.RDiv ((TNum 5702)) ((TNum 4938)))(TBinOp TERM.RDiv ((TNum 2850)) ((TNum 2469)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 6 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RDiv ((TNum 5702)) ((TNum 4938)))) (PBinPred PROP.RGt (TBinOp TERM.RDiv ((TNum 2851)) ((TNum 2469)))(TBinOp TERM.RDiv ((TNum 2850)) ((TNum 2469))))))
((PrConclWithoutProof 7 7 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
