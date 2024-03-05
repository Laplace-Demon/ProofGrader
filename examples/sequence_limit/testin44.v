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
(PQuant PROP.QForall "a" (PQuant PROP.QForall "b" (PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "a"))(PBinOp PROP.CImpl (PUnPred PROP.Convergent (TVar "b"))(PBinOp PROP.CImpl (PQuant PROP.QForall "n" (PBinPred PROP.RLt (TApply (TVar "a" ) (TVar "n" ))(TApply (TVar "b" ) (TVar "n" ))))(PBinPred PROP.RLe (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
)))))).
(*Proof starts here*)
Definition pr: proof :=
((PrAction 4 4(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "a"))))
)
(((PrAction 5 5(PROOF.ASuppose ((PUnPred PROP.Convergent (TVar "b"))))
)
(((PrAction 6 6(PROOF.ASuppose ((PQuant PROP.QForall "n" (PBinPred PROP.RLt (TApply (TVar "a" ) (TVar "n" ))(TApply (TVar "b" ) (TVar "n" ))))))
)
(((PrPoseWithoutProof 7 7 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "la" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TVar "la"))))
(((PrPoseWithoutProof 8 8 (PROOF.FDefinition PROOF.SeqConvergence) 
(PQuant PROP.QExists "lb" (PBinPred PROP.REq (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
(TVar "lb"))))
(PrPosePartialProof 9 16 (PROOF.APoseVar "epss" ((PBinPred PROP.RGt (TVar "epss")(TNum 0))::nil))((PrPoseWithoutProof 9 11 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Na" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Na"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "a" ) (TVar "n" ))) ((TVar "la")))))(TVar "epss"))))))
(((PrPoseWithoutProof 12 12 (PROOF.FDefinition PROOF.SeqLimit) 
(PQuant PROP.QExists "Nb" (PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Nb"))(PBinPred PROP.RLt  (TUnOp TERM.RAbs ((TBinOp TERM.RMinus ((TApply (TVar "b" ) (TVar "n" ))) ((TVar "lb")))))(TVar "epss"))))))
((((PrPoseWithoutProof 13 13 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Na"))(PBinPred PROP.RGt (TApply (TVar "a" ) (TVar "n" ))(TBinOp TERM.RMinus ((TVar "la")) ((TVar "epss")))))))
((((PrPoseWithoutProof 14 14 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TVar "Nb"))(PBinPred PROP.RGt (TApply (TVar "b" ) (TVar "n" ))(TBinOp TERM.RPlus ((TVar "lb")) ((TVar "epss")))))))
(((PrPoseWithoutProof 15 15 PROOF.FNoHint)(PQuant PROP.QForall "n" (PBinOp PROP.CImpl (PBinPred PROP.RGe (TVar "n")(TBinOp TERM.RMax ((TVar "Na"))((TVar "Nb"))))(PLongOrder PROP.RLt ((TBinOp TERM.RMinus ((TVar "la")) ((TVar "epss")))) ((PLongOrder PROP.RLt ((TApply (TVar "a" ) (TVar "n" ))) (PBinPred PROP.RLt (TApply (TVar "b" ) (TVar "n" ))(TBinOp TERM.RPlus ((TVar "lb")) ((TVar "epss")))))))))(PrEndPartialProof))))))))))
(((PrPoseWithoutProof 17 17 PROOF.FNoHint)(PQuant PROP.QForall "epss" (PBinOp PROP.CImpl (PBinPred PROP.RGt (TVar "epss")(TNum 0))(PBinPred PROP.RLt (TBinOp TERM.RMinus ((TVar "la")) ((TVar "epss")))(TBinOp TERM.RPlus ((TVar "lb")) ((TVar "epss")))))))
((((PrPoseWithoutProof 18 18 PROOF.FNoHint)(PBinPred PROP.RLe (TVar "la")(TVar "lb")))
((((PrPoseWithoutProof 19 19 PROOF.FNoHint)(PBinPred PROP.RLe (TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "a" ) (TVar "n" )))))
(TBinOp TERM.RLim (TInfty TERM.Positive_Infty)(TBinder TERM.LambdaB "n" ((TApply (TVar "b" ) (TVar "n" )))))
))
((PrConclWithoutProof 20 20 PROOF.FNoHint))))))))))))))))).


