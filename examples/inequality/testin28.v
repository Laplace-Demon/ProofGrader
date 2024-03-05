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
(PBinPred PROP.RLt (TVar "a")(TVar "b"))::(PBinPred PROP.RGt (TVar "a")(TNum 0))::(PBinPred PROP.RGt (TVar "b")(TNum 0))::(PBinPred PROP.RGt (TVar "c")(TNum 0))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.RLt (TBinOp TERM.RDiv ((TVar "a")) ((TVar "b")))(TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TVar "a")) ((TVar "c")))) ((TBinOp TERM.RPlus ((TVar "b")) ((TVar "c")))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 9 11 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RMult ((TVar "a")) (((TBinOp TERM.RPlus ((TVar "b")) ((TVar "c"))))))) ((PLongOrder PROP.RLt ((TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))) ((TBinOp TERM.RMult ((TVar "a")) ((TVar "c")))))) (PBinPred PROP.REq (TBinOp TERM.RPlus ((TBinOp TERM.RMult ((TVar "a")) ((TVar "b")))) ((TBinOp TERM.RMult ((TVar "b")) ((TVar "c")))))(TBinOp TERM.RMult ((TVar "b")) (((TBinOp TERM.RPlus ((TVar "a")) ((TVar "c")))))))))))
((((PrPoseWithoutProof 12 14 PROOF.FNoHint)(PBinPred PROP.RGt (TBinOp TERM.RPlus ((TVar "b")) ((TVar "c")))(TNum 0)))
(((PrPoseWithoutProof 15 17 (PROOF.FEquTrans "___hyp4")
(PBinPred PROP.RLt (TBinOp TERM.RDiv ((TVar "a")) ((TVar "b")))(TBinOp TERM.RDiv ((TBinOp TERM.RPlus ((TVar "a")) ((TVar "c")))) ((TBinOp TERM.RPlus ((TVar "b")) ((TVar "c")))))))
((PrConclWithoutProof 18 18 PROOF.FNoHint))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
