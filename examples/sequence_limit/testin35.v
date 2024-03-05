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
(PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TVar "x")) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RPower (((TUnOp TERM.RSin ((TVar "x"))))) ((TNum 2)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TNum 1))))) (((TBinOp TERM.RMinus ((TNum 1)) ((TUnOp TERM.RCos ((TVar "x"))))))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))))))))
(TBinOp TERM.RDiv ((TNum 1)) ((TNum 6)))).
(*Proof starts here*)
Definition pr: proof :=
(((PrPoseWithoutProof 6 10 PROOF.FNoHint)(PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMinus ((TBinOp TERM.RMult ((TVar "x")) ((TUnOp TERM.RSin ((TVar "x")))))) ((TBinOp TERM.RPower (((TUnOp TERM.RSin ((TVar "x"))))) ((TNum 2)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TNum 1))))) (((TBinOp TERM.RMinus ((TNum 1)) ((TUnOp TERM.RCos ((TVar "x"))))))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TVar "x")))) (((TBinOp TERM.RMinus ((TVar "x")) ((TUnOp TERM.RSin ((TVar "x"))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TNum 1))))) (((TBinOp TERM.RMinus ((TNum 1)) ((TUnOp TERM.RCos ((TVar "x"))))))))) (((TBinOp TERM.RPlus ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TUnOp TERM.RSin ((TVar "x")))) (((TBinOp TERM.RMinus ((TVar "x")) ((TUnOp TERM.RSin ((TVar "x"))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TNum 1))))) (((TBinOp TERM.RMinus ((TNum 1)) ((TUnOp TERM.RCos ((TVar "x"))))))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x"))))) ((TNum 2)))) ((TNum 1)))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TVar "x")) (((TBinOp TERM.RMinus ((TVar "x")) ((TUnOp TERM.RSin ((TVar "x"))))))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TNum 1))))) (((TBinOp TERM.RMinus ((TNum 1)) ((TUnOp TERM.RCos ((TVar "x"))))))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x"))))) ((TNum 2)))) ((TNum 1)))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TNum 6)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult (((TBinOp TERM.RMinus ((TBinOp TERM.RPower ((TConst TERM.RE)) ((TVar "x")))) ((TNum 1))))) (((TBinOp TERM.RMinus ((TNum 1)) ((TUnOp TERM.RCos ((TVar "x"))))))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x"))))) ((TNum 2)))) ((TNum 1)))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TNum 6)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TVar "x")) (((TBinOp TERM.RMinus ((TNum 1)) ((TUnOp TERM.RCos ((TVar "x"))))))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x"))))) ((TNum 2)))) ((TNum 1)))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TNum 6)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TNum 2)))))) (((TBinOp TERM.RMinus ((TBinOp TERM.RPower (((TBinOp TERM.RPlus ((TNum 1)) ((TVar "x"))))) ((TNum 2)))) ((TNum 1)))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RMult ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 3)))) ((TNum 6)))))) ((TBinOp TERM.RMult ((TBinOp TERM.RMult ((TVar "x")) ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 2)))) ((TNum 2)))))) (((TBinOp TERM.RMult ((TNum 2)) ((TVar "x")))))))))))
) ((PLongOrder PROP.REq ((TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RDiv ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 4)))) ((TNum 6)))) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 4))))))))
) (PBinPred PROP.REq (TBinOp TERM.RLim ((TNum 0))(TBinder TERM.LambdaB "x" ((TBinOp TERM.RMult ((TBinOp TERM.RDiv ((TNum 1)) ((TNum 6)))) ((TBinOp TERM.RDiv ((TBinOp TERM.RPower ((TVar "x")) ((TNum 4)))) ((TBinOp TERM.RPower ((TVar "x")) ((TNum 4))))))))))
(TBinOp TERM.RDiv ((TNum 1)) ((TNum 6))))))))))))))))))))))
((PrConclWithoutProof 11 11 PROOF.FNoHint))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.
End Goal001.
