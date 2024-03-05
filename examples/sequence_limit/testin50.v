Require Import ExplicitName.
Require Import Lang.
Require Import Poly.
Require Import Solver.
Require Import Elaborator.
Require Import Checker.
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
(PQuant PROP.QForall "a" (PBinOp PROP.CImpl (PQuant PROP.QForall "n" (PBinPred PROP.RNeq (TApply (TVar "a" ) (TVar "n" ))(TNum 0)))(PBinOp PROP.CImpl (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TInfty TERM.Positive_Infty))(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RDiv ((TNum 1)) ((TApply (TVar "a" ) (TVar "n" )))))))
(TNum 0))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PQuant PROP.QForall "n" (PBinPred PROP.RNeq (TApply (TVar "a" ) (TVar "n" ))(TNum 0)))))
)
(((PrAction 5 5(PROOF.ASuppose ((PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TInfty TERM.Positive_Infty))))
)
(PrPosePartialProof 6 11 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss")(TNum 0))::nil))((PrPoseWithoutProof 6 8 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "N" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "N"))(PBinPred PROP.RGt (TApply (TVar "a" ) (TVar "n" ))(TBinOp TERM.RDiv ((TNum 1)) ((TVar "epss"))))))))
((((PrPoseWithoutProof 9 9 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "N"))(PLongOrder PROP.RLt ((TNum 0)) (PBinPred PROP.RLt (TBinOp TERM.RDiv ((TNum 1)) ((TApply (TVar "a" ) (TVar "n" ))))(TVar "epss"))))))
(((PrPoseWithoutProof 10 10 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "N"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TBinOp TERM.RDiv ((TNum 1)) ((TApply (TVar "a" ) (TVar "n" ))))) ((TNum 0)))))(TVar "epss"))))(PrEndPartialProof))))))((PrPoseWithoutProof 12 12 (PROOF.FDefinition PROOF.SeqLimit) 
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RDiv ((TNum 1)) ((TApply (TVar "a" ) (TVar "n" )))))))
(TNum 0)))
((PrConclWithoutProof 13 13 PROOF.FNoHint))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
