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
(PBinPred PROP.RLe  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TNum 2)) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 3)) ((TNum 2)))) (((TBinOp TERM.RMinus ((TNum 4)) ((TBinOp TERM.RDiv ((TNum 5)) ((TNum 3))))))))))))(TBinOp TERM.RDiv ((TNum 7)) ((TNum 2)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TNum 2)) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 3)) ((TNum 2)))) (((TBinOp TERM.RMinus ((TNum 4)) ((TBinOp TERM.RDiv ((TNum 5)) ((TNum 3))))))))))))) (PBinPred PROP.RLe (TBinOp TERM.RDiv ((TNum 3)) ((TNum 2)))(TBinOp TERM.RDiv ((TNum 7)) ((TNum 2))))))
((PrConclWithoutProof 5 5 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
