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
(PQuant PROP.QForall "x" (PBinPred PROP.REq (TUnOp TERM.RLn (((TBinOp TERM.RMult ((TVar "x")) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TNum 3)))) ((TVar "x")))) ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x"))))))))))))(TBinOp TERM.RMinus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 3)) ((TNum 2)))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 3)) ((TNum 2)))) ((TUnOp TERM.RLn (((TVar "x"))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) ((TUnOp TERM.RLn (((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x")))))))))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 5 PROOF.FNoHint)(PLongOrder PROP.REq ((TUnOp TERM.RLn (((TBinOp TERM.RMult ((TVar "x")) ((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TNum 3)))) ((TVar "x")))) ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x"))))))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TUnOp TERM.RLn (((TVar "x"))))) ((TUnOp TERM.RLn (((TBinOp TERM.RSqrt (TNum 2) ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TNum 3)))) ((TVar "x")))) ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x"))))))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TUnOp TERM.RLn (((TVar "x"))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) ((TUnOp TERM.RLn (((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TNum 3)))) ((TVar "x")))) ((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x"))))))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TUnOp TERM.RLn (((TVar "x"))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) (((TBinOp TERM.RMinus ((TUnOp TERM.RLn (((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TNum 3)))) ((TVar "x"))))))) ((TUnOp TERM.RLn (((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x")))))))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TUnOp TERM.RLn (((TVar "x"))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPlus ((TUnOp TERM.RLn (((TBinOp TERM.RPower ((TConst TERM.RE)) ((TNum 3))))))) ((TUnOp TERM.RLn (((TVar "x"))))))) ((TUnOp TERM.RLn (((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x")))))))))))))) (PBinPred PROP.REq (TBinOp TERM.RMinus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TUnOp TERM.RLn (((TBinOp TERM.RPower ((TConst TERM.RE)) ((TNum 3))))))) ((TNum 2)))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 3)) ((TNum 2)))) ((TUnOp TERM.RLn (((TVar "x"))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) ((TUnOp TERM.RLn (((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x"))))))))))(TBinOp TERM.RMinus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 3)) ((TNum 2)))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 3)) ((TNum 2)))) ((TUnOp TERM.RLn (((TVar "x"))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) ((TUnOp TERM.RLn (((TBinOp TERM.RMinus ((TNum 1)) ((TVar "x")))))))))))))))))))))
((PrConclWithoutProof 6 6 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
