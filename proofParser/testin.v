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
(PBinPred PROP.REq (TUnOp TERM.SeqLimit 
(TBinder TERM.LambdaB "n"
((TBinOp TERM.RDiv
	((TBinOp TERM.RMult
	((TNum 3))	((TVar "n" ))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 5))	((TVar "n" ))))	((TNum 2))))))))
(TBinOp TERM.RDiv
	((TNum 3))	((TNum 5)))).
(*Proof starts here*)
Definition pr: proof :=
(PrConclAndProof 6 6 
	PROOF.FSeqLimitDef ( (PrAction 7 7 (PROOF.AIntros "a" )
((PrAction 8 8 (PROOF.ASuppose ((PBinPred PROP.RGt (TVar "a" )(TNum 0))))
 ((PrAction 9 9 (PROOF.ASet "N"( TUnOp TERM.ZCeil((TBinOp TERM.RMult
	((TBinOp TERM.RDiv
	((TNum 6))	((TNum 25))))	((TBinOp TERM.RDiv
	((TNum 1))	((TVar "a" ))))))))
((PrAction 10 10 (PROOF.AIntros "n" )
((PrAction 11 11 (PROOF.ASuppose ((PBinPred PROP.RGt (TVar "n" )(TVar "N" ))))
 ((PrPoseWithoutProof 12 14 PROOF.FNoHint
	)((PLongOrder 	PROP.REq 
( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus
	((TBinOp TERM.RDiv
	((TBinOp TERM.RMult
	((TNum 3))	((TVar "n" ))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 5))	((TVar "n" ))))	((TNum 2))))))	((TBinOp TERM.RDiv
	((TNum 3))	((TNum 5))))))))((PLongOrder 	PROP.RLe 
((TBinOp TERM.RDiv
	((TNum 6))	((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 25))	((TVar "n" ))))	((TNum 10))))))(PBinPred PROP.RLe (TBinOp TERM.RDiv
	((TNum 6))	((TBinOp TERM.RMult
	((TNum 25))	((TVar "n" )))))(TVar "a" ))))))(PrConclWithoutProof 15 15 PROOF.FNoHint))))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr':=snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End ProofGoal.
