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
(PQuant PROP.QForall "a" (PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "a"))(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RMult ((TVar "lambda")) ((TApply (TVar "a" ) (TVar "n" )))))))
(TBinOp TERM.RMult ((TVar "lambda")) ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "a"))))
)
(((PrPoseWithoutProof 5 5 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "l" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "l"))))
(PrPosePartialProof 6 10 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss")(TNum 0))::nil))((PrPoseWithoutProof 6 8 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "N" (PQuant PROP.QForall "n"(PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "N"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "l")))))(TBinOp TERM.RDiv ((TVar "epss")) ((TBinOp TERM.RPlus ((TNum 1)) ( (TUnOp TERM.RAbs ((TVar "lambda"))))))))))))
(((PrPoseWithoutProof 9 9 PROOF.FNoHint)(PQuant PROP.QForall "n"(PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "N"))(PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TVar "lambda")) ((TApply (TVar "a" ) (TVar "n" ))))) ((TBinOp TERM.RMult ((TVar "lambda")) ((TVar "l")))))))) ((PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TBinOp TERM.RMult ((TVar "lambda")) (((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "l"))))))))) ((PLongOrder PROP.RLt ((TBinOp TERM.RMult ( (TUnOp TERM.RAbs ((TVar "lambda")))) ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "l")))))))) (PBinPred PROP.RLt (TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TVar "epss")) ( (TUnOp TERM.RAbs ((TVar "lambda")))))) ((TBinOp TERM.RPlus ((TNum 1)) ( (TUnOp TERM.RAbs ((TVar "lambda")))))))(TVar "epss")))))))))(PrEndPartialProof))))((PrPoseWithoutProof 11 11 (PROOF.FDefinition PROOF.SeqLimit) 
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RMult ((TVar "lambda")) ((TApply (TVar "a" ) (TVar "n" )))))))
(TBinOp TERM.RMult ((TVar "lambda")) ((TVar "l")))))
((((PrPoseWithoutProof 12 12 PROOF.FNoHint)(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RMult ((TVar "lambda")) ((TApply (TVar "a" ) (TVar "n" )))))))
(TBinOp TERM.RMult ((TVar "lambda")) ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
))))
((PrConclWithoutProof 13 13 PROOF.FNoHint))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
