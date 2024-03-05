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
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "x" ((TBinOp TERM.RMult ((TVar "x")) (((TBinOp TERM.RMinus ((TNum 5)) ((TBinOp TERM.RDiv ((TNum 4)) ((TBinOp TERM.RPower (((TBinOp TERM.RMinus ((TVar "x")) ((TNum 3))))) ((TNum 2)))))))))))))
(TInfty TERM.Positive_Infty)).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TNum 4)) ((TBinOp TERM.RPower (((TBinOp TERM.RMinus ((TVar "x")) ((TNum 3))))) ((TNum 2))))))))
(TNum 0)))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "x" ((TBinOp TERM.RMinus ((TNum 5)) ((TBinOp TERM.RDiv ((TNum 4)) ((TBinOp TERM.RPower (((TBinOp TERM.RMinus ((TVar "x")) ((TNum 3))))) ((TNum 2))))))))))
(TNum 5)))
((((PrPoseWithoutProof 6 6 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "x" ((TBinOp TERM.RMult ((TVar "x")) (((TBinOp TERM.RMinus ((TNum 5)) ((TBinOp TERM.RDiv ((TNum 4)) ((TBinOp TERM.RPower (((TBinOp TERM.RMinus ((TVar "x")) ((TNum 3))))) ((TNum 2)))))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "x" ((TVar "x"))))
) ((TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "x" ((TBinOp TERM.RMinus ((TNum 5)) ((TBinOp TERM.RDiv ((TNum 4)) ((TBinOp TERM.RPower (((TBinOp TERM.RMinus ((TVar "x")) ((TNum 3))))) ((TNum 2))))))))))
))) (PBinPred PROP.REq (TBinOp TERM.RMult ((TInfty TERM.Positive_Infty)) ((TNum 5)))(TInfty TERM.Positive_Infty))))))
((PrConclWithoutProof 7 7 PROOF.FNoHint))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
