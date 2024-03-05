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
(PBinPred PROP.REq (TVar "f")(TBinder TERM.LambdaB "x"(TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1))))) ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2))))) ((TNum 2)))))) ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 3))))) ((TNum 3))))) ))::nil. 
Module Goal001.
Definition stmt: prop :=
(PBinPred PROP.REq (TApply (TUnOp TERM.Deri (TVar "f"))(TVar "x"))(TBinOp TERM.RMult ((TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1))))) ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2))))) ((TNum 2)))))) ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 3))))) ((TNum 3)))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1)))))) ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2)))))))) ((TBinOp TERM.RDiv ((TNum 3)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 3))))))))))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 6 8 PROOF.FNoHint)(PBinPred PROP.REq (TUnOp TERM.RLn (((TApply (TVar "f")(TVar "x")))))(TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TUnOp TERM.RLn (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1))))))) ((TBinOp TERM.RMult ((TNum 2)) ((TUnOp TERM.RLn (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2))))))))))) ((TBinOp TERM.RMult ((TNum 3)) ((TUnOp TERM.RLn (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 3))))))))))))
(((PrPoseWithoutProof 9 11 (PROOF.FDeriBothTerms (Some "x" )) (PBinPred PROP.REq (TBinOp TERM.RDiv ((TApply (TUnOp TERM.Deri (TVar "f"))(TVar "x"))) ((TApply (TVar "f")(TVar "x"))))(TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1)))))) ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2)))))))) ((TBinOp TERM.RDiv ((TNum 3)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 3)))))))))
(((PrPoseWithoutProof 12 14 (PROOF.FEquTrans "___hyp2")
(PBinPred PROP.REq (TApply (TUnOp TERM.Deri (TVar "f"))(TVar "x"))(TBinOp TERM.RMult ((TApply (TVar "f")(TVar "x"))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1)))))) ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2)))))))) ((TBinOp TERM.RDiv ((TNum 3)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 3))))))))))))
((((PrPoseWithoutProof 15 17 PROOF.FNoHint)(PBinPred PROP.REq (TApply (TUnOp TERM.Deri (TVar "f"))(TVar "x"))(TBinOp TERM.RMult ((TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1))))) ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2))))) ((TNum 2)))))) ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TVar "x")) ((TNum 3))))) ((TNum 3)))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPlus ((TBinOp TERM.RDiv ((TNum 1)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 1)))))) ((TBinOp TERM.RDiv ((TNum 2)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 2)))))))) ((TBinOp TERM.RDiv ((TNum 3)) ((TBinOp TERM.RPlus ((TVar "x")) ((TNum 3))))))))))))
((PrConclWithoutProof 18 18 PROOF.FNoHint))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
