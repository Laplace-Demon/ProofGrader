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
(PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 3)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))))))))
(TBinOp TERM.RDiv ((TNum 1)) ((TNum 4)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 6 10 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 3)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 3)) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))))) ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 3)) ((TUnOp TERM.RCos ((TVar "x")))))) ((TBinOp TERM.RMult ((TNum 3)) ((TUnOp TERM.RCos ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TBinOp TERM.RMinus ((TUnOp TERM.RCos ((TVar "x")))) ((TUnOp TERM.RCos ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))) ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 3)) ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x")))))))) ((TUnOp TERM.RSin ((TVar "x"))))))))))
) (PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 9)) ((TUnOp TERM.RCos ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x")))))))) ((TUnOp TERM.RCos ((TVar "x"))))))))))
(TBinOp TERM.RDiv ((TNum 1)) ((TNum 4))))))))))))
((PrConclWithoutProof 11 11 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
