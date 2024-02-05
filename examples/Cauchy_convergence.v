From lib Require Import ExplicitName.
From lib Require Import Lang.
From lib Require Import Poly.
From lib Require Import Solver.
From lib Require Import Theorems.
From lib Require Import Elaborator.
From lib Require Import Checker.
Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.

Definition premise: list prop := nil.
Module Goal001.

(*
TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))


*)

Definition stmt: prop :=
PQuant PROP.QForall "a"
(PBinOp PROP.CImpl
(PUnPred PROP.CauchySeq (TVar "a"))
(PQuant PROP.QExists "A"
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A")))).

(*Proof starts here*)
Definition pr: proof :=
PrAction 1 1 (PROOF.ASuppose (PUnPred PROP.CauchySeq (TVar "a")))
(PrPoseWithoutProof 2 2 (PROOF.FCausalInfer (PUnPred PROP.CauchySeq (TVar "a"))) (PUnPred PROP.Bounded (TVar "a"))
(PrPoseWithoutProof 3 3 (PROOF.FTheorem PROOF.BolzanoWeierstrass nil) (PQuant PROP.QExists "phi" (PBinOp PROP.CAnd (PBinPred PROP.IsSubseq (TBinder TERM.LambdaB "k" (TApply (TVar "a") (TApply (TVar "phi") (TVar "k")))) (TVar "a")) (PUnPred PROP.Convergent (TBinder TERM.LambdaB "k" (TApply (TVar "a") (TApply (TVar "phi") (TVar "k")))))))
(PrAction 4 4 (PROOF.ASetProp (PBinOp PROP.CAnd (PBinPred PROP.IsSubseq (TBinder TERM.LambdaB "k" (TApply (TVar "a") (TApply (TVar "seq_n") (TVar "k")))) (TVar "a")) (PUnPred PROP.Convergent (TBinder TERM.LambdaB "k" (TApply (TVar "a") (TApply (TVar "seq_n") (TVar "k")))))))
(PrAction 5 5 (PROOF.ASet "A" (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "k" (TApply (TVar "a") (TApply (TVar "seq_n") (TVar "k"))))))
(PrPosePartialProof 6 6 (PROOF.APoseVar "epsilon" ((PBinPred PROP.RGt (TVar "epsilon") (TNum 0)) :: nil))
(PrPoseWithoutProof 7 7 (PROOF.FCausalInfer (PUnPred PROP.CauchySeq (TVar "a"))) (PQuant PROP.QExists "N" (PQuant PROP.QForall "n" (PQuant PROP.QForall "m" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "n") (TVar "N")) (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "m") (TVar "N")) (PBinPred PROP.RLt (TUnOp TERM.RAbs (TBinOp TERM.RMinus (TApply (TVar "a") (TVar "n")) (TApply (TVar "a") (TVar "m")))) (TBinOp TERM.RDiv (TVar "epsilon") (TNum 2))))))))
(PrPoseWithoutProof 8 8 PROOF.FNoHint (PQuant PROP.QForall "k" (PBinPred PROP.RGe (TApply (TVar "seq_n") (TVar "k")) (TVar "k")))
(PrPoseWithoutProof 9 9 PROOF.FNoHint (PQuant PROP.QForall "k" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "k") (TVar "N")) (PBinPred PROP.RGt (TApply (TVar "seq_n") (TVar "k")) (TVar "N"))))
(PrPosePartialProof 10 10 (PROOF.APoseVar "n" ((PBinPred PROP.RGt (TVar "n") (TVar "N")) :: nil))
(PrPosePartialProof 11 11 (PROOF.APoseVar "k" ((PBinPred PROP.RGt (TVar "k") (TVar "N")) :: nil))
(PrPoseWithoutProof 12 12 (PROOF.FDefinition PROOF.CauchySeq) (PBinPred PROP.RLt (TUnOp TERM.RAbs (TBinOp TERM.RMinus (TApply (TVar "a") (TVar "n")) (TApply (TVar "a") (TApply (TVar "seq_n") (TVar "k"))))) (TBinOp TERM.RDiv (TVar "epsilon") (TNum 2)))
(PrPoseWithoutProof 13 13 (PROOF.FTakeLimOnBothTerms "k" (TInfty TERM.Positive_Infty)) (PLongOrder PROP.RLe (TUnOp TERM.RAbs (TBinOp TERM.RMinus (TApply (TVar "a") (TVar "n")) (TVar "A"))) (PBinPred PROP.RLt (TBinOp TERM.RDiv (TVar "epsilon") (TNum 2)) (TVar "epsilon")))
PrEndPartialProof))
PrEndPartialProof)
PrEndPartialProof))))
(PrPoseWithoutProof 14 14 (PROOF.FDefinition PROOF.SeqLimit) (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n")))) (TVar "A"))
(PrConclWithoutProof 15 15 PROOF.FNoHint))))))).



Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil |}.
Definition temp := elaboration pg pr .
Definition pg' := fst temp.
Definition pr':= snd temp.
Definition check_result := check_rec' pg' pr'.
Compute check_result.

