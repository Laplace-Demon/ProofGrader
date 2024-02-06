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
(PQuant PROP.QForall "x"(PBinPred PROP.REq (TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "h"
((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TUnOp TERM.RLn (((TBinOp TERM.RPlus
	((TVar "x" ))	((TVar "h" )))))))	((TUnOp TERM.RLn ((TVar "x" ))))))	((TVar "h" ))))))
(TBinOp TERM.RDiv
	((TNum 1))	((TVar "x" ))))).
(*Proof starts here*)
Definition pr: proof :=
((PrPoseWithoutProof 5 8 PROOF.FNoHint
	)((PLongOrder 	PROP.REq 
((TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "h"
((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TUnOp TERM.RLn (((TBinOp TERM.RPlus
	((TVar "x" ))	((TVar "h" )))))))	((TUnOp TERM.RLn ((TVar "x" ))))))	((TVar "h" ))))))
)((PLongOrder 	PROP.REq 
((TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "h"
((TBinOp TERM.RDiv
	((TUnOp TERM.RLn (((TBinOp TERM.RPlus
	((TNum 1))	((TBinOp TERM.RDiv
	((TVar "h" ))	((TVar "x" )))))))))	((TVar "h" ))))))
)((PLongOrder 	PROP.REq 
((TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "h"
((TBinOp TERM.RDiv
	((TBinOp TERM.RDiv
	((TVar "h" ))	((TVar "x" ))))	((TVar "h" ))))))
)(PBinPred PROP.REq (TBinOp TERM.RLim 
((TNum 0))(TBinder TERM.LambdaB "h"
((TBinOp TERM.RDiv
	((TNum 1))	((TVar "x" ))))))
(TBinOp TERM.RDiv
	((TNum 1))	((TVar "x" ))))))))))(PrConclWithoutProof 9 9 PROOF.FNoHint)).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr':=snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End ProofGoal.
