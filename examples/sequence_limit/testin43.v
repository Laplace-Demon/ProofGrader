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
(PQuant PROP.QForall "a" (PQuant PROP.QForall "b" (PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "a"))(PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "b"))(PBinPred PROP.REq (TBinOp TERM.RMult ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
) ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
))(TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RMult ((TApply (TVar "a" ) (TVar "n" ))) ((TApply (TVar "b" ) (TVar "n" )))))))
))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "a"))))
)
(((PrAction 5 5(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "b"))))
)
(((PrPoseWithoutProof 6 6 (PROOF.FCausalInfer ((PUnPred PROP.Convergent (TVar "a"))))
(PUnPred PROP.Bounded (TVar "a")))
(((PrPoseWithoutProof 7 7 (PROOF.FDefinition PROOF.Bounded) 
(PQuant PROP.QExists "M" (PQuant PROP.QForall "n" (PBinPred PROP.RLe  (TUnOp TERM.RAbs ((TApply (TVar "a" ) (TVar "n" ))))(TVar "M")))))
(((PrPoseWithoutProof 8 8 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "la" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "la"))))
(((PrPoseWithoutProof 9 9 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "lb" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
(TVar "lb"))))
(PrPosePartialProof 10 15 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss")(TNum 0))::nil))((PrPoseWithoutProof 10 12 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Na" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Na"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la")))))(TBinOp TERM.RDiv ((TVar "epss")) ((TBinOp TERM.RMult ((TNum 2)) (((TBinOp TERM.RPlus ((TNum 1)) ( (TUnOp TERM.RAbs ((TVar "lb")))))))))))))))
(((PrPoseWithoutProof 13 13 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Nb" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Nb"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "lb")))))(TBinOp TERM.RDiv ((TVar "epss")) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "M"))))))))))
(((PrPoseWithoutProof 14 14 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TBinOp TERM.RMax ((TVar "Na"))((TVar "Nb"))))(PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TApply (TVar "a" ) (TVar "n" ))) ((TApply (TVar "b" ) (TVar "n" ))))) ((TBinOp TERM.RMult ((TVar "la")) ((TVar "lb")))))))) ((PLongOrder PROP.RLe ( (TUnOp TERM.RAbs ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TApply (TVar "a" ) (TVar "n" ))) (((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "la"))))))) ((TBinOp TERM.RMult ((TVar "lb")) (((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la"))))))))))) ((PLongOrder PROP.RLe ((TBinOp TERM.RPlus ( (TUnOp TERM.RAbs ((TBinOp TERM.RMult ((TApply (TVar "a" ) (TVar "n" ))) (((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "la"))))))))) ( (TUnOp TERM.RAbs ((TBinOp TERM.RMult ((TVar "lb")) (((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la"))))))))))) ((PLongOrder PROP.RLt ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ( (TUnOp TERM.RAbs ((TApply (TVar "a" ) (TVar "n" ))))) ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "la")))))))) ((TBinOp TERM.RMult ( (TUnOp TERM.RAbs ((TVar "lb")))) ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la")))))))))) ((PLongOrder PROP.RLe ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "M")) ((TBinOp TERM.RDiv ((TVar "epss")) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "M")))))))) ((TBinOp TERM.RMult ( (TUnOp TERM.RAbs ((TVar "lb")))) ((TBinOp TERM.RDiv ((TVar "epss")) ((TBinOp TERM.RMult ((TNum 2)) (((TBinOp TERM.RPlus ((TNum 1)) ( (TUnOp TERM.RAbs ((TVar "lb"))))))))))))))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2)))) ((TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2)))))(TVar "epss")))))))))))))(PrEndPartialProof))))))((PrPoseWithoutProof 16 16 (PROOF.FDefinition PROOF.SeqLimit) 
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RMult ((TApply (TVar "a" ) (TVar "n" ))) ((TApply (TVar "b" ) (TVar "n" )))))))
(TBinOp TERM.RMult ((TVar "la")) ((TVar "lb")))))
((((PrPoseWithoutProof 17 17 PROOF.FNoHint)(PBinPred PROP.REq (TBinOp TERM.RMult ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
) ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
))(TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TBinOp TERM.RMult ((TApply (TVar "a" ) (TVar "n" ))) ((TApply (TVar "b" ) (TVar "n" )))))))
))
((PrConclWithoutProof 18 18 PROOF.FNoHint))))))))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