Definition check_result' := check_rec'_show_pg pg' pr' 12.
Compute check_result'.

Definition current_pg :=
    {|
         assu :=
           [("___hyp11",
           (PBinPred PROP.RGt (TVar "n") (TVar "N")));
           ("___hyp10",
           (PBinPred PROP.RGt (TVar "k") (TVar "N")));
            ("___hyp9",
             PQuant PROP.QForall "k"
               (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "k") (TVar "N"))
                  (PBinPred PROP.RGt (TApply (TVar "seq_n") (TVar "k"))
                     (TVar "N"))));
            ("___hyp8",
             PQuant PROP.QForall "k"
               (PBinPred PROP.RGe (TApply (TVar "seq_n") (TVar "k"))
                  (TVar "k")));
            ("___hyp7",
             PQuant PROP.QForall "epsilon"
               (PBinOp PROP.CImpl
                  (PBinPred PROP.RGt (TVar "epsilon") (TNum 0))
                  (PQuant PROP.QExists "N"
                     (PQuant PROP.QForall "n"
                        (PQuant PROP.QForall "m"
                           (PBinOp PROP.CImpl
                              (PBinPred PROP.RGt (TVar "n") (TVar "N"))
                              (PBinOp PROP.CImpl
                                 (PBinPred PROP.RGt (TVar "m") (TVar "N"))
                                 (PBinPred PROP.RLt
                                    (TUnOp TERM.RAbs
                                       (TBinOp TERM.RMinus
                                          (TApply (TVar "a") (TVar "n"))
                                          (TApply (TVar "a") (TVar "m"))))
                                    (TBinOp TERM.RDiv 
                                       (TVar "epsilon") 
                                       (TNum 2))))))))));
            ("___hyp6",
             PQuant PROP.QForall "epsilon"
               (PBinOp PROP.CImpl
                  (PBinPred PROP.RGt (TVar "epsilon") (TNum 0))
                  (PQuant PROP.QExists "N"
                     (PQuant PROP.QExists "N"
                        (PQuant PROP.QForall "n"
                           (PQuant PROP.QForall "m"
                              (PBinOp PROP.CImpl
                                 (PBinPred PROP.RGt (TVar "n") (TVar "N"))
                                 (PBinOp PROP.CImpl
                                    (PBinPred PROP.RGt (TVar "m") (TVar "N"))
                                    (PBinPred PROP.RLt
                                       (TUnOp TERM.RAbs
                                          (TBinOp TERM.RMinus
                                             (TApply (TVar "a") (TVar "n"))
                                             (TApply (TVar "a") (TVar "m"))))
                                       (TBinOp TERM.RDiv 
                                          (TVar "epsilon") 
                                          (TNum 2)))))))))));
            ("___hyp4",
             PBinPred PROP.REq (TVar "A")
               (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)
                  (TBinder TERM.LambdaB "k"
                     (TApply (TVar "a") (TApply (TVar "seq_n") (TVar "k"))))));
            ("___hyp3",
             PBinOp PROP.CAnd
               (PBinPred PROP.IsSubseq
                  (TBinder TERM.LambdaB "k"
                     (TApply (TVar "a") (TApply (TVar "seq_n") (TVar "k"))))
                  (TVar "a"))
               (PUnPred PROP.Convergent
                  (TBinder TERM.LambdaB "k"
                     (TApply (TVar "a") (TApply (TVar "seq_n") (TVar "k"))))));
            ("___hyp2",
             PQuant PROP.QExists "phi"
               (PBinOp PROP.CAnd
                  (PBinPred PROP.IsSubseq
                     (TBinder TERM.LambdaB "k"
                        (TApply (TVar "a") (TApply (TVar "phi") (TVar "k"))))
                     (TVar "a"))
                  (PUnPred PROP.Convergent
                     (TBinder TERM.LambdaB "k"
                        (TApply (TVar "a") (TApply (TVar "phi") (TVar "k")))))));
            ("___hyp1", PUnPred PROP.Bounded (TVar "a"));
            ("___hyp0", PUnPred PROP.CauchySeq (TVar "a"))];
         concl :=
           PQuant PROP.QExists "A"
             (PBinPred PROP.REq
                (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)
                   (TBinder TERM.LambdaB "n" (TApply (TVar "a") (TVar "n"))))
                (TVar "A"));
         cont := []
       |}.

Definition definition_match (pg: proof_goal) (pending: prop) (def: definition) :=
  let (left_pattern, right_pattern) := def in
  (right_pattern, pending).

Compute definition_match current_pg
(PBinPred PROP.RLt (TUnOp TERM.RAbs (TBinOp TERM.RMinus (TApply (TVar "a") (TVar "n")) (TApply (TVar "a") (TApply (TVar "seq_n") (TVar "k"))))) (TBinOp TERM.RDiv (TVar "epsilon") (TNum 2)))
Definitions.CauchySeq_statement.



End Goal001.
