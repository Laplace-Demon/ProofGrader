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
(PBinPred PROP.REq (TVar "x")(TBinOp TERM.RPlus ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2))))))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TBinOp TERM.RMult ((TNum 4)) ((TVar "x")))))) ((TNum 2)))(TNum 0)).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 6 6 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TBinOp TERM.RMult ((TNum 4)) ((TVar "x")))))) ((TNum 2)))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2))))))) ((TNum 2)))) ((TBinOp TERM.RMult ((TNum 4)) (((TBinOp TERM.RPlus ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2))))))))))) ((TNum 2)))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TBinOp TERM.RMinus ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TNum 4)) ((TBinOp TERM.RMult ((TNum 4)) ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2)))))))) ((TNum 2)))) ((TNum 8)))) ((TBinOp TERM.RMult ((TNum 4)) ((TBinOp TERM.RSqrt (TNum 2) ((TNum 2)))))))) ((TNum 2)))(TNum 0))))))
((PrConclWithoutProof 7 7 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
