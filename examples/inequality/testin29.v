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
(PBinPred PROP.REq (TBinOp TERM.RPlus ((TVar "x")) ((TVar "y")))(TNum 1))::(PBinPred PROP.RGt (TVar "x")(TNum 0))::(PBinPred PROP.RGt (TVar "y")(TNum 0))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.RGe (TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "x")))) ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "y")))))(TNum 4)).
(*Proof starts here*)
Definition pr: proof :=
((PrPoseWithoutProof 8 8 PROOF.FSGAverage 
(PBinPred PROP.RGe (TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TVar "y")) ((TVar "x")))) ((TBinOp TERM.RDiv ((TVar "x")) ((TVar "y")))))(TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TVar "y")) ((TVar "x")))) ((TBinOp TERM.RDiv ((TVar "x")) ((TVar "y")))))))))))
((((PrPoseWithoutProof 9 9 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "x")))) ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "y")))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TNum 1)) (((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "x")))) ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "y"))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TVar "x")) ((TVar "y"))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "x")))) ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "y"))))))))) ((PLongOrder PROP.RGe ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TVar "y")) ((TVar "x")))) ((TBinOp TERM.RDiv ((TVar "x")) ((TVar "y")))))) ((TNum 2)))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TVar "y")) ((TVar "x")))) ((TBinOp TERM.RDiv ((TVar "x")) ((TVar "y")))))))))) ((TNum 2)))(TNum 4))))))))))
((PrConclWithoutProof 10 10 PROOF.FNoHint))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
