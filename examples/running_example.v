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
(PQuant PROP.QForall "a" 
(PBinOp PROP.CImpl (PUnPred PROP.BoundedAbove  (TVar "a"))
(PBinOp PROP.CImpl (PUnPred PROP.MonoInc (TVar "a"))
(PQuant PROP.QExists "A"
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)
(TBinder TERM.LambdaB "n"((TApply (TVar "a" ) (TVar "n" )))))(TVar "A" )))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4 (PROOF.ASuppose (PUnPred PROP.BoundedAbove (TVar "a"))))
(((PrAction 5 5 (PROOF.ASuppose (PUnPred PROP.MonoInc (TVar "a"))))
(((PrPoseWithoutProof 6 6 (PROOF.FTheorem PROOF.SupremumAndInfimum nil)
(PQuant PROP.QExists "A" (PBinPred PROP.REq (TVar "A") (TUnOp TERM.RSup (TVar "a")))))
(((PrPoseAndProve 7 20 PROOF.FNoHint (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)
(TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A"))
(PrPosePartialProof 9 17 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss" )(TNum 0))::nil)) 
((PrPoseWithoutProof 9 12 (PROOF.FDefinition PROOF.Supremum)
(PQuant PROP.QExists "N" (PBinPred PROP.RGt  (TApply (TVar "a") (TVar "N")) (TBinOp TERM.RMinus (TVar "A") (TVar "epss" )))))
(((PrPoseWithoutProof 13 13 (PROOF.FCausalInfer (PUnPred PROP.MonoInc (TVar "a"))) (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n" ) (TVar "N")) (PBinPred PROP.RGt (TApply (TVar "a") (TVar "n")) (TApply (TVar "a") (TVar "N"))))))
((((PrPoseWithoutProof 14 14 PROOF.FNoHint) (PQuant PROP.QForall "n" (PBinOp PROP.CImpl  (PBinPred PROP.RGt (TVar "n") (TVar "N")) (PLongOrder PROP.RGt ((TApply (TVar "a") (TVar "n"))) (PBinPred PROP.RGt (TApply (TVar "a") (TVar "N"))(TBinOp TERM.RMinus (TVar "A") (TVar "epss")))))))
(((PrPoseWithoutProof 15 15 (PROOF.FCausalInfer (PBinPred PROP.BoundedAboveBy (TVar "a") (TVar "A"))) (PQuant PROP.QForall "n" (PBinPred PROP.RLt (TApply (TVar "a") (TVar "n")) (TVar "A"))))
(((PrPoseWithoutProof 16 16 PROOF.FNoHint) (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n") (TVar "N")) (PLongOrder PROP.RLt (TBinOp TERM.RMinus (TVar "A") (TVar "epss")) (PBinPred PROP.RLt (TApply (TVar "a") (TVar "n")) (TBinOp TERM.RPlus (TVar "A") (TVar "epss"))))))
PrEndPartialProof)))))))))
((PrPoseWithoutProof 18 18 (PROOF.FDefinition PROOF.SeqLimit) (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A")))
(PrConclWithoutProof 19 19 PROOF.FNoHint)))
(PrConclWithoutProof 21 21 PROOF.FNoHint))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.

Compute pr'.
End Goal001.
