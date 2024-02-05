From lib Require Import ExplicitName.
From lib Require Import Lang.
From lib Require Import Solver.
From lib Require Import Poly.
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
Module Goal001.
Definition stmt: prop :=
(PQuant PROP.QForall "x"(PQuant PROP.QForall "y"(PQuant PROP.QForall "z"(PBinPred PROP.RLe (TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "y" ))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "z" ))))	((TBinOp TERM.RMult
	((TVar "z" ))	((TVar "x" )))))))(TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))	((TBinOp TERM.RMult
	((TVar "z" ))	((TVar "z" ))))))))))).
(*Proof starts here*)
Definition pr: proof :=
(PrPoseWithoutProof 5 9 
	PROOF.FSGAverage
((PBinPred PROP.RLe (TBinOp TERM.RMult
	((TVar "x" ))	((TVar "y" )))(TBinOp TERM.RDiv
	(((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" ))))	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" )))))))	((TNum 2)))))(PrPoseWithoutProof 10 10 
	PROOF.FSGAverage
((PBinPred PROP.RLe (TBinOp TERM.RMult
	((TVar "y" ))	((TVar "z" )))(TBinOp TERM.RDiv
	(((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "y" ))	((TVar "y" ))))	((TBinOp TERM.RMult
	((TVar "z" ))	((TVar "z" )))))))	((TNum 2)))))(PrPoseWithoutProof 11 11 
	PROOF.FSGAverage
((PBinPred PROP.RLe (TBinOp TERM.RMult
	((TVar "z" ))	((TVar "x" )))(TBinOp TERM.RDiv
	(((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TVar "z" ))	((TVar "z" ))))	((TBinOp TERM.RMult
	((TVar "x" ))	((TVar "x" )))))))	((TNum 2)))))((PrConclWithoutProof 12 12 (PROOF.FAddEqn ["___hyp0" ; "___hyp1" ; "___hyp2" ])))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil |}.
Definition temp := elaboration pg pr .
Definition pg' := fst temp.
Definition pr':=snd temp.
Definition check_result := check_rec' pg' pr'.
Compute check_result.
End Goal001.