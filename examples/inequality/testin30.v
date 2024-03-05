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
(PBinPred PROP.REq (TBinOp TERM.RMult ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))) ((TVar "c")))(TNum 1))::(PBinPred PROP.RGe (TVar "a")(TNum 0))::(PBinPred PROP.RGe (TVar "b")(TNum 0))::(PBinPred PROP.RGe (TVar "c")(TNum 0))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.RGe (TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))(TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "a")))) ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "b")))))) ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "c")))))).
(*Proof starts here*)
Definition pr: proof :=
((PrPoseWithoutProof 9 9 PROOF.FSGAverage 
(PBinPred PROP.RGe (TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))))) ((TNum 2)))(TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))))
(((PrPoseWithoutProof 10 10 PROOF.FSGAverage 
(PBinPred PROP.RGe (TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))) ((TNum 2)))(TBinOp TERM.RMult ((TVar "b")) ((TVar "c")))))
(((PrPoseWithoutProof 11 11 PROOF.FSGAverage 
(PBinPred PROP.RGe (TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))) ((TNum 2)))(TBinOp TERM.RMult ((TVar "a")) ((TVar "c")))))
((((PrPoseWithoutProof 12 12 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))) ((PLongOrder PROP.RGe ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))))) ((TNum 2)))) ((TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))) ((TNum 2)))))) ((TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))) ((TNum 2)))))) ((PLongOrder PROP.REq ((TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "c")))))) ((TBinOp TERM.RMult ((TVar "a")) ((TVar "c")))))) ((TNum 1)))) (PBinPred PROP.REq (TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "c")))))) ((TBinOp TERM.RMult ((TVar "a")) ((TVar "c")))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))) ((TVar "c")))))(TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "a")))) ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "b")))))) ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "c"))))))))))))
((PrConclWithoutProof 13 13 PROOF.FNoHint))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
