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
(PQuant PROP.QForall "x" (PBinPred PROP.REq (TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x")))))(TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 3)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult ((TNum 4)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin ((TVar "x")))) ((TNum 3))))))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PLongOrder PROP.REq ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x")))))) (PBinPred PROP.REq (TUnOp TERM.RSin (((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))) ((TVar "x"))))))(TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))) ((TUnOp TERM.RCos ((TVar "x")))))) ((TBinOp TERM.RMult ((TUnOp TERM.RCos ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))) ((TUnOp TERM.RSin ((TVar "x"))))))))))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))) ((TUnOp TERM.RCos ((TVar "x")))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult (((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TNum 2)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TUnOp TERM.RCos ((TVar "x"))))))) ((TUnOp TERM.RCos ((TVar "x")))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TNum 2)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RPower ((TUnOp TERM.RCos ((TVar "x")))) ((TNum 2)))))) (PBinPred PROP.REq (TBinOp TERM.RMult ((TBinOp TERM.RMult ((TNum 2)) ((TUnOp TERM.RSin ((TVar "x")))))) (((TBinOp TERM.RMinus ((TNum 1)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin ((TVar "x")))) ((TNum 2))))))))(TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 2)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin ((TVar "x")))) ((TNum 3))))))))))))))
((((PrPoseWithoutProof 6 6 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult ((TUnOp TERM.RCos ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))) ((TUnOp TERM.RSin ((TVar "x")))))) (PBinPred PROP.REq (TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TNum 1)) ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin ((TVar "x")))) ((TNum 2))))))))) ((TUnOp TERM.RSin ((TVar "x")))))(TBinOp TERM.RMinus ((TUnOp TERM.RSin ((TVar "x")))) ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin ((TVar "x")))) ((TNum 3))))))))))
((((PrPoseWithoutProof 7 7 PROOF.FNoHint)(PLongOrder PROP.REq ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 3)) ((TVar "x")))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))) ((TUnOp TERM.RCos ((TVar "x")))))) ((TBinOp TERM.RMult ((TUnOp TERM.RCos ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))) ((TUnOp TERM.RSin ((TVar "x")))))))) (PBinPred PROP.REq (TBinOp TERM.RPlus (((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 2)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin ((TVar "x")))) ((TNum 3))))))))) (((TBinOp TERM.RMinus ((TUnOp TERM.RSin ((TVar "x")))) ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin ((TVar "x")))) ((TNum 3))))))))))(TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TNum 3)) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RMult ((TNum 4)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin ((TVar "x")))) ((TNum 3))))))))))))
((PrConclWithoutProof 8 8 PROOF.FNoHint))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
