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
(PQuant PROP.QForall "x"(PQuant PROP.QForall "y"(PBinPred PROP.RLe (TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TVar "x")) ((TVar "y"))))) (((TBinOp TERM.RPlus ((TVar "x")) ((TVar "y"))))))(TBinOp TERM.RMult ((TNum 2)) (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "y")) ((TNum 2))))))))))).
(*Proof starts here*)
Definition pr: proof :=
((PrPoseWithoutProof 5 7 PROOF.FSGAverage 
(PBinPred PROP.RLe (TBinOp TERM.RMult ((TVar "x")) ((TVar "y")))(TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "x")) ((TVar "x")))) ((TBinOp TERM.RMult ((TVar "y")) ((TVar "y")))))) ((TNum 2)))))
((((PrPoseWithoutProof 8 10 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TVar "x")) ((TVar "y"))))) (((TBinOp TERM.RPlus ((TVar "x")) ((TVar "y"))))))) ((PLongOrder PROP.RLe ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TNum 2)) (((TBinOp TERM.RMult ((TVar "x")) ((TVar "y"))))))) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))) ((TBinOp TERM.RPower ((TVar "y")) ((TNum 2)))))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TNum 2)) (((TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "x")) ((TVar "x")))) ((TBinOp TERM.RMult ((TVar "y")) ((TVar "y")))))) ((TNum 2))))))) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))) ((TBinOp TERM.RPower ((TVar "y")) ((TNum 2)))))(TBinOp TERM.RMult ((TNum 2)) (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "y")) ((TNum 2)))))))))))))
((PrConclWithoutProof 11 11 PROOF.FNoHint))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
