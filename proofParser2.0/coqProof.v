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
Definition premise: list prop := nil.
Module ProofGoal.
Definition stmt: prop :=
(PQuant PROP.QForall "a" (PBinOp PROP.CImpl (PUnPred PROP.BoundedAbove  (TVar "a"))(PBinOp PROP.CImpl (PUnPred PROP.MonoInc (TVar "a"))(PQuant PROP.QExists "A"(PBinPred PROP.REq (TBinOp TERM.RLim 
(TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n"
((TApply (TVar "a " ) (TVar "n" )))))
(TVar "A" )))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PUnPred PROP.BoundedAbove  (TVar "a"))))
 )
 (((PrAction 5 5(PROOF.ASuppose ((PUnPred PROP.MonoInc (TVar "a"))))
 )
 (((PrPoseWithoutProof 6 6 
	(PROOF.FTheorem PROOF.SupremumAndInfimum nil)
(PQuant PROP.QExists "A"(PBinPred PROP.REq (TVar "A" )(TUnOp TERM.RSup ((TVar "a"))))))
 (((PrAction 7 7(PROOF.ASet "A"( (TUnOp TERM.RSup ((TVar "a")))))
)
 (PrPoseAndProve 8 21 (PROOF.FNoHint) (PBinPred PROP.REq (TBinOp TERM.RLim 
(TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n"
((TApply (TVar "a " ) (TVar "n" )))))
(TVar "A" ))
 (PrPosePartialProof 8 18 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss" )(TNum 0))::nil))((PrPoseWithoutProof 8 13 
	(PROOF.FDefinition PROOF.Supremum)
(PQuant PROP.QExists "N"(PBinPred PROP.RGt (TApply (TVar "a " ) (TVar "N" ))(TBinOp TERM.RMinus
	((TApply (TVar "a " ) (TVar "n" )))	((TVar "epss" ))))))
 (((PrPoseWithoutProof 14 14 (PROOF.FCausalInfer (
	(PUnPred PROP.MonoInc (TVar "a")))) 
	(PQuant PROP.QForall "n"(PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n" )(TVar "N" ))(PBinPred PROP.RGt (TApply (TVar "a " ) (TVar "n" ))(TApply (TVar "a " ) (TVar "N" ))))))
 ((((PrPoseWithoutProof 15 15 PROOF.FNoHint
	)(PLongOrder 	PROP.RGt 
((TApply (TVar "a " ) (TVar "n" )))(PBinPred PROP.RGt (TApply (TVar "a " ) (TVar "N" ))(TBinOp TERM.RMinus
	((TVar "a" ))	((TVar "epss" ))))))
 (((PrPoseWithoutProof 16 16 (PROOF.FCausalInfer (
	(PBinPred PROP.BoundedAboveBy (TVar "a")(TVar "A" )))) 
	(PQuant PROP.QForall "n"(PBinPred PROP.RLt (TApply (TVar "a " ) (TVar "n" ))(TVar "A" ))))
 (((PrPoseWithoutProof 17 17 PROOF.FNoHint
	)(PQuant PROP.QForall "n"(PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n" )(TVar "N" ))(PLongOrder 	PROP.RLt 
((TBinOp TERM.RMinus
	((TVar "A" ))	((TVar "epss" ))))(PBinPred PROP.RLt (TApply (TVar "a " ) (TVar "n" ))(TBinOp TERM.RPlus
	((TVar "A" ))	((TVar "epss" )))))))(PrEndPartialProof))))))))))((PrPoseWithoutProof 19 19 
	(PROOF.FDefinition PROOF.SeqLimit)
(PBinPred PROP.REq (TBinOp TERM.RLim 
(TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n"
((TApply (TVar "a " ) (TVar "n" )))))
(TVar "a" )))
 ((PrConclWithoutProof 20 20 PROOF.FNoHint))))
((PrConclWithoutProof 20 20 PROOF.FNoHint)))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr':=snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End ProofGoal.
