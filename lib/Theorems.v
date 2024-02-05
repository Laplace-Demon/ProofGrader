From lib Require Import ExplicitName.
From lib Require Import Lang.

Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.

(* The database for definitions, theorems and properties *)

(* Definitions *)
Definition definition : Type := prop_pattern * prop_pattern.

Module Definitions.

Definition SG_Average_statement: term_pattern * term_pattern :=
  (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "y"),
   TPBinOp TERM.RDiv
     (TPBinOp TERM.RPlus
       (TPBinOp TERM.RMult (TPTVar "x") (TPTVar "x"))
       (TPBinOp TERM.RMult (TPTVar "y") (TPTVar "y")))
     (TPNum 2)).

Definition SG_Average_definitions := SG_Average_statement :: nil.

Definition LimitDef_statement: definition :=
  (PPBinPred PROP.REq (TPUnOp TERM.SeqLimit (TPTVar "x")) (TPTVar "y"),
   PPQuant PROP.QForall "eps"
     (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
       (PPQuant PROP.QExists "N"
         (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
             (PPBinPred PROP.RLe
               (TPUnOp TERM.RAbs
                 (TPBinOp TERM.RMinus (TPApply (TPTVar "x") (TPVar "n")) (TPTVar "y")))
               (TPVar "eps"))))))).

Definition LimitDef_statement_2: definition :=
  (PPBinPred PROP.REq (TPUnOp TERM.SeqLimit (TPTVar "x")) (TPTVar "y"),
   PPQuant PROP.QForall "eps"
     (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
       (PPQuant PROP.QExists "N"
         (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
             (PPLongOrder PROP.RLe (TPBinOp TERM.RMinus (TPTVar "y")(TPVar "eps"))
             (PPBinPred PROP.RLe
             (TPBinOp TERM.RMinus (TPApply (TPTVar "x") (TPVar "n")) (TPTVar "y")) 
               (TPBinOp TERM.RPlus (TPTVar "y")(TPVar "eps"))))))))).

(* 数列的极限 *)
Definition LimitDef_statement_array_1: definition :=
  (PPBinPred PROP.REq (TPBinOp TERM.RLim (TPInfty TERM.Positive_Infty) (TPBinder TERM.LambdaB "n" (TPApply (TPTVar "a") (TPVar "n")))) (TPTVar "A"),
  PPQuant PROP.QForall "epsilon"
  (PPBinOp PROP.CImpl
     (PPBinPred PROP.RGt (TPVar "epsilon") (TPNum 0))
     (PPQuant PROP.QExists "N"
        (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl
              (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
                 (PPBinPred PROP.RLt
                    (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "a") (TPVar "n")) (TPTVar "A")))
                      (TPVar "epsilon"))))))).

Definition LimitDef_statement_array_2: definition :=
  (PPBinPred PROP.REq (TPBinOp TERM.RLim (TPInfty TERM.Positive_Infty) (TPBinder TERM.LambdaB "n" (TPApply (TPTVar "a") (TPVar "n")))) (TPTVar "A"),
  PPQuant PROP.QForall "epsilon"
  (PPBinOp PROP.CImpl
     (PPBinPred PROP.RGt (TPVar "epsilon") (TPNum 0))
     (PPQuant PROP.QExists "N"
        (PPQuant PROP.QForall "n"
           (PPBinOp PROP.CImpl
              (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
                 (PPLongOrder PROP.RLt
                    (TPBinOp TERM.RMinus (TPTVar "A") (TPVar "epsilon"))
                       (PPBinPred PROP.RLt (TPApply (TPTVar "a") (TPVar "n"))
                          (TPBinOp TERM.RPlus (TPTVar "A") (TPVar "epsilon"))))))))).

(*函数在某点的极限*)
Definition LimitDef_statement_fun_x: definition :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "x0") ((TPTVar "fx"))) (TPTVar "y")),
  PPQuant PROP.QForall "eps"
    (PPBinOp PROP.CImpl  (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
      (PPQuant PROP.QExists "delta"
       (PPQuant PROP.QForall "m"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "m")(TPTVar "x0"))) (TPVar "delta"))
         (PPBinPred PROP.RLt
           (TPUnOp TERM.RAbs
           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "m")) (TPTVar "y"))) 
           (TPVar "eps"))) )))).

(*函数在正无穷的极限*)
Definition LimitDef_statement_fun_pos_infty: definition :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "x0") ((TPTVar "fx"))) (TPTVar "y")),
  PPQuant PROP.QForall "eps"
    (PPBinOp PROP.CImpl  (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
      (PPQuant PROP.QExists "M"
       (PPQuant PROP.QForall "m"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "m") (TPVar "M"))
         (PPBinPred PROP.RLe
           (TPUnOp TERM.RAbs
           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "m")) (TPTVar "y"))) 
           (TPVar "eps"))) )))).

