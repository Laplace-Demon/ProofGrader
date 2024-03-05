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
(PQuant PROP.QForall "a" (PQuant PROP.QForall "b" (PQuant PROP.QForall "c" (PQuant PROP.QForall "l" (PBinOp PROP.CImpl (PQuant PROP.QForall "n" (PLongOrder PROP.RLe ((TApply (TVar "a" ) (TVar "n" ))) (PBinPred PROP.RLe (TApply (TVar "b" ) (TVar "n" ))(TApply (TVar "c" ) (TVar "n" )))))(PBinOp PROP.CImpl (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "l"))(PBinOp PROP.CImpl (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "c" ) (TVar "n" )))))
(TVar "l"))(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
(TVar "l"))))))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PQuant PROP.QForall "n" (PLongOrder PROP.RLe ((TApply (TVar "a" ) (TVar "n" ))) (PBinPred PROP.RLe (TApply (TVar "b" ) (TVar "n" ))(TApply (TVar "c" ) (TVar "n" )))))))
)
(((PrAction 5 5(PROOF.ASuppose ((PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "l"))))
)
(((PrAction 6 6(PROOF.ASuppose ((PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "c" ) (TVar "n" )))))
(TVar "l"))))
)
(PrPosePartialProof 7 14 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss")(TNum 0))::nil))((PrPoseWithoutProof 7 9 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Na" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Na"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "l")))))(TVar "epss"))))))
(((PrPoseWithoutProof 10 10 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Nc" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Nc"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "c" ) (TVar "n" ))) ((TVar "l")))))(TVar "epss"))))))
((((PrPoseWithoutProof 11 11 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TBinOp TERM.RMax ((TVar "Na"))((TVar "Nc"))))(PLongOrder PROP.RLt ((TBinOp TERM.RMinus ((TVar "l")) ((TVar "epss")))) ((PLongOrder PROP.RLe ((TApply (TVar "a" ) (TVar "n" ))) ((PLongOrder PROP.RLe ((TApply (TVar "b" ) (TVar "n" ))) (PBinPred PROP.RLt (TApply (TVar "c" ) (TVar "n" ))(TBinOp TERM.RPlus ((TVar "l")) ((TVar "epss"))))))))))))
((((PrPoseWithoutProof 12 12 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TBinOp TERM.RMax ((TVar "Na"))((TVar "Nc"))))(PLongOrder PROP.RLt ((TBinOp TERM.RMinus ((TVar "l")) ((TVar "epss")))) (PBinPred PROP.RLt (TApply (TVar "b" ) (TVar "n" ))(TBinOp TERM.RPlus ((TVar "l")) ((TVar "epss"))))))))
(((PrPoseWithoutProof 13 13 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TBinOp TERM.RMax ((TVar "Na"))((TVar "Nc"))))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "l")))))(TVar "epss"))))(PrEndPartialProof))))))))))((PrPoseWithoutProof 15 15 (PROOF.FDefinition PROOF.SeqLimit) 
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
(TVar "l")))
((PrConclWithoutProof 16 16 PROOF.FNoHint))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
