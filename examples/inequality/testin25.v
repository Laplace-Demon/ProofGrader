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
(PQuant PROP.QForall "a"(PQuant PROP.QForall "b"(PQuant PROP.QForall "c"(PQuant PROP.QForall "d"(PBinPred PROP.RGe (TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2))))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "d")) ((TNum 2))))))))(TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "c")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "d"))))))) ((TNum 2)))))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 5 7 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2))))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "d")) ((TNum 2))))))))) ((PLongOrder PROP.REq ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "d")) ((TNum 2)))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "d")) ((TNum 2)))))))) (PBinPred PROP.REq (TBinOp TERM.RPlus (((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TNum 2)) (((TBinOp TERM.RMult ((TVar "a")) ((TVar "c"))))))) (((TBinOp TERM.RMult ((TVar "b")) ((TVar "d"))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "d")) ((TNum 2))))))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "d")) ((TNum 2)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TNum 2)) (((TBinOp TERM.RMult ((TVar "a")) ((TVar "d"))))))) (((TBinOp TERM.RMult ((TVar "b")) ((TVar "c"))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2))))))))))(TBinOp TERM.RPlus ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "c")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "d"))))))) ((TNum 2)))) ((TBinOp TERM.RPower (((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "d")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "c"))))))) ((TNum 2))))))))))
((((PrPoseWithoutProof 8 10 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "a")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "b")) ((TNum 2))))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "c")) ((TNum 2)))) ((TBinOp TERM.RPower ((TVar "d")) ((TNum 2))))))))) (PBinPred PROP.RGe (TBinOp TERM.RPlus ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "c")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "d"))))))) ((TNum 2)))) ((TBinOp TERM.RPower (((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "d")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "c"))))))) ((TNum 2)))))(TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "c")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "d"))))))) ((TNum 2))))))
((PrConclWithoutProof 11 11 PROOF.FNoHint))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