(*函数在负无穷处的极限*)
Definition LimitDef_statement_fun_neg_infty: definition :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "x0") (TPBinder TERM.LambdaB "x" (TPTVar "fx"))) (TPTVar "y")),
  PPQuant PROP.QForall "eps"
    (PPBinOp PROP.CImpl  (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
      (PPQuant PROP.QExists "M"
       (PPQuant PROP.QForall "m"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPVar "m") (TPVar "M"))
         (PPBinPred PROP.RLe
           (TPUnOp TERM.RAbs
           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "m")) (TPTVar "y"))) 
           (TPVar "eps"))) )))).

Definition LimitDef_statement_fun_infty: definition :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "x0") (TPBinder TERM.LambdaB "x" (TPTVar "fx"))) (TPTVar "y")),
  PPQuant PROP.QForall "eps"
    (PPBinOp PROP.CImpl  (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
      (PPQuant PROP.QExists "M"
       (PPQuant PROP.QForall "m"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPUnOp TERM.RAbs (TPVar "m")) (TPVar "M"))
         (PPBinPred PROP.RLe
           (TPUnOp TERM.RAbs
           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "m")) (TPTVar "y"))) 
           (TPVar "eps"))) )))).

Definition SeqLimit_definitions := LimitDef_statement_array_1 :: LimitDef_statement_array_2 :: LimitDef_statement :: LimitDef_statement_2 :: LimitDef_statement_fun_x :: LimitDef_statement_fun_pos_infty :: LimitDef_statement_fun_neg_infty :: LimitDef_statement_fun_infty :: nil.

Definition Continuity_x0_statement: definition := 
    (PPBinPred PROP.ContinueOn (TPTVar "fx") (TPVar "x0"),
     PPQuant PROP.QForall "eps"
       (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
         (PPQuant PROP.QExists "delta"
           (PPQuant PROP.QForall "x" 
             (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "x")(TPVar "x0"))) (TPVar "delta"))
              (PPBinPred PROP.RLt
                (TPUnOp TERM.RAbs
                (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "x")) (TPApply (TPTVar "fx") (TPVar "x0")))) 
                (TPVar "eps"))))))).

Definition Continuity_definitions := Continuity_x0_statement :: nil.

Definition UContinuity_statement: definition := 
    (PPBinPred PROP.UContinueOn (TPTVar "fx") (TPTVar "I"),
     PPQuant PROP.QForall "eps"
       (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
         (PPQuant PROP.QExists "delta"
           (PPQuant PROP.QForall "x1" 
              (PPQuant PROP.QForall "x2"
                 (PPBinOp PROP.CImpl (PPBinPred PROP.In (TPVar "x1") (TPTVar "I")) 
                   (PPBinOp PROP.CImpl (PPBinPred PROP.In (TPVar "x2") (TPTVar "I"))
                     (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "x1")(TPVar "x2"))) (TPVar "delta"))
                       (PPBinPred PROP.RLt
                         (TPUnOp TERM.RAbs
                           (TPBinOp TERM.RMinus (TPApply (TPTVar "fx") (TPVar "x1")) (TPApply (TPTVar "fx") (TPVar "x2")))) 
                             (TPVar "eps")))))))))).

Definition UContinuity_definitions := UContinuity_statement :: nil.

Definition Supremum_statement_fun_epsilon_delta: definition := 
    (PPBinPred PROP.REq (TPUnOp TERM.RSup (TPTVar "f")) (TPTVar "M"),
    PPQuant PROP.QForall "eps"
      (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
        (PPQuant PROP.QExists "n"
          (PPLongOrder PROP.RLt (TPBinOp TERM.RMinus (TPTVar "M") (TPVar "eps"))
            (PPBinPred PROP.RLe (TPApply (TPTVar "f") (TPVar "n")) (TPTVar "M")))))).

Definition Supremum_statement_adapted_to_example: definition := 
    (PPBinPred PROP.REq (TPTVar "M") (TPUnOp TERM.RSup (TPTVar "f")),
    PPQuant PROP.QForall "eps"
      (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "eps") (TPNum 0))
        (PPQuant PROP.QExists "n"
          (PPBinPred PROP.RGt (TPApply (TPTVar "f") (TPVar "n"))
            (TPBinOp TERM.RMinus (TPTVar "M") (TPVar "eps")))))).

Definition Supremum_definitions := Supremum_statement_fun_epsilon_delta :: Supremum_statement_adapted_to_example :: nil.

Definition Infimum_definitions : list definition := nil.

Definition UpperBound_statement_fun: definition :=
  (PPBinPred PROP.BoundedAboveBy (TPTVar "f") (TPTVar "A"),
  PPQuant PROP.QForall "n"
    (PPBinPred PROP.RLt (TPApply (TPTVar "f") (TPVar "n")) (TPTVar "A"))).

