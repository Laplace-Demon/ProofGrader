Require Import Coq.micromega.Psatz.
Require Import Coq.Classes.Morphisms.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.

Module Type NAME_SYSTEM.

Parameter t: Type.
Parameter eq_dec: forall v1 v2: t, {v1 = v2} + {v1 <> v2}.
Parameter max: t -> t -> t.
Parameter next_name: t -> t.
Parameter le: t -> t -> Prop.
Parameter le_trans: Transitive le.
Parameter default: t.

Axiom next_name_new: forall v v_max, le v v_max -> v <> next_name v_max.
Axiom le_max_r: forall v1 v2, le v1 (max v1 v2).
Axiom le_max_l: forall v1 v2, le v2 (max v1 v2).

End NAME_SYSTEM.

Module StringName <: NAME_SYSTEM.

Definition t := string.

Definition eqb (v1 v2: t): bool := String.eqb v1 v2.

Definition eq_dec: forall v1 v2: t, {v1 = v2} + {v1 <> v2} :=
  string_dec.

Definition max (v1 v2: t): t :=
  if Nat.leb (String.length v1) (String.length v2)
  then v2
  else v1.

Definition next_name (v: t): t :=
  String.String (Ascii.Ascii true true true false false true false false) v.

Definition le (v1 v2: t): Prop :=
  String.length v1 <= String.length v2.

Instance le_trans: Transitive le.
Proof. hnf. unfold le; intros; lia. Qed.

Lemma next_name_new: forall v v_max,
  le v v_max ->
  v <> next_name v_max.
Proof.
  unfold le, next_name.
  intros.
  intro.
  subst v.
  simpl in H.
  lia.
Qed.

Lemma le_max_r: forall v1 v2, le v1 (max v1 v2).
Proof.
  unfold le, max; intros.
  destruct (Nat.leb (String.length v1) (String.length v2)) eqn:?H; try lia.
  apply Compare_dec.leb_complete in H; lia.
Qed.

Lemma le_max_l: forall v1 v2, le v2 (max v1 v2).
Proof.
  unfold le, max; intros.
  destruct (Nat.leb (String.length v1) (String.length v2)) eqn:?H; try lia.
  apply PeanoNat.Nat.leb_gt in H; lia.
Qed.

Definition default: t := "x"%string.

Definition is_numeric_ascii (x: Ascii.ascii): option BinNums.N :=
  let n := Ascii.N_of_ascii x in
  if (BinNat.N.leb 48%N n && BinNat.N.leb n 57%N)%bool
  then Some (n - 48)%N
  else None.

Fixpoint is_numeric_string_rec (s: string) (n: BinNums.N): option BinNums.N :=
  match s with
  | EmptyString => Some n
  | String a0 s0 =>
      match is_numeric_ascii a0 with
      | Some x => is_numeric_string_rec s0 (n * 10 + x)%N
      | None => None
      end
  end.

Definition is_numeric_string (s: string) (n: nat): option BinNums.N :=
  if n <? length s
  then is_numeric_string_rec (substring n (length s) s) 0%N
  else None.

Definition next_suf_of_name (x: t) (s: string): N :=
  if prefix s x
  then match is_numeric_string x (length s) with
       | Some n => (n + 1)%N
       | _ => 0%N
       end
  else 0 % N.

Definition next_suf_of_names (xs: list t) (s: string): N :=
  fold_left (fun n x => N.max n (next_suf_of_name x s)) xs 0%N.

Definition string_of_3digits (n: N): string :=
  String (Ascii.ascii_of_N (n / 100 + 48))
    (String (Ascii.ascii_of_N (n mod 100 / 10 + 48))
      (String (Ascii.ascii_of_N (n mod 10 + 48)) EmptyString)).

Fixpoint digit_length_rec (n: N) (m: positive): nat :=
  match n with
  | N0 => 0
  | _ => match m with
         | xI m0
         | xO m0 => S (digit_length_rec (n/10) m0)
         | _ => 1
         end
  end.

Definition digit_length (n: N): nat :=
  match n with
  | N0 => S O
  | Npos m => digit_length_rec n m
  end.

Definition string_of_N (n: N): string :=
  (fix string_of_N_rec (n: N) m s :=
     match m with
     | O => s
     | S m0 => string_of_N_rec (n/10)%N m0
                 (String (Ascii.ascii_of_N (n mod 10 + 48)%N) s)
     end) n (digit_length n) EmptyString.

Definition next_name_with_prefix (xs: list t) (s: string): string :=
  (s ++ string_of_N (next_suf_of_names xs s))%string.

Fixpoint look_up {A: Type} (x: t) (KV: list (t * A)): option A :=
  match KV with
  | nil => None
  | (x0, v0) :: KV0 =>
      if eqb x0 x then Some v0 else look_up x KV0
  end.

Fixpoint remove {A: Type} (x: t) (KV: list (t * A)): list (t * A) :=
  match KV with
  | nil => nil
  | (x0, v0) :: KV0 =>
      if eqb x0 x
      then remove x KV0
      else (x0, v0) :: remove x KV0
  end.

End StringName.

