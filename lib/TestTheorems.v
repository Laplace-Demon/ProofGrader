From lib Require Import ExplicitName.
From lib Require Import Lang.

Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.

(* Definitions *)
Definition theorem : Type := (list prop_pattern) * prop_pattern.

Definition LimitDef_statement_fun_x: theorem :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPTVar "a") (TPBinder TERM.LambdaB "x" (TPApply (TPTVar "f")  (TPVar "x") ) ))  (TPTVar "b") )  :: nil,
  (PPQuant PROP.QForall "epsilon" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "epsilon")  (TPNum 0) )  (PPQuant PROP.QExists "delta" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "delta")  (TPNum 0) )  (PPQuant PROP.QForall "x" (PPBinOp PROP.CImpl (PPBinPred PROP.RLe (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "x")  (TPTVar "a") ) )  (TPVar "delta") )  (PPBinPred PROP.RLe (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "f")  (TPVar "x") )  (TPTVar "b") ) )  (TPVar "epsilon") ) ) ) ) ) ) ) ).

Definition LimitDef_statement_fun_pos_infty: theorem :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPInfty TERM.Positive_Infty) (TPBinder TERM.LambdaB "x" (TPApply (TPTVar "f")  (TPVar "x") ) ))  (TPTVar "b") )  :: nil,
  (PPQuant PROP.QForall "epsilon" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "epsilon")  (TPNum 0) )  (PPQuant PROP.QExists "M" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "M")  (TPNum 0) )  (PPQuant PROP.QForall "x" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "x")  (TPVar "M") )  (PPBinPred PROP.RLe (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "f")  (TPVar "x") )  (TPTVar "b") ) )  (TPVar "epsilon") ) ) ) ) ) ) ) ).

Definition LimitDef_statement_fun_neg_infty: theorem :=
  ((PPBinPred PROP.REq (TPBinOp TERM.RLim (TPInfty TERM.Negative_Infty) (TPBinder TERM.LambdaB "x" (TPApply (TPTVar "f")  (TPVar "x") ) ))  (TPTVar "b") )  :: nil,
  (PPQuant PROP.QForall "epsilon" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "epsilon")  (TPNum 0) )  (PPQuant PROP.QExists "M" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "M")  (TPNum 0) )  (PPQuant PROP.QForall "x" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "x")  (TPVar "M") )  (PPBinPred PROP.RLe (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "f")  (TPVar "x") )  (TPTVar "b") ) )  (TPVar "epsilon") ) ) ) ) ) ) ) ).

Definition Continuity_x0_statement: theorem :=
  ((PPBinPred PROP.ContinueOn (TPTVar "f")  (TPTVar "x_0") )  :: nil,
  (PPQuant PROP.QForall "epsilon" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "epsilon")  (TPNum 0) )  (PPQuant PROP.QExists "delta" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "delta")  (TPNum 0) )  (PPQuant PROP.QForall "x" (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "x")  (TPTVar "x_0") ) )  (TPVar "delta") )  (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPApply (TPTVar "f")  (TPVar "x") )  (TPApply (TPTVar "f")  (TPTVar "x_0") ) ) )  (TPVar "epsilon") ) ) ) ) ) ) ) ).

Definition UContinuity_statement: theorem :=
  ((PPBinPred PROP.UContinueOn (TPTVar "f")  (TPTVar "I") )  :: nil,
  (PPQuant PROP.QForall "epsilon" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "epsilon")  (TPNum 0) )  (PPQuant PROP.QExists "delta" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "delta")  (TPNum 0) )  (PPQuant PROP.QForall "x1" (PPBinOp PROP.CImpl (PPBinPred PROP.In (TPVar "x1")  (TPTVar "I") )  (PPQuant PROP.QForall "x2" (PPBinOp PROP.CImpl (PPBinPred PROP.In (TPVar "x2")  (TPTVar "I") )  (PPBinOp PROP.CImpl (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "x1")  (TPVar "x2") ) )  (TPVar "delta") )  (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPApply (TPTVar "f")  (TPBinOp TERM.RMinus (TPVar "x1")  (TPApply (TPTVar "f")  (TPVar "x2") ) ) ) )  (TPVar "epsilon") ) ) ) ) ) ) ) ) ) ) ).

Definition Supremum_statement_fun_epsilon_delta: theorem :=
  ((PPBinPred PROP.REq (TPTVar "M")  (TPUnOp TERM.RSup (TPTVar "f") ) )  :: nil,
  (PPQuant PROP.QForall "epsilon" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "epsilon")  (TPNum 0) )  (PPQuant PROP.QExists "n" (PPBinPred PROP.RGt (TPApply (TPTVar "f")  (TPVar "n") )  (TPBinOp TERM.RMinus (TPTVar "M")  (TPVar "epsilon") ) ) ) ) ) ).

Definition UpperBound_statement_fun: theorem :=
  ((PPBinPred PROP.BoundedAboveBy (TPTVar "f")  (TPTVar "A") )  :: nil,
  (PPQuant PROP.QForall "n" (PPBinPred PROP.RLt (TPApply (TPTVar "f")  (TPVar "n") )  (TPTVar "A") ) ) ).

Definition MonoInc_statement: theorem :=
  ((PPUnPred PROP.MonoInc (TPTVar "f") )  :: nil,
  (PPQuant PROP.QForall "a" (PPQuant PROP.QForall "b" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "a")  (TPVar "b") )  (PPBinPred PROP.RGt (TPApply (TPTVar "f")  (TPVar "a") )  (TPApply (TPTVar "f")  (TPVar "b") ) ) ) ) ) ).

Definition CauchySeq_statement: theorem :=
  ((PPUnPred PROP.CauchySeq (TPTVar "a") )  :: nil,
  (PPQuant PROP.QForall "epsilon" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "epsilon")  (TPNum 0) )  (PPQuant PROP.QExists "N" (PPQuant PROP.QForall "n" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "n")  (TPVar "N") )  (PPQuant PROP.QForall "m" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "m")  (TPVar "N") )  (PPBinPred PROP.RLt (TPUnOp TERM.RAbs (TPBinOp TERM.RMinus (TPVar "a_n")  (TPVar "a_m") ) )  (TPVar "epsilon") ) ) ) ) ) ) ) ) ).

Definition SupremumAndInfimum_theorem: theorem :=
  ((PPUnPred PROP.BoundedAbove (TPTVar "f") )  :: nil,
  (PPQuant PROP.QExists "A" (PPBinPred PROP.REq (TPVar "A")  (TPUnOp TERM.RSup (TPTVar "f") ) ) ) ).

Definition causal_inference_monoinc: theorem :=
  ((PPUnPred PROP.MonoInc (TPTVar "a") )  :: nil,
  (PPQuant PROP.QForall "x" (PPQuant PROP.QForall "y" (PPBinOp PROP.CImpl (PPBinPred PROP.RGt (TPVar "x")  (TPVar "y") )  (PPBinPred PROP.RGt (TPVar "a_x")  (TPVar "a_y") ) ) ) ) ).

Definition causal_inference_boundedaboveby: theorem :=
  ((PPBinPred PROP.BoundedAboveBy (TPTVar "a")  (TPTVar "A") )  :: nil,
  (PPQuant PROP.QForall "n" (PPBinPred PROP.RLe (TPVar "a_n")  (TPTVar "A") ) ) ).

Definition causal_inference_cauchyseqbound: theorem :=
  ((PPUnPred PROP.CauchySeq (TPTVar "a") )  :: nil,
  (PPUnPred PROP.Bounded (TPTVar "a") ) ).

