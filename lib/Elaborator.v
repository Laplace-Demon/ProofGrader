From MParser.lib Require Import Lang.
From MParser.lib Require Import Poly.

Require Import String.
Require Import ZArith.
Require Import List.
Local Open Scope Z.
Local Open Scope string.
Local Open Scope list.

(*  The step of elaboration does some static analysis for the proof tree for
  mathematical rigor and ease of handling. Current modifications are:
  
  1. Existential propositions are automatically destructed if the variable is used later.
  2. Term with free variables in an expression is added with a function header.
  3. Universal quantifiers in proof goal are introduced in advance.  *)

Fixpoint proof_destruct_exist (pr : proof) : proof :=
  match pr with
  | PrPoseWithoutProof z1 z2 PrF p1 pr1 =>
      match p1 with
      | PQuant PROP.QExists x p1' =>
          let free_vars := freely_occurs_in_proof pr1 in
          if list_in VarName.eqb free_vars x
          then PrPoseWithoutProof z1 z2 PrF p1 (PrAction z1 z2 (PROOF.AExistVar x) (proof_destruct_exist pr1))
          else PrPoseWithoutProof z1 z2 PrF p1 (proof_destruct_exist pr1)
      | _ => PrPoseWithoutProof z1 z2 PrF p1 (proof_destruct_exist pr1)
      end
  | PrPoseAndProve z1 z2 PrF p1 pr1 pr2 =>
      match p1 with
      | PQuant PROP.QExists x p1' =>
          let free_vars := freely_occurs_in_proof pr2 in
          if list_in VarName.eqb free_vars x
          then PrPoseAndProve z1 z2 PrF p1 (proof_destruct_exist pr1) (PrAction z1 z2 (PROOF.AExistVar x) (proof_destruct_exist pr2))
          else PrPoseAndProve z1 z2 PrF p1 (proof_destruct_exist pr1) (proof_destruct_exist pr2)
      | _ => PrPoseAndProve z1 z2 PrF p1 (proof_destruct_exist pr1) (proof_destruct_exist pr2)
      end
  | PrConclAndProof z1 z2 PrF pr1 => PrConclAndProof z1 z2 PrF (proof_destruct_exist pr1)
  | PrClaimSuffice z1 z2 PrB p1 pr1 => PrClaimSuffice z1 z2 PrB p1 (proof_destruct_exist pr1)
  | PrProveSuffice z1 z2 PrB p1 pr1 pr2 => PrProveSuffice z1 z2 PrB p1 (proof_destruct_exist pr1) (proof_destruct_exist pr2)
  | PrAction z1 z2 ac pr1 => PrAction z1 z2 ac (proof_destruct_exist pr1)
  | PrPosePartialProof z1 z2 pac pr1 pr2 => PrPosePartialProof z1 z2 pac (proof_destruct_exist pr1) (proof_destruct_exist pr2)
  | _ => pr
  end.

Definition term_add_funchead (binded_vars : list VarName.t) (tm : term) : term :=
  let helper := fix f (t : term) (l : list VarName.t) :=
      match l with
      | n :: l' => f (TBinder TERM.LambdaB n t) l'
      | nil => t
      end in
  let free_vars_in_term := list_no_dup VarName.eqb nil (freely_occurs_in_term tm) in
  let free_vars := list_del_dup VarName.eqb free_vars_in_term binded_vars in
  helper tm free_vars.

Fixpoint prop_add_funchead (binded_vars : list VarName.t) (P : prop) : prop :=
  match P with
  | PLongOrder o tm1 P1 => PLongOrder o (term_add_funchead binded_vars tm1) (prop_add_funchead binded_vars P1)
  | PUnPred u tm1 => PUnPred u (term_add_funchead binded_vars tm1)
  | PBinPred b tm1 tm2 => PBinPred b (term_add_funchead binded_vars tm1) (term_add_funchead binded_vars tm2)
  | PCBinPred b tm1 tm2 cont => PCBinPred b (term_add_funchead binded_vars tm1) (term_add_funchead binded_vars tm2) cont
  | PUnOp u P1 => PUnOp u (prop_add_funchead binded_vars P1)
  | PBinOp b P1 P2 => PBinOp b (prop_add_funchead binded_vars P1) (prop_add_funchead binded_vars P2)
  | PQuant q x P1 => PQuant q x (prop_add_funchead (x :: binded_vars) P1)
  end.

