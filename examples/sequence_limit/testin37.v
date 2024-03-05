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
(PQuant PROP.QForall "x" (PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "h" ((TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TUnOp TERM.RLn (((TBinOp TERM.RPlus ((TVar "x")) ((TVar "h"))))))) ((TUnOp TERM.RLn ((TVar "x")))))) ((TVar "h"))))))
(TBinOp TERM.RDiv ((TNum 1)) ((TVar "x"))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 5 9 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "h" ((TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TUnOp TERM.RLn (((TBinOp TERM.RPlus ((TVar "x")) ((TVar "h"))))))) ((TUnOp TERM.RLn ((TVar "x")))))) ((TVar "h"))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "h" ((TBinOp TERM.RDiv ((TUnOp TERM.RLn (((TBinOp TERM.RPlus ((TNum 1)) ((TBinOp TERM.RDiv ((TVar "h")) ((TVar "x"))))))))) ((TVar "h"))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "h" ((TBinOp TERM.RDiv ((TBinOp TERM.RDiv ((TVar "h")) ((TVar "x")))) ((TVar "h"))))))
) (PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "h" ((TBinOp TERM.RDiv ((TNum 1)) ((TVar "x"))))))
(TBinOp TERM.RDiv ((TNum 1)) ((TVar "x"))))))))))
((PrConclWithoutProof 10 10 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
