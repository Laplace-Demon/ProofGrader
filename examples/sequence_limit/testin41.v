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
(PQuant PROP.QForall "a" (PQuant PROP.QForall "b" (PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "a"))(PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "b"))(PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
) ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
))(TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RPlus ((TApply (TVar "a" ) (TVar "n" ))) ((TApply (TVar "b" ) (TVar "n" )))))))
))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "a"))))
)
(((PrAction 5 5(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "b"))))
)
(((PrPoseWithoutProof 6 6 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "la" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "la"))))
(((PrPoseWithoutProof 7 7 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "lb" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
(TVar "lb"))))
(PrPosePartialProof 8 13 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss")(TNum 0))::nil))((PrPoseWithoutProof 8 10 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Na" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Na"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la")))))(TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2))))))))
(((PrPoseWithoutProof 11 11 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Nb" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Nb"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "lb")))))(TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2))))))))
(((PrPoseWithoutProof 12 12 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TBinOp TERM.RMax ((TVar "Na"))((TVar "Nb"))))(PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus (((TBinOp TERM.RPlus ((TApply (TVar "a" ) (TVar "n" ))) ((TApply (TVar "b" ) (TVar "n" )))))) (((TBinOp TERM.RPlus ((TVar "la")) ((TVar "lb"))))))))) ((PLongOrder PROP.RLe ( (TUnOp TERM.RAbs ((TBinOp TERM.RPlus (((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la"))))) (((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "lb"))))))))) ((PLongOrder PROP.RLt ((TBinOp TERM.RPlus ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la")))))) ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "lb")))))))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2)))) ((TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2)))))(TVar "epss")))))))))(PrEndPartialProof))))))((PrPoseWithoutProof 14 14 (PROOF.FDefinition PROOF.SeqLimit) 
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RPlus ((TApply (TVar "a" ) (TVar "n" ))) ((TApply (TVar "b" ) (TVar "n" )))))))
(TBinOp TERM.RPlus ((TVar "la")) ((TVar "lb")))))
((((PrPoseWithoutProof 15 15 PROOF.FNoHint)(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RPlus ((TApply (TVar "a" ) (TVar "n" ))) ((TApply (TVar "b" ) (TVar "n" )))))))
(TBinOp TERM.RPlus ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
) ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
))))
((PrConclWithoutProof 16 16 PROOF.FNoHint))))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
