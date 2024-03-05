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
(PQuant PROP.QForall "a" (PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "a"))(PUnPred PROP.Unique (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "a"))))
)
(((PrPoseWithoutProof 5 5 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "l" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "la"))))
(PrPosePartialProof 6 16 (PROOF.APoseVar "lb" ((PBinPred PROP.REq (TVar "lb")(TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" ))))))::nil))
(PrPosePartialProof 6 13 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss") (TNum 0))::nil)) ((PrPoseWithoutProof 6 10 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Na" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Na"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la")))))(TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2))))))))
(((PrPoseWithoutProof 11 11 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Nb" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Nb"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "lb")))))(TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2))))))))
(((PrPoseWithoutProof 12 12 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TBinOp TERM.RMax ((TVar "Na"))((TVar "Nb"))))(PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TVar "la")) ((TVar "lb")))))) ((PLongOrder PROP.RLe ( (TUnOp TERM.RAbs ((TBinOp TERM.RPlus (((TBinOp TERM.RMinus ((TVar "la")) ((TApply (TVar "a" ) (TVar "n" )))))) (((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "lb"))))))))) ((PLongOrder PROP.RLt ((TBinOp TERM.RPlus ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TVar "la")) ((TApply (TVar "a" ) (TVar "n" ))))))) ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "lb")))))))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2)))) ((TBinOp TERM.RDiv ((TVar "epss")) ((TNum 2)))))(TVar "epss")))))))))(PrEndPartialProof))))))
(((PrPoseWithoutProof 14 14 PROOF.FNoHint)(PQuant PROP.QForall "epss" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "epss")(TNum 0))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TVar "la")) ((TVar "lb")))))(TVar "epss")))))
(((PrPoseWithoutProof 15 15 PROOF.FNoHint)(PBinPred PROP.REq (TVar "la")(TVar "lb")) (PrEndPartialProof)))))
((PrPoseWithoutProof 17 17 (PROOF.FDefinition PROOF.Unique) 
(PUnPred PROP.Unique (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))))
((PrConclWithoutProof 18 18 PROOF.FNoHint))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
