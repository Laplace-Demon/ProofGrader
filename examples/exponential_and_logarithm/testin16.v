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
(PQuant PROP.QForall "x" (PBinPred PROP.REq (TBinOp TERM.RPower ((TVar "x")) ((TBinOp TERM.RDiv ((TUnOp TERM.RLn (((TUnOp TERM.RLn (((TVar "x")))))))) ((TUnOp TERM.RLn (((TVar "x"))))))))(TUnOp TERM.RLn (((TVar "x")))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RPower ((TVar "x")) ((TBinOp TERM.RDiv ((TUnOp TERM.RLn (((TUnOp TERM.RLn (((TVar "x")))))))) ((TUnOp TERM.RLn (((TVar "x"))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPower (((TBinOp TERM.RPower ((TConst TERM.RE)) ((TUnOp TERM.RLn (((TVar "x")))))))) ((TBinOp TERM.RDiv ((TUnOp TERM.RLn (((TUnOp TERM.RLn (((TVar "x")))))))) ((TUnOp TERM.RLn (((TVar "x"))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TUnOp TERM.RLn (((TUnOp TERM.RLn (((TVar "x")))))))) ((TUnOp TERM.RLn (((TVar "x"))))))) ((TUnOp TERM.RLn (((TVar "x"))))))))) (PBinPred PROP.REq (TBinOp TERM.RPower ((TConst TERM.RE)) ((TUnOp TERM.RLn (((TUnOp TERM.RLn (((TVar "x")))))))))(TUnOp TERM.RLn (((TVar "x")))))))))))
((PrConclWithoutProof 5 5 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
