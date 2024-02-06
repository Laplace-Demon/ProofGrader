From lib Require Import ExplicitName.
From lib Require Import Lang.
From lib Require Import Poly.
From lib Require Import Solver.
From lib Require Import Elaborator.
From lib Require Import Checker.
Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.
Definition premise: list prop := nil . 
Module ProofGoal.
Definition stmt: prop :=
(PQuant PROP.QForall "x"(PQuant PROP.QForall "y"(PBinPred PROP.RGe (TBinOp TERM.RMult
	((TBinOp TERM.RDiv
	((TNum 1))	((TVar "x" ))))	((TBinOp TERM.RDiv
	((TNum 1))	((TVar "y" )))))(TBinOp TERM.RDiv
	((TNum 1))	((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))))	((TNum 2)))))))).
(*Proof starts here*)
Definition pr: proof :=
(PrPoseWithoutProof 5 9 
	PROOF.FSGAverage
((PBinPred PROP.RLe (TBinOp TERM.RMult
	((TVar "x" ))	((TVar "y" )))(TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))))	((TNum 2)))))((PrPoseWithoutProof 10 11 PROOF.FNoHint
	)((PLongOrder 	PROP.REq 
((TBinOp TERM.RMult
	((TBinOp TERM.RDiv
	((TNum 1))	((TVar "x" ))))	((TBinOp TERM.RDiv
	((TNum 1))	((TVar "y" ))))))(PBinPred PROP.RGe (TBinOp TERM.RDiv
	((TNum 1))	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "y" )))))(TBinOp TERM.RDiv
	((TNum 1))	((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))))	((TNum 2))))))))(PrConclWithoutProof 12 12 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr':=snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End ProofGoal.
