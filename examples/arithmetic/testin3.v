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
Definition premise: list prop :=
(PBinPred PROP.REq (TVar "a")(TNum 1))::(PBinPred PROP.REq (TVar "b")(TNum 3))::(PBinPred PROP.REq (TVar "c")(TNum 5))::(PBinPred PROP.REq (TVar "d")(TNum 7))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.REq (TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2))))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "d")) ((TNum 4)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 3))))))))(TNum 15932)).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 9 9 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2))))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "d")) ((TNum 4)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 3))))))))) (PBinPred PROP.REq (TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TNum 1)) ((TNum 2)))) ((TBinOp TERM.RMult ((TNum 1)) ((TNum 3)))))) ((TBinOp TERM.RPower ((TNum 3)) ((TNum 2))))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TNum 7)) ((TNum 4)))) ((TBinOp TERM.RPower ((TNum 5)) ((TNum 3))))))))(TNum 15932))))
((PrConclWithoutProof 10 10 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
