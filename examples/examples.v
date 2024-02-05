From lib Require Import ExplicitName.
From lib Require Import Lang.
From lib Require Import Poly.
From lib Require Import Solver.
From lib Require Import Checker.
Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.

(*

添加对表达式进行变形的 solver (已完成) (可能需要更改文件组织结构)

添加对函数的支持 (将函数名替换为对应表达式) (已完成)

添加关于无穷的四则运算 (已完成)

添加求极限的夹逼准则 (已完成) (可能需要更改文件组织结构)

在等价无穷小变换的判断中使用 assu 的信息 (已完成) (乘除式还有些问题)

用 context 判断变量符号 (变量总在其趋向于值的邻域内)

处理 PrClaimSuffice 与 PrProveSuffice

*)

Module TestLimOperation.

(* 证明需要写冗余的步骤，见 testin12 *)

Definition t1 :=
  (TBinOp TERM.RLim 
((TInfty TERM.Positive_Infty))(TBinder TERM.LambdaB "x"
((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	((TNum 1))	((TBinOp TERM.RDiv
	((TUnOp TERM.RCos (((TVar "x" )))))	((TVar "x" ))))))	((TBinOp TERM.RPlus
	((TNum 1))	((TBinOp TERM.RDiv
	((TUnOp TERM.RSin (((TVar "x" )))))	((TVar "x" )))))))))).

Definition t2 :=
  (TBinOp TERM.RDiv
	((TBinOp TERM.RLim 
((TInfty TERM.Positive_Infty))(TBinder TERM.LambdaB "x"
(((TBinOp TERM.RPlus
	((TNum 1))	((TBinOp TERM.RDiv
	((TUnOp TERM.RCos (((TVar "x" )))))	((TVar "x" )))))))))
)	((TBinOp TERM.RLim 
((TInfty TERM.Positive_Infty))(TBinder TERM.LambdaB "x"
(((TBinOp TERM.RPlus
	((TNum 1))	((TBinOp TERM.RDiv
	((TUnOp TERM.RSin (((TVar "x" )))))	((TVar "x" ))))))))))).

Definition P := PBinPred PROP.REq t1 t2.

Compute lim_operation {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1) |} P.

End TestLimOperation.



Module TestFunctionApply.

Definition t :=
  TApply (TUnOp TERM.Deri (TVar "f")) (TNum 2).

Definition p :=
  PBinPred PROP.REq t (TNum 4).

Definition pg :=
  {| assu := ("H", PBinPred PROP.REq (TVar "f") (TBinder TERM.LambdaB "x" (TBinOp TERM.RPower (TVar "x") (TNum 2)))) :: nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1) |}.

Compute prop_deri pg p.

(* parser: 需要 parser 能够识别前提条件中的全称量词，然后在验证预处理出函数表达式 *)
(* testin13 *)

Definition function_extensionality_convertion (P : prop) : option prop :=
  match P with
  | PQuant PROP.QForall var (PBinPred PROP.REq tm1 tm2) =>
       match tm1 with
       | TApply (TVar func) (TVar var') => if VarName.eqb var var' then Some (PBinPred PROP.REq (TVar func) (TBinder TERM.LambdaB var tm2)) else None
       | _ => None
       end
  | _ => None
  end.

Definition p' := PQuant PROP.QForall "x" (PBinPred PROP.REq (TApply (TVar "f") (TVar "x")) (TBinOp TERM.RPlus (TNum 1) (TVar "x"))).

Compute function_extensionality_convertion p'.

End TestFunctionApply.

(* parser: 现在 parser 在处理指数时，需要有不必要的括号 *)
(* parser: parser 不能处理趋向于无穷 *)

Module TestSqueezeTheorem.

(* parser: parser 不能处理极限内负号 *)
(* parser: 需要根据“由极限的夹逼准则可得”这句话 parse 出 PROOF.FSqueezeTheorem *)
(* testin14 *)

Definition assumptions :=
(PBinPred PROP.RGe (TBinOp TERM.RDiv (TUnOp TERM.RSin (TVar "x")) (TVar "x")) (TUnOp TERM.RNeg (TBinOp TERM.RDiv (TNum 1) (TVar "x")))) ::
(PBinPred PROP.RLe (TBinOp TERM.RDiv (TUnOp TERM.RSin (TVar "x")) (TVar "x")) (TBinOp TERM.RDiv (TNum 1) (TVar "x"))) ::
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "x" (TUnOp TERM.RNeg (TBinOp TERM.RDiv (TNum 1) (TVar "x"))))) (TNum 0)) ::
(PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "x" (TBinOp TERM.RDiv (TNum 1) (TVar "x")))) (TNum 0)) :: nil.

