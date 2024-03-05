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
(PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TBinOp TERM.RSqrt ((TNum 3)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2)))))) ((TBinOp TERM.RSqrt ((TNum 3)) ((TNum 2)))))) ((TBinOp TERM.RMinus ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1)))))) ((TNum 1))))))))
(TBinOp TERM.RDiv ((TBinOp TERM.RSqrt ((TNum 3)) ((TNum 2)))) ((TNum 3)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 6 8 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TBinOp TERM.RSqrt ((TNum 3)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2)))))) ((TBinOp TERM.RSqrt ((TNum 3)) ((TNum 2)))))) ((TBinOp TERM.RMinus ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1)))))) ((TNum 1))))))))
) (PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TVar "x")) ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RPower (((TBinOp TERM.RSqrt ((TNum 3)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2))))))) ((TNum 2)))) ((TBinOp TERM.RMult ((TBinOp TERM.RSqrt ((TNum 3)) ((TNum 2)))) ((TBinOp TERM.RSqrt ((TNum 3)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2)))))))))) ((TBinOp TERM.RSqrt ((TNum 3)) ((TNum 4)))))))) ((TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1)))))) ((TNum 1)))) ((TVar "x"))))))))
(TBinOp TERM.RDiv ((TBinOp TERM.RSqrt ((TNum 3)) ((TNum 2)))) ((TNum 3))))))
((PrConclWithoutProof 9 9 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
