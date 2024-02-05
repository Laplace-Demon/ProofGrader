Require Import lib.
Import ListNotations.

(** If X[0] = 1, X[n+1] = (1 - 1/(n+1)^2) X[n], Show limit X = 1/2 *)

Fixpoint X(n : nat) : R :=
  match n with
   | O => 1
   | S n' => X n' * (1 - 1 * / ((n+1) * (n+1)))%R
  end.

Theorem ex1: limit X = (1 / 2).
Proof.
  replace X with ((fun n => (n+2) / (2 * (n+1))): nat -> R).
  Focus 2. {
    extensionality n.
    induction n ; auto.
    + unfold X.
      clear_INR.
      new_field.
    + (**  X[n+1] = (1 - 1/(n+1)^2) X[n] = (1 - 1/(n+1)^2) (n + 2) / (2 * (n + 1)) =  (S n + 2) / (2 * (S n + 1)) *)
      simpl.
      rewrite <- IHn.
      clear IHn.
      clear_INR.
      new_field.
  } Unfocus.
  FP_limit [1; 2] [2; 2].
  auto.
Qed.

Goal forall a b:R, a * a + b * b >=  a * b + a * b.
  intros.
  assert (a * a + b * b - a * b - a * b = (a - b) * (a - b)).
  {
    field.
  }
  assert ((a - b) * (a - b) >= 0).
  {
    set (c := a - b).
    nra.
  }
  nra.
Qed.