Fixpoint proof_add_funchead (binded_vars : list VarName.t) (concl : prop) (pr : proof) : proof :=
  match pr with
  | PrPoseWithoutProof z1 z2 PrF P1 pr1 => PrPoseWithoutProof z1 z2 PrF (prop_add_funchead binded_vars P1) (proof_add_funchead binded_vars concl pr1)
  | PrPoseAndProve z1 z2 PrF P1 pr1 pr2 => PrPoseAndProve z1 z2 PrF (prop_add_funchead binded_vars P1) (proof_add_funchead binded_vars concl pr1) (proof_add_funchead binded_vars concl pr2)
  | PrConclAndProof z1 z2 PrF pr1 => PrConclAndProof z1 z2 PrF (proof_add_funchead binded_vars concl pr1)
  | PrClaimSuffice z1 z2 PrB P1 pr1 => PrClaimSuffice z1 z2 PrB (prop_add_funchead binded_vars P1) (proof_add_funchead binded_vars concl pr1)
  | PrProveSuffice z1 z2 PrB P1 pr1 pr2 => PrProveSuffice z1 z2 PrB (prop_add_funchead binded_vars P1) (proof_add_funchead binded_vars concl pr1) (proof_add_funchead binded_vars concl pr2)
  | PrAction z1 z2 PrA pr1 =>
      let (binded_vars', concl') := match PrA with
                                    | PROOF.AIntros x | PROOF.ASet x _ => (x :: binded_vars, concl)
                                    | PROOF.AExists t =>
                                        match concl with
                                        | PQuant PROP.QExists x P =>
                                            (x :: binded_vars, subst_prop P ((x, t) :: nil))
                                        | _ => (binded_vars, concl)
                                        end
                                    | PROOF.ASuppose _ => (binded_vars, concl)
                                    | PROOF.AExistVar x => (x :: binded_vars, concl)
                                    | PROOF.ASetProp p => (list_no_dup VarName.eqb nil (app (freely_occurs_in_prop p) binded_vars), concl)
                                    end in
      PrAction z1 z2 PrA (proof_add_funchead binded_vars' concl' pr1)
  | PrPosePartialProof z1 z2 PrP pr1 pr2 =>
      let (binded_vars', concl') := match PrP with
                                    | PROOF.APoseVar x _ => (x :: binded_vars, concl)
                                    | PROOF.APoseProp _ => (binded_vars, concl)
                                    end in
      PrPosePartialProof z1 z2 PrP (proof_add_funchead binded_vars' concl' pr1) (proof_add_funchead binded_vars concl pr2)
  | _ => pr
  end.

Fixpoint goal_forall_introduction (goal : prop) : prop * (list VarName.t) :=
  match goal with
  | PQuant PROP.QForall var goal' =>
      let (goal'', varlist) := goal_forall_introduction goal' in
      (goal'', var :: varlist)
  | _ => (goal, nil)
  end.

(* the final elaboration is encapsulated into a function for easy invocation *)

Definition elaboration (pg : proof_goal) (pr : proof) : proof_goal * proof :=
  let hypos := map (fun x => snd x) pg.(assu) in
  let binded_vars_in_premise := list_no_dup VarName.eqb nil (concat (map (fun x => freely_occurs_in_prop x) hypos)) in
  let goal := pg.(concl) in
  let goal_with_funchead := prop_add_funchead binded_vars_in_premise goal in
  let (modified_goal, introduced_vars_in_goal) := goal_forall_introduction goal_with_funchead in
  ({| assu := pg.(assu) ; concl := modified_goal ; cont := pg.(cont) |}, proof_add_funchead (binded_vars_in_premise ++ introduced_vars_in_goal) goal (proof_destruct_exist pr)).