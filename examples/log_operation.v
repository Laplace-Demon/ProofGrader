From lib Require Import ExplicitName.
From lib Require Import Lang.
From lib Require Import Solver.
From lib Require Import Checker.
Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.

Definition goal := {| assu := nil ; concl := PBinPred PROP.REq (TNum 1) (TNum 1) |}.

(* ln a + ln b = ln a*b *)
Compute ln_simpl goal
(PBinPred PROP.REq (TBinOp TERM.RPlus (TUnOp TERM.RLn (TVar "a")) (TUnOp TERM.RLn (TVar "b")))
(TUnOp TERM.RLn (TBinOp TERM.RMult (TVar "a") (TVar "b")))).

(* ln a - ln b = ln a/b *)
Compute ln_simpl goal
(PBinPred PROP.REq (TBinOp TERM.RMinus (TUnOp TERM.RLn (TVar "a")) (TUnOp TERM.RLn (TVar "b")))
(TUnOp TERM.RLn (TBinOp TERM.RDiv (TVar "a") (TVar "b")))).

(* ln e^x = x *)
Compute ln_simpl goal
(PBinPred PROP.REq (TUnOp TERM.RLn (TBinOp TERM.RPower (TConst TERM.RE) (TVar "x")))
(TVar "x")).

(* ln x^a = a * lnx *)
Compute ln_simpl goal
(PBinPred PROP.REq (TUnOp TERM.RLn (TBinOp TERM.RPower (TVar "x") (TVar "a")))
(TBinOp TERM.RMult (TVar "a") (TUnOp TERM.RLn (TVar "x")))).

(* ln x^a + ln x^b = ln x^(a+b) *)
Compute ln_simpl goal
(PBinPred PROP.REq (TBinOp TERM.RPlus (TUnOp TERM.RLn (TBinOp TERM.RPower (TVar "x") (TVar "a"))) (TUnOp TERM.RLn (TBinOp TERM.RPower (TVar "x") (TVar "b"))))
(TUnOp TERM.RLn (TBinOp TERM.RPower (TVar "x") (TBinOp TERM.RPlus (TVar "a") (TVar "b"))))).

(* ln a^x + ln b^x = ln (a*b)^x *)
Compute ln_simpl goal
(PBinPred PROP.REq (TBinOp TERM.RPlus (TUnOp TERM.RLn (TBinOp TERM.RPower (TVar "a") (TVar "x"))) (TUnOp TERM.RLn (TBinOp TERM.RPower (TVar "b") (TVar "x"))))
(TUnOp TERM.RLn (TBinOp TERM.RPower (TBinOp TERM.RMult (TVar "a") (TVar "b")) (TVar "x")))).

(* ln 4 = 2 * ln 2 *)
Compute ln_simpl goal
(PBinPred PROP.REq (TUnOp TERM.RLn (TNum 4)) (TBinOp TERM.RMult (TNum 2) (TUnOp TERM.RLn (TNum 2)))).

(* ln 8 = 3 * ln 2 *)
Compute ln_simpl goal
(PBinPred PROP.REq (TUnOp TERM.RLn (TNum 8)) (TBinOp TERM.RMult (TNum 3) (TUnOp TERM.RLn (TNum 2)))).

(* ln 1 = 0 *)
Compute ln_simpl goal
(PBinPred PROP.REq (TUnOp TERM.RLn (TNum 1)) (TNum 0)).

(* ln sqrt(x) = 1/2 * lnx *)
Compute ln_simpl goal
(PBinPred PROP.REq (TUnOp TERM.RLn (TBinOp TERM.RSqrt (TNum 2) (TVar "x")))
(TBinOp TERM.RMult (TBinOp TERM.RDiv (TNum 1) (TNum 2)) (TUnOp TERM.RLn (TVar "x")))).

(* ln x = 2 * ln sqrt(x) *)
Compute ln_simpl goal
(PBinPred PROP.REq (TUnOp TERM.RLn (TVar "x"))
(TBinOp TERM.RMult (TNum 2) (TUnOp TERM.RLn (TBinOp TERM.RSqrt (TNum 2) (TVar "x"))))).