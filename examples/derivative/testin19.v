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
Definition premise: list prop :=
(PBinPred PROP.REq (TVar "ch")(TBinder TERM.LambdaB "x"(TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TUnOp TERM.RNeg ((TVar "x")))))))) ((TNum 2))) ))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.REq (TApply (TUnOp TERM.Deri (TVar "ch"))(TVar "x"))(TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TUnOp TERM.RNeg ((TVar "x")))))))) ((TNum 2)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 6 7 PROOF.FNoHint)(PBinPred PROP.REq (TApply (TUnOp TERM.Deri (TVar "ch"))(TVar "x"))(TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TUnOp TERM.RNeg ((TVar "x")))))))) ((TNum 2)))))
((PrConclWithoutProof 8 8 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