Definition UpperBound_definitions := UpperBound_statement_fun :: nil.

Definition LowerBound_definitions : list definition :=  nil.

Definition MonoInc_statement: definition :=
    (PPUnPred PROP.MonoInc (TPTVar "f"),
    PPQuant PROP.QForall "a"
      (PPQuant PROP.QForall "b"
        (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "a") (TPVar "b"))
          (PPBinPred PROP.RGt (TPApply (TPTVar "f") (TPVar "a")) (TPApply (TPTVar "f") (TPVar "b")))))).

Definition MonoInc_definitions := MonoInc_statement :: nil.

Definition MonoDec_definitions : list definition := nil.

Definition SMonoInc_definitions : list definition := nil.

Definition SMonoDec_definitions : list definition := nil.

Definition CauchySeq_statement: definition :=
    (PPUnPred PROP.CauchySeq (TPTVar "a"),
    PPQuant PROP.QForall "epsilon"
      (PPQuant PROP.QExists "N"
        (PPQuant PROP.QForall "n"
          (PPQuant PROP.QForall "m"
            (PPBinOp PROP.CImpl
              (PPBinPred PROP.RGt (TPVar "n") (TPVar "N"))
                (PPBinOp PROP.CImpl
                  (PPBinPred PROP.RGt (TPVar "m") (TPVar "N"))
                    (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "a") (TPVar "n")) (TPApply (TPTVar "a") (TPVar "m")))) (TPVar "epsilon")))))))).

Definition CauchySeq_definitions : list definition := CauchySeq_statement :: nil.

Definition all_definitions := SeqLimit_definitions ++ Continuity_definitions ++ UContinuity_definitions ++ Supremum_definitions ++ Infimum_definitions ++ UpperBound_definitions ++ LowerBound_definitions ++ MonoInc_definitions ++ MonoDec_definitions ++ SMonoInc_definitions ++ SMonoDec_definitions ++ CauchySeq_definitions.

End Definitions.

(* Theorems *)
Definition theorem: Type:= (list prop_pattern) * prop_pattern.

Module Theorems.

Definition SupremumAndInfimum_theorem: theorem :=
  ((PPUnPred PROP.BoundedAbove (TPTVar "f")) :: nil,
  PPQuant PROP.QExists "A"
    (PPBinPred PROP.REq (TPVar "A") (TPUnOp TERM.RSup (TPTVar "f")))).

Definition BolzanoWeierstrass_theorem: theorem :=
  (PPUnPred PROP.Bounded (TPTVar "a") :: nil,
  PPQuant PROP.QExists "phi" (PPBinOp PROP.CAnd
    (PPBinPred PROP.IsSubseq (TPBinder TERM.LambdaB "k" (TPApply (TPTVar "a") (TPApply (TPVar "phi") (TPVar "k")))) (TPTVar "a"))
      (PPUnPred PROP.Convergent (TPBinder TERM.LambdaB "k" (TPApply (TPTVar "a") (TPApply (TPVar "phi") (TPVar "k"))))))).

Definition SupremumAndInfimum_theorems:= SupremumAndInfimum_theorem :: nil.

Definition BolzanoWeierstrass_theorems:= BolzanoWeierstrass_theorem :: nil.

End Theorems.

(* Causes and consequences *)

Module CausalInference.

Definition causal_inference_monoinc := (PPUnPred PROP.MonoInc (TPTVar "a"), (PPQuant PROP.QForall "x" (PPQuant PROP.QForall "y" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "x") (TPVar "y")) (PPBinPred PROP.RGt (TPApply (TPTVar "a") (TPVar "x")) (TPApply (TPTVar "a") (TPVar "y"))))))).

Definition causal_inference_boundedaboveby := (PPBinPred PROP.BoundedAboveBy (TPTVar "a") (TPTVar "A"), PPQuant PROP.QForall "n" (PPBinPred PROP.RLt (TPApply (TPTVar "a") (TPVar "n")) (TPTVar "A"))).

Definition causal_inference_cauchyseqbound := (PPUnPred PROP.CauchySeq (TPTVar "a"), PPUnPred PROP.Bounded (TPTVar "a")).

Definition causal_inference_rules : list (prop_pattern * prop_pattern) := causal_inference_monoinc :: causal_inference_boundedaboveby :: causal_inference_cauchyseqbound :: Definitions.all_definitions.

End CausalInference.

(* Properties *)
Definition property : Type := prop_pattern * prop_pattern.

Module Properties.

Definition CauchySeqIsBounded: property :=
  (PPUnPred PROP.CauchySeq (TPTVar "a"),
   PPUnPred PROP.Bounded (TPTVar "a")).

Definition CauchySeqProperties := CauchySeqIsBounded :: nil.

End Properties.