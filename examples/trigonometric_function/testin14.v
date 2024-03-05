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
(PQuant PROP.QForall "a" (PBinPred PROP.REq (TBinOp TERM.RMult ((TBinOp TERM.RMult ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))))(TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))) ((TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TVar "a")))) ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3))))))))))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 4 4 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))))))) (PBinPred PROP.REq (TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))))))) ((TNum 2)))(TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))) ((TNum 2))))))
((((PrPoseWithoutProof 5 5 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))))) (PBinPred PROP.REq (TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))))) ((TNum 2)))(TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))) ((TNum 2))))))
((((PrPoseWithoutProof 6 6 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))))) (PBinPred PROP.REq (TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TBinOp TERM.RMult ((TNum 2)) ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))))) ((TNum 2)))(TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TVar "a")))) ((TNum 2))))))
((((PrPoseWithoutProof 7 7 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))) ((TNum 2)))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) (((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2))))))))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 2)))) (((TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))) ((TNum 2))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))) (((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2))))))))))) (PBinPred PROP.REq (TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))) (((TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TVar "a")))) ((TNum 2))))))(TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TVar "a")))) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3))))))))))))))))
(((PrPoseWithoutProof 8 8 (PROOF.FEquTrans "___hyp6")
(PBinPred PROP.REq (TBinOp TERM.RMult ((TBinOp TERM.RMult ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 2)))))))))) ((TUnOp TERM.RCos ((TBinOp TERM.RDiv ((TVar "a")) ((TNum 2)))))))(TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))) ((TBinOp TERM.RDiv ((TUnOp TERM.RSin ((TVar "a")))) ((TUnOp TERM.RSin ((TBinOp TERM.RDiv ((TVar "a")) ((TBinOp TERM.RPower ((TNum 2)) ((TNum 3)))))))))))))
((PrConclWithoutProof 9 9 PROOF.FNoHint))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
