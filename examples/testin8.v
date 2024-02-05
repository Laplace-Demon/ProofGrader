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
(PBinPred PROP.REq (TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "x"
((TBinOp TERM.RDiv
	((TVar "x" ))	((TUnOp TERM.RSin ((TUnOp TERM.RSin ((TVar "x" ))))))))))
(TNum 1)).
(*Proof starts here*)
Definition pr: proof :=
((PrPoseWithoutProof 6 9 PROOF.FNoHint
	)((PLongOrder 	PROP.REq 
((TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "x"
((TBinOp TERM.RDiv
	((TVar "x" ))	((TUnOp TERM.RSin ((TUnOp TERM.RSin ((TVar "x" ))))))))))
)((PLongOrder 	PROP.REq 
((TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "x"
((TBinOp TERM.RDiv
	((TVar "x" ))	((TUnOp TERM.RSin ((TVar "x" ))))))))
)((PLongOrder 	PROP.REq 
((TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "x"
((TBinOp TERM.RDiv
	((TVar "x" ))	((TVar "x" ))))))
)(PBinPred PROP.REq (TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "x"
((TNum 1))))
(TNum 1))))))))(PrConclWithoutProof 10 10 PROOF.FNoHint)).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil |}.
Definition temp := elaboration pg pr .
Definition pg' := fst temp.
Definition pr':=snd temp.
Definition check_result := check_rec' pg' pr'.
Compute check_result.
End Goal001.