Definition assum := get_assum premise nil.
Definition pg := {| assu := assum; concl := stmt; cont := nil|}.
Definition temp := elaboration pg pr.
Definition pg' := fst temp.
Definition pr' := snd temp.
Definition check_result := fst (check_rec' pg' pr').
Compute check_result.

Fixpoint check_rec'_show_pg (pg : proof_goal) (pr : proof) (fuel : nat) : proof_goal :=
  match fuel with
  | O => pg
  | S fuel' =>
  match pr with
  | PrPoseWithoutProof z1 z2 PROOF.FNoHint P pr0 =>
      let (list_of_result, list_of_subconcl) := check_prop P pg 1000 in
      let list_of_result_with_line := list_with_line z1 z2 list_of_result in
      match proof_goal_add_subconcl list_of_subconcl pg.(assu) with
      | Some list_of_subconcl_with_name =>
          let pg' := (check_rec'_show_pg {| assu := app list_of_subconcl_with_name pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0) fuel' in
          pg'
      | None => pg
      end 
  
    | PrPoseWithoutProof z1 z2 _ P pr0 =>
      match SYMBOLIC_CHECKER.new_hyp_name pg.(assu) "___hyp" with
      | Some h =>
          match P with
          | PLongOrder _ _ _ =>
              match SYMBOLIC_CHECKER.LongOrder_deduction P with
              | Some (o, props, tm1, tm2) =>
                  let pg' := (check_rec'_show_pg {| assu := (h, PBinPred o tm1 tm2) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 fuel') in
                  pg'
              | None => pg
              end
          | _ =>
              let pg' := (check_rec'_show_pg {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 fuel') in
              pg'
          end   
      | None => pg
      end

  | PrPoseAndProve z1 z2 PROOF.FNoHint P pr1 pr0 =>
      match SYMBOLIC_CHECKER.new_hyp_name pg.(assu) "___hyp" with
      | Some h =>
          let pg' :=  check_rec'_show_pg {| assu := pg.(assu); concl := P; cont := pg.(cont) |} pr1 fuel' in
          let pg'' := check_rec'_show_pg {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 fuel' in
          pg'
      | None => pg
      end
  | PrPoseAndProve z1 z2 _ P pr1 pr0 => (* 感觉写的不太对 *)
        match SYMBOLIC_CHECKER.new_hyp_name pg.(assu) "___hyp" with
        | Some h =>
            let pg' := check_rec'_show_pg {| assu := (h, P) :: pg.(assu); concl := pg.(concl); cont := pg.(cont) |} pr0 fuel' in
            pg'
        | None => pg
        end
  | PrConclAndProof z1 z2 PrF pr0 =>
      match check_fwd_proof pg PrF pg.(concl) with
      | Some (Q :: nil) =>
          check_rec'_show_pg {| assu := pg.(assu); concl := Q; cont := pg.(cont) |} pr0 fuel'
      | _ => pg
      end
  | PrClaimSuffice z1 z2 PrB P pr0 =>
      if direct_deduction pg PrB pg.(concl)
      then let pg' := check_rec'_show_pg {| assu := pg.(assu); concl := P; cont := pg.(cont) |} pr0 fuel' in
          pg'
      else pg
  | PrAction z1 z2 ac pr0 =>
      match apply_action_on_proof pg ac with
      | Some pg' =>
          let pg' := check_rec'_show_pg pg' pr0 fuel' in
          pg'
      | None => pg
      end
  | PrPosePartialProof z1 z2 pac pr1 pr2 =>
      match apply_pose_action_on_proof pg pac with
      | Some pg' =>
          let subgoal_pg := check_rec'_show_pg pg' pr1 fuel' in
          let pg'' := recover_pose_action_on_proof subgoal_pg pac in
          let subsequent_pg := check_rec'_show_pg pg'' pr2 fuel' in
          pg''
      | None => pg
      end
  | _ => pg
  end
  end.

Compute check_rec'_show_pg pg' pr' 100.

End Goal001.
