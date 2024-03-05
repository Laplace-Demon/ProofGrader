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
(PQuant PROP.QForall "x" (PBinPred PROP.RLe  (TUnOp TERM.RAbs ((TBinOp TERM.RDiv ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2))))) (TUnOp TERM.RAbs ((TUnOp TERM.RSin ((TVar "x"))))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TBinOp TERM.RDiv ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2)))))) ((PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TNum 2)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TUnOp TERM.RCos ((TVar "x")))))) ((TNum 2)))))) ((PLongOrder PROP.RLe ( (TUnOp TERM.RAbs ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TVar "x")))) ((TUnOp TERM.RCos ((TVar "x")))))))) (PBinPred PROP.RLe (TBinOp TERM.RMult ( (TUnOp TERM.RAbs ((TUnOp TERM.RSin ((TVar "x")))))) ( (TUnOp TERM.RAbs ((TUnOp TERM.RCos ((TVar "x"))))))) (TUnOp TERM.RAbs ((TUnOp TERM.RSin ((TVar "x"))))))))))))
((PrConclWithoutProof 5 5 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
