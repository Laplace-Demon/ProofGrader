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
Definition premise: list prop :=
(PBinPred PROP.REq (TVar "f")(TBinder TERM.LambdaB "x"(TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TNum 1))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))) ))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.REq (TApply (TUnOp TERM.Deri (TVar "f"))(TVar "x"))(TBinOp TERM.RMinus ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 5)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 4)))))) ((TBinOp TERM.RMult ((TNum 3)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))))) ((TNum 2)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 6 8 PROOF.FNoHint)(PLongOrder PROP.REq ((TApply (TUnOp TERM.Deri (TVar "f"))(TVar "x"))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TApply (TUnOp TERM.Deri (TBinder TERM.LambdaB "x" ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TNum 1)))))) (TVar "x"))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))))) ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TNum 1))))) ((TApply (TUnOp TERM.Deri (TBinder TERM.LambdaB "x" ((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))) (TVar "x"))))))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMult (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))))) ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TNum 1))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 3)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))) ((TNum 2))))))))(TBinOp TERM.RMinus ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 5)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 4)))))) ((TBinOp TERM.RMult ((TNum 3)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))))) ((TNum 2))))))))
((PrConclWithoutProof 9 9 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