Definition P :=
  PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty) (TBinder TERM.LambdaB "x" (TBinOp TERM.RDiv (TUnOp TERM.RSin (TVar "x")) (TVar "x")))) (TNum 0).

Compute squeeze_theorem {| assu := map (fun x => ("haha", x)) assumptions; concl := PBinPred PROP.REq (TNum 1) (TNum 1) |} P.

End TestSqueezeTheorem.



Module TestEquTrans.

(* parser: 需要根据某句话 parse 出 PROOF.FEquTrans h1, 比如“由h1式变形得”? *)

Definition p1 :=
  (PBinPred PROP.RGe (TBinOp TERM.RMult
	((TNum 2))	(((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "y" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPower
	((TVar "z" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2))))))))))))) (TBinOp TERM.RMult
	((TNum 3))	((TBinOp TERM.RMult
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 1))	((TNum 2)))))))	(((TBinOp TERM.RPlus
	((TVar "y" ))	((TVar "z" ))))))))).

Definition p2 :=
  (PBinPred PROP.RGe (TBinOp TERM.RDiv
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPlus
	((TVar "y" ))	((TVar "z" )))))(TBinOp TERM.RDiv
	((TBinOp TERM.RMult
	((TNum 3))	((TBinOp TERM.RPower
	((TVar "x" ))	((TNum 2))))))	((TBinOp TERM.RMult
	((TNum 2))	(((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "y" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPower
	((TVar "z" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))))))))))).

Compute equ_trans {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1) |} p1 p2.

Definition p1' := p1.

Definition p2' :=
	(PBinPred PROP.RGe (TBinOp TERM.RDiv
	(TNum 1)	((TBinOp TERM.RPlus
	((TVar "y" ))	((TVar "z" ))))) (TBinOp TERM.RDiv
	((TBinOp TERM.RMult
	((TNum 3))	((TBinOp TERM.RPower
	((TVar "x" ))	(TBinOp TERM.RDiv (TNum 1) (TNum 2))))))	((TBinOp TERM.RMult
	((TNum 2))	(((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "x" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TVar "y" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))	((TBinOp TERM.RPower
	((TVar "z" ))	(((TBinOp TERM.RDiv
	((TNum 3))	((TNum 2)))))))))))))))).

Compute equ_trans {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1) |} p1' p2'.

Definition p3 :=
  PBinPred PROP.RGe (TBinOp TERM.RPlus (TVar "x") (TNum 1)) (TBinOp TERM.RPlus (TVar "y") (TNum 1)).

Definition p4 :=
  PBinPred PROP.RGe (TVar "x") (TVar "y").

Compute equ_trans {| assu := nil; concl := PBinPred PROP.REq (TNum 1) (TNum 1) |} p3 p4.

End TestEquTrans.



Module Test1.

Definition tm1 :=
  TBinOp TERM.RSqrt (TNum 4) (TNum 16).

Definition tm2 :=
  TNum 2.

Compute term_eq_P tm1 tm2.

End Test1.

Module Test2.

Definition tm1 :=
  TBinOp TERM.RDiv (TNum 1) (TBinOp TERM.RMult (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RDiv (TVar "a") (TVar "b"))) (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RDiv (TVar "a") (TVar "b")))).

Definition tm2 :=
  TBinOp TERM.RDiv (TVar "b") (TVar "a").

Compute term_eq_R tm1 tm2.

End Test2.

Module Test3.

Definition tm1 :=
  TUnOp TERM.RSin (TBinOp TERM.RPlus (TVar "a") (TVar "b")).

Definition tm2 :=
  TUnOp TERM.RSin (TBinOp TERM.RPlus (TVar "b") (TVar "a")).

Compute term_eq_P tm1 tm2.

End Test3.


