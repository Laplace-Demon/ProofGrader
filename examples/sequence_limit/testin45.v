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
(PQuant PROP.QForall "a" (PQuant PROP.QForall "b" (PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "a"))(PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "b"))(PBinOp PROP.CImpl (PQuant PROP.QForall "n" (PBinPred PROP.RLe (TApply (TVar "a" ) (TVar "n" ))(TApply (TVar "b" ) (TVar "n" ))))(PBinPred PROP.RLe (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
)))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "a"))))
)
(((PrAction 5 5(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "b"))))
)
(((PrAction 6 6(PROOF.ASuppose ((PQuant PROP.QForall "n" (PBinPred PROP.RLe (TApply (TVar "a" ) (TVar "n" ))(TApply (TVar "b" ) (TVar "n" ))))))
)
(((PrPoseWithoutProof 7 7 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "la" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "la"))))
(((PrPoseWithoutProof 8 8 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "lb" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
(TVar "lb"))))
(PrPosePartialProof 9 16 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss")(TNum 0))::nil))((PrPoseWithoutProof 9 11 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Na" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Na"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la")))))(TVar "epss"))))))
(((PrPoseWithoutProof 12 12 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Nb" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Nb"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "lb")))))(TVar "epss"))))))
((((PrPoseWithoutProof 13 13 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Na"))(PBinPred PROP.RGt (TApply (TVar "a" ) (TVar "n" ))(TBinOp TERM.RMinus ((TVar "la")) ((TVar "epss")))))))
((((PrPoseWithoutProof 14 14 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Nb"))(PBinPred PROP.RGt (TApply (TVar "b" ) (TVar "n" ))(TBinOp TERM.RPlus ((TVar "lb")) ((TVar "epss")))))))
(((PrPoseWithoutProof 15 15 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TBinOp TERM.RMax ((TVar "Na"))((TVar "Nb"))))(PLongOrder PROP.RLt ((TBinOp TERM.RMinus ((TVar "la")) ((TVar "epss")))) ((PLongOrder PROP.RLe ((TApply (TVar "a" ) (TVar "n" ))) (PBinPred PROP.RLt (TApply (TVar "b" ) (TVar "n" ))(TBinOp TERM.RPlus ((TVar "lb")) ((TVar "epss")))))))))(PrEndPartialProof))))))))))(((PrPoseWithoutProof 17 17 PROOF.FNoHint)(PQuant PROP.QForall "epss" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "epss")(TNum 0))(PBinPred PROP.RLt (TBinOp TERM.RMinus ((TVar "la")) ((TVar "epss")))(TBinOp TERM.RPlus ((TVar "lb")) ((TVar "epss")))))))
((((PrPoseWithoutProof 18 18 PROOF.FNoHint)(PBinPred PROP.RLe (TVar "la")(TVar "lb")))
((((PrPoseWithoutProof 19 19 PROOF.FNoHint)(PBinPred PROP.RLe (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
))
((PrConclWithoutProof 20 20 PROOF.FNoHint))))))))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
