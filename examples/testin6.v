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
Definition premise: list prop := (PBinPred PROP.REq (TVar "f")
(TBinder TERM.LambdaB "x" (TUnOp TERM.RCos (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RMult (TNum 2) (TVar "x")))))) :: nil.
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.UContinueOn (TVar "f")
(TInterval TERM.LClosed_ROpen_interval (TNum 0) (TInfty TERM.Positive_Infty))).
(*Proof starts here*)


Definition pr: proof :=
((PrPoseWithoutProof 12 13 PROOF.FNoHint
	)((PBinPred PROP.RGe (TBinOp TERM.RMinus
	((TVar "x1" ))	((TVar "x2" )))(TNum 0)))((PrPoseWithoutProof 14 15 PROOF.FNoHint
	)((PLongOrder 	PROP.REq 
((TBinOp TERM.RMinus
	((TVar "x1" ))	((TVar "x2" ))))(PBinPred PROP.RLe  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus
	((TVar "x1" ))	((TVar "x2" )))))(TVar "delta" ))))((PrPoseWithoutProof 16 17 PROOF.FNoHint
	)((PBinPred PROP.RLe (TNum 0)(TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2)))))((PrPoseWithoutProof 18 19 PROOF.FNoHint
	)((PLongOrder 	PROP.RLe 
((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))((PLongOrder 	PROP.REq 
((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))	((TBinOp TERM.RMult
	((TNum 2))	((TVar "delta" ))))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))((PLongOrder 	PROP.RLe 
((TBinOp TERM.RDiv
	((TVar "delta" ))	((TBinOp TERM.RPlus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))	((TBinOp TERM.RMult
	((TNum 2))	((TVar "delta" ))))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))))(PBinPred PROP.RLe (TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RDiv
	((TVar "delta" ))	((TNum 2)))))(TBinOp TERM.RDiv
	((TConst TERM.RPi))	((TNum 2))))))))))((PrPoseWithoutProof 20 21 PROOF.FNoHint
	)((PBinPred PROP.RLe (TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RDiv
	((TVar "delta" ))	((TNum 2)))))(TBinOp TERM.RDiv
	((TConst TERM.RPi))	((TNum 2)))))((PrPoseWithoutProof 22 23 PROOF.FNoHint
	)((PLongOrder 	PROP.RLe 
((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))((PLongOrder 	PROP.REq 
((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))	((TBinOp TERM.RMult
	((TNum 2))	((TVar "delta" ))))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))(PBinPred PROP.RLe (TBinOp TERM.RDiv
	((TVar "delta" ))	((TBinOp TERM.RPlus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RPlus
	((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))	((TBinOp TERM.RMult
	((TNum 2))	((TVar "delta" ))))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" )))))))))(TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RDiv
	((TVar "delta" ))	((TNum 2))))))))))((PrPoseWithoutProof 24 25 PROOF.FNoHint
	)((PLongOrder 	PROP.RLe 
((TNum 0))((PLongOrder 	PROP.RLe 
((TUnOp TERM.RSin ((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))))((PLongOrder 	PROP.RLe 
((TUnOp TERM.RSin ((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RDiv
	((TVar "delta" ))	((TNum 2))))))))(PBinPred PROP.RLe (TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RDiv
	((TVar "delta" ))	((TNum 2)))))(TBinOp TERM.RDiv
	((TVar "epss" ))	((TNum 2))))))))))((PrPoseWithoutProof 26 27 PROOF.FNoHint
	)((PBinPred PROP.RLe  (TUnOp TERM.RAbs ((TUnOp TERM.RSin ((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2)))))))(TBinOp TERM.RDiv
	((TVar "epss" ))	((TNum 2)))))((PrPoseWithoutProof 28 29 PROOF.FNoHint
	)((PLongOrder 	PROP.REq 
( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus
	((TUnOp TERM.RCos ((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))))	((TUnOp TERM.RCos ((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))))))((PLongOrder 	PROP.REq 
( (TUnOp TERM.RAbs ((TUnOp TERM.RNeg ((TBinOp TERM.RMult
	((TNum 2))	((TBinOp TERM.RMult
	((TUnOp TERM.RSin ((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))))	((TUnOp TERM.RSin ((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))))))))))))((PLongOrder 	PROP.REq 
( (TUnOp TERM.RAbs ((TBinOp TERM.RMult
	((TNum 2))	((TBinOp TERM.RMult
	((TUnOp TERM.RSin ((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))))	((TUnOp TERM.RSin ((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))))))))))(PBinPred PROP.RLe (TBinOp TERM.RMult
	((TNum 2))	((TBinOp TERM.RMult
	( (TUnOp TERM.RAbs ((TUnOp TERM.RSin ((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2))))))))	( (TUnOp TERM.RAbs ((TUnOp TERM.RSin ((TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x1" ))))))	((TBinOp TERM.RSqrt (TNum 2)((TBinOp TERM.RMult
	((TNum 2))	((TVar "x2" ))))))))	((TNum 2)))))))))))(TVar "epss" ))))))))(PrConclWithoutProof 30 30 PROOF.FNoHint)))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil |}.
Definition temp := elaboration pg pr .
Definition pg' := fst temp.
Definition pr':=snd temp.
Definition check_result := check_rec' pg' pr'.
Compute check_result.
End Goal001.