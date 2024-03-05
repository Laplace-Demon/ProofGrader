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
(PQuant PROP.QForall "x" (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 5)) ((TVar "x"))))))) ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))))) ((TBinOp TERM.RDiv ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TUnOp TERM.RSin ((TVar "x")))))))(TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TNum 2)))) ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TUnOp TERM.RSin ((TVar "x"))))))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 5)) ((TVar "x"))))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RPlus (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))) (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))))) ((TUnOp TERM.RSin (((TBinOp TERM.RMinus (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))) (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TUnOp TERM.RCos (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))))) ((TBinOp TERM.RMult ((TUnOp TERM.RCos (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TUnOp TERM.RCos (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))))) ((TBinOp TERM.RMult ((TUnOp TERM.RCos (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TNum 2)))) ((TBinOp TERM.RPower ((TUnOp TERM.RCos (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2)))) ((TBinOp TERM.RPower ((TUnOp TERM.RCos (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TNum 2)))))))) (PBinPred PROP.REq (TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TNum 2)))) (((TBinOp TERM.RMinus ((TNum 1)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2)))) (((TBinOp TERM.RMinus ((TNum 1)) ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TNum 2))))))))))(TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TNum 2)))) ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2))))))))))))))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 5)) ((TVar "x"))))))) ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))))) ((TBinOp TERM.RDiv ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TUnOp TERM.RSin ((TVar "x")))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 5)) ((TVar "x"))))))) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2)))))) ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TUnOp TERM.RSin ((TVar "x")))))))) (PBinPred PROP.REq (TBinOp TERM.RDiv ((TBinOp TERM.RPlus (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TNum 2)))) ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TNum 2))))))) ((TBinOp TERM.RPower (((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))) ((TNum 2)))))) ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TUnOp TERM.RSin ((TVar "x")))))))(TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 3)) ((TVar "x"))))))) ((TNum 2)))) ((TBinOp TERM.RMult ((TUnOp TERM.RSin (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x"))))))) ((TUnOp TERM.RSin ((TVar "x"))))))))))))
((PrConclWithoutProof 6 6 PROOF.FNoHint))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
