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
(PQuant PROP.QForall "a" (PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "a"))(PUnPred PROP.Bounded (TVar "a")))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "a"))))
)
(((PrPoseWithoutProof 5 5 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "l" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "l"))))
(((PrPoseWithoutProof 6 6 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "N" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "N"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "l")))))(TNum 1))))))
((((PrPoseWithoutProof 7 7 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "N"))(PLongOrder PROP.REq ( (TUnOp TERM.RAbs ((TApply (TVar "a" ) (TVar "n" ))))) ((PLongOrder PROP.RLt ( (TUnOp TERM.RAbs ((TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "l")))) ((TVar "l")))))) (PBinPred PROP.RLt (TBinOp TERM.RPlus ( (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "l")))))) ( (TUnOp TERM.RAbs ((TVar "l")))))(TBinOp TERM.RPlus ((TNum 1)) ((TVar "l"))))))))))
(((PrPoseWithoutProof 8 8 (PROOF.FDefinition PROOF.Bounded) 
(PUnPred PROP.Bounded (TVar "a")))
((PrConclWithoutProof 9 9 PROOF.FNoHint))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
