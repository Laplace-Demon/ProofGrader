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
(PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 1))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RMinus ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RMinus ((TNum 1)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))))) ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x"))))))))))
(TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMinus ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RMinus ((TNum 1)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))))) ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x")))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x")))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x")))))) ((TNum 1))))))) (PBinPred PROP.REq (TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x")))) ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x"))))) (((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x"))))))))(TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x"))))))))))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 1))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RMinus ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RMinus ((TNum 1)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))))) ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x"))))))))))
) (PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 1))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x"))))))))
(TBinOp TERM.RDiv ((TNum 1)) ((TNum 2))))))
((PrConclWithoutProof 6 6 PROOF.FNoHint))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
