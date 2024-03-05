From MParser.lib Require Import Lang.
From MParser.lib Require Import ExplicitName.

Require Import Datatypes.
Require Import String.
Require Import ZArith.
Require Import List.
Import ListNotations.
Local Open Scope string.
Local Open Scope Z.

(* Definitions *)

Module Type COEF.

Parameter t : Type.

Parameter one : t.

Parameter eqb_zero : t -> bool.

Parameter eqb : t -> t -> bool.

Parameter neg : t -> t.

Parameter plus : t -> t -> t.

Parameter minus : t -> t -> t.

Parameter mult : t -> t -> t.

End COEF.

Module Type PRODS.

Parameter t : Type.

Parameter empty : t.

Parameter eqb : t -> t -> bool.

Parameter merge : t -> t -> t.

End PRODS.

Module Poly (Coef : COEF) (Prods : PRODS).

Record term : Type := {
  coef : Coef.t;
  prods : Prods.t;
}.

Definition term_eqb (tm1 tm2 : term) : bool :=
  match tm1 with
  | Build_term c1 p1
       => match tm2 with
          | Build_term c2 p2
               => andb (Coef.eqb c1 c2) (Prods.eqb p1 p2)
          end
  end.

Definition term_eqb_zero (tm : term) : bool :=
  match tm with
  | Build_term c p => Coef.eqb_zero c
  end.

Definition check_term (tm : term) : Coef.t :=
  match tm with
  | Build_term c p => c
  end.

Definition t : Type := list term.

Definition one : t :=
  [Build_term Coef.one Prods.empty].

Definition eqb_zero (t0 : t) : bool :=
  forallb term_eqb_zero t0.

Definition neg' (t1 : t) : t :=
  map (fun x => match x with | Build_term c p => Build_term (Coef.neg c) p end) t1.

Definition plus' (t1 t2 : t) : t :=
  app t1 t2.

Definition minus' (t1 t2 : t) : t :=
  app t1 (neg' t2).

Definition mult' (t1 t2 : t) : t :=
  concat (map (fun x => map (fun y => {| coef := Coef.mult (coef x) (coef y);
                                         prods := Prods.merge (prods x) (prods y) |}) t2) t1).

Fixpoint plus_one_term_in_poly (t0 : t) (tm : term) : t :=
  match t0 with
  | nil => tm :: nil
  | tm' :: t0' =>
       match tm, tm' with
       | Build_term c p, Build_term c' p' =>
            if Prods.eqb p p' then (Build_term (Coef.plus c c') p) :: t0'
            else tm' :: (plus_one_term_in_poly t0' tm)
       end
  end.

Definition simplify (t0 : t) : t :=
  filter (fun x => negb (term_eqb_zero x)) (fold_left plus_one_term_in_poly t0 nil).

Definition neg (t1 : t) : t :=
  simplify (neg' t1).

Definition plus (t1 t2 : t) : t :=
  simplify (app t1 t2).

Definition minus (t1 t2 : t) : t :=
  simplify (minus' t1 t2).

Definition mult (t1 t2 : t) : t :=
  simplify (mult' t1 t2).

Definition eqb (t1 t2 : t) : bool :=
  match minus t1 t2 with
  | nil => true
  | _ => false
  end.

End Poly.



(* instantiations *)

(* SampleCoef1 : Z * Z *)
Module SampleCoef1 <: COEF.

Definition t := (Z * Z)%type.

Definition one := (1, 1).

Definition eqb_zero (t0 : t) : bool :=
  Z.eqb (fst t0) 0.

Definition eqb (t1 t2 : t) : bool :=
  andb (Z.eqb (fst t1) (fst t2)) (Z.eqb (snd t1) (snd t2)).

Definition simplify (t0 : t) : t :=
  ((fst t0) / (Z.gcd (fst t0) (snd t0)), (snd t0) / (Z.gcd (fst t0) (snd t0))).

Definition neg (t0 : t) : t :=
  simplify (- fst t0, snd t0).

Definition plus (t1 t2 : t) : t :=
  simplify (fst t1 * snd t2 + fst t2 * snd t1, snd t1 * snd t2).

Definition minus (t1 t2 : t) : t :=
  simplify (fst t1 * snd t2 - fst t2 * snd t1, snd t1 * snd t2).

Definition mult (t1 t2 : t) : t :=
  simplify (fst t1 * fst t2, snd t1 * snd t2).

Definition div (t1 t2 : t) : t :=
  simplify (fst t1 * snd t2, snd t1 * fst t2).

End SampleCoef1.

(* SampleProds1 : list PI *)
Module SampleProds1 <: PRODS.

Inductive term : Type :=
  | PI.

Definition term_eqb (tm1 tm2 : term) : bool :=
  true.

Definition t : Type := list term.

Definition empty : t := nil.

Definition eqb := eqb_of_list term_eqb.

Definition merge (t1 t2 : t) :=
  app t1 t2.

End SampleProds1.

(* SamplePoly1 : {| Z * Z ; list PI |} *)
Module SamplePoly1 := Poly SampleCoef1 SampleProds1.

Module SamplePoly1Test.

(* test the module SamplePoly1 *)
Example POLY1 : SamplePoly1.t :=
  let term1 := {| SamplePoly1.coef := (1, 1); SamplePoly1.prods := [SampleProds1.PI] |} in
  let term2 := {| SamplePoly1.coef := (2, 1); SamplePoly1.prods := [SampleProds1.PI ; SampleProds1.PI] |} in
  [term1 ; term2].

Example POLY2 : SamplePoly1.t :=
  let term1 := {| SamplePoly1.coef := (2, 1); SamplePoly1.prods := [SampleProds1.PI ; SampleProds1.PI] |} in
  let term2 := {| SamplePoly1.coef := (3, 1); SamplePoly1.prods := [SampleProds1.PI] |} in
  [term1 ; term2].

Example POLY3 : SamplePoly1.t :=
  let term1 := {| SamplePoly1.coef := (0, 0); SamplePoly1.prods := [SampleProds1.PI ; SampleProds1.PI ; SampleProds1.PI] |} in
  [term1].

Compute (SamplePoly1.neg POLY3).

Compute (SamplePoly1.plus POLY1 POLY2).

Compute (SamplePoly1.minus POLY1 POLY2).

Compute (SamplePoly1.mult POLY1 POLY2).

Compute (SamplePoly1.mult POLY1 POLY3).

End SamplePoly1Test.

(* SampleProds2 : string *)
Module SampleProds2 <: PRODS.

Definition t := string.

Definition empty := "".

Definition eqb := String.eqb.

Definition merge := append.

End SampleProds2.

(* SamplePoly2 : {| {| Z * Z ; list PI |} ; string |} *)
Module SamplePoly2 := Poly SamplePoly1 SampleProds2.

Module SamplePoly2Test.

(* test the module SamplePoly2 *)
Example POLY1 : SamplePoly2.t :=
  let term1 := {| SamplePoly2.coef := SamplePoly1Test.POLY1 ; SamplePoly2.prods := "a" |} in
  [term1].

Example POLY2 : SamplePoly2.t :=
  let term1 := {| SamplePoly2.coef := SamplePoly1Test.POLY2 ; SamplePoly2.prods := "a" |} in
  [term1].

Compute (SamplePoly2.neg POLY1).

Compute (SamplePoly2.plus (SamplePoly2.neg POLY1) POLY1).

Compute (SamplePoly2.mult POLY1 POLY2).

End SamplePoly2Test.

(* SampleCoef2 : Z *)
Module SampleCoef2 <: COEF.

Definition t := Z.

Definition one := 1.

Definition eqb_zero (t0 : t) : bool :=
  Z.eqb t0 Z.zero.

Definition eqb := Z.eqb.

Definition neg := Z.opp.

Definition plus := Z.add.

Definition minus := Z.sub.

Definition mult := Z.mul.

End SampleCoef2.

Module CInt := SampleCoef2.

(* SampleProds3 : Lang.term *)
Module SampleProds3 <: PRODS.

Definition term := Lang.term.

Definition term_eqb := Lang.term_eqb.

Definition t := list term.

Definition empty : t := nil.

Definition eqb := eqb_of_list term_eqb.

Definition merge := @app term.

End SampleProds3.

Module PTerm := SampleProds3.

(* SamplePoly3 : {| Z ; list term |} *)
Module SamplePoly3 := Poly CInt PTerm.





(* prods which can be transformed into poly *)
Module Type PRODS' (Coef : COEF).

Parameter t : Type.

Parameter empty : t.

Parameter eqb : t -> t -> bool.

Definition c : Type := Coef.t.

Parameter merge : t -> t -> t + (list (c * t)).

End PRODS'.

Module Poly' (Coef : COEF) (Prods : PRODS' Coef).

Record term : Type := {
  coef : Coef.t;
  prods : Prods.t;
}.

Definition term_eqb (tm1 tm2 : term) : bool :=
  match tm1 with
  | Build_term c1 p1
       => match tm2 with
          | Build_term c2 p2
               => andb (Coef.eqb c1 c2) (Prods.eqb p1 p2)
          end
  end.

Definition term_eqb_zero (tm : term) : bool :=
  match tm with
  | Build_term c p => Coef.eqb_zero c
  end.

Definition check_term (tm : term) : Coef.t :=
  match tm with
  | Build_term c p => c
  end.

Definition t : Type := list term.

Definition eqb_zero (t0 : t) : bool :=
  forallb term_eqb_zero t0.

Definition eqb := eqb_of_list term_eqb.

Definition neg' (t1 : t) : t :=
  map (fun x => match x with | Build_term c p => Build_term (Coef.neg c) p end) t1.

Definition plus' (t1 t2 : t) : t :=
  app t1 t2.

Definition minus' (t1 t2 : t) : t :=
  app t1 (neg' t2).

Definition mult' (t1 t2 : t) : t :=
  concat (map (fun x => concat (map (fun y =>
  let c := Coef.mult (coef x) (coef y) in
  match Prods.merge (prods x) (prods y) with
  | inl p =>
       {| coef := c ; prods := p |} :: nil
  | inr nil =>
       {| coef := c ; prods := Prods.empty |} :: nil
  | inr l =>
       map (fun z => match z with
                     | pair c' p' =>
                          {| coef := Coef.mult c c' ; prods := p' |}
                     end) l
  end) t2)) t1).

Fixpoint plus_one_term_in_poly (t0 : t) (tm : term) : t :=
  match t0 with
  | nil => tm :: nil
  | tm' :: t0' =>
       match tm, tm' with
       | Build_term c p, Build_term c' p' =>
            if Prods.eqb p p' then (Build_term (Coef.plus c c') p) :: t0'
            else tm' :: (plus_one_term_in_poly t0' tm)
       end
  end.

Definition simplify (t0 : t) : t :=
  filter (fun x => negb (term_eqb_zero x)) (fold_left plus_one_term_in_poly t0 nil).

Definition neg (t1 : t) : t :=
  simplify (neg' t1).

Definition plus (t1 t2 : t) : t :=
  simplify (plus' t1 t2).

Definition minus (t1 t2 : t) : t :=
  simplify (minus' t1 t2).

Definition mult (t1 t2 : t) : t :=
  simplify (mult' t1 t2).

End Poly'.



(* more instantiations *)

Module CRational <: COEF := SampleCoef1.

Fixpoint crational_eval (tm : term) : option CRational.t :=
  match tm with
  | TNum z => Some (z, 1)
  | TUnOp TERM.RNeg tm1 =>
       match crational_eval tm1 with
       | Some (z1, z2) => Some (CRational.simplify (-z1, z2))
       | _ => None
       end
  | TBinOp TERM.RPlus tm1 tm2 =>
       match crational_eval tm1, crational_eval tm2 with
       | Some (z1, z2), Some (z3, z4) => Some (CRational.simplify (z1 * z4 + z2 * z3, z2 * z4))
       | _, _ => None
       end
  | TBinOp TERM.RMinus tm1 tm2 =>
       match crational_eval tm1, crational_eval tm2 with
       | Some (z1, z2), Some (z3, z4) => Some (CRational.simplify (z1 * z4 - z2 * z3, z2 * z4))
       | _, _ => None
       end
  | TBinOp TERM.RMult tm1 tm2 =>
       match crational_eval tm1, crational_eval tm2 with
       | Some (z1, z2), Some (z3, z4) => Some (CRational.simplify (z1 * z3, z2 * z4))
       | _, _ => None
       end
  | TBinOp TERM.RDiv tm1 tm2 =>
       match crational_eval tm1, crational_eval tm2 with
       | Some (z1, z2), Some (z3, z4) => Some (CRational.simplify (z1 * z4, z2 * z3))
       | _, _ => None
       end
  | TBinOp TERM.RPower tm1 tm2 =>
       match crational_eval tm1, crational_eval tm2 with
       | Some (z1, z2), Some (z3, 1) => Some (CRational.simplify (z1 ^ z3, z2 ^ z3))
       | _, _ => None
       end
  | _ => None
  end.

Module PVar <: PRODS.

Inductive term :=
  | Var : StringName.t -> term.

Definition term_eqb (tm1 tm2 : term) : bool :=
  match tm1, tm2 with
  | Var s1, Var s2 => StringName.eqb s1 s2
  end.

Definition t := list term.

Definition empty : t := nil.

Definition eqb := eqb_of_list term_eqb.

Definition merge (t1 t2 : t) :=
  app t1 t2.

End PVar.

Module PConst <: PRODS.

Inductive term :=
  | Pi
  | E.

Definition term_eqb (tm1 tm2 : term) :=
  match tm1, tm2 with
  | Pi, Pi | E, E => true
  | _, _ => false
  end.

Definition t := list term.

Definition empty : t := nil.

Definition eqb := eqb_of_list term_eqb.

Definition merge (t1 t2 : t) :=
  app t1 t2.

End PConst.

Module PolyRationalVar := Poly CRational PVar.

Module PolyRationalVarTest.

Fixpoint PVarConvert (l : list StringName.t) : list PVar.term :=
  match l with
  | nil => nil
  | n :: l' => (PVar.Var n) :: (PVarConvert l')
  end.

Example PT1 : PolyRationalVar.term :=
  PolyRationalVar.Build_term (2, 1) (PVarConvert ["a" ; "b"]).

Example PT2 : PolyRationalVar.term :=
  PolyRationalVar.Build_term (3, 1) (PVarConvert ["c" ; "c" ; "a"]).

Example PT3 : PolyRationalVar.term :=
  PolyRationalVar.Build_term (1, 1) (PVarConvert ["b"]).

(* (2ab + 3ac^2) * (3ac^2 + 2b) = 6a^2bc^2 + 4ab^2 + 9a^2c^4 + 6abc^2 *)
Compute (PolyRationalVar.mult [PT1 ; PT2] [PT2 ; PT3 ; PT3]).

Example P1a : PolyRationalVar.term :=
  PolyRationalVar.Build_term (1, 1) (PVarConvert ["a"]).

Example P1b : PolyRationalVar.term :=
  PolyRationalVar.Build_term (1, 1) (PVarConvert ["b"]).

Example P1c : PolyRationalVar.term :=
  PolyRationalVar.Build_term (1, 1) (PVarConvert ["c"]).

Example one : PolyRationalVar.term :=
  PolyRationalVar.Build_term (1, 1) nil.

Example two : PolyRationalVar.term :=
  PolyRationalVar.Build_term (2, 1) nil.

End PolyRationalVarTest.

Module PSqrtNum <: PRODS' CInt.

Inductive term :=
  | Sqrt : N -> term.

Definition t := term.

Definition empty : t := Sqrt 1.

Definition eqb (t1 t2 : t) : bool :=
  match t1, t2 with
  | Sqrt n1, Sqrt n2 => N.eqb n1 n2
  end.

Definition c := CInt.t.

Definition table := [1 ; 4 ; 9 ; 16 ; 25 ; 36 ; 49 ; 64 ; 81 ; 100].

Fixpoint find (l : list Z) (n : Z) : bool * Z :=
  match l with
  | nil => (false, 0)
  | n' :: l' =>
       if Z.eqb n n' then (true, 0)
       else (fun x => (fst x, 1 + snd x)) (find l' n)
  end.

Definition merge (t1 t2 : t) : t + list (c * t) :=
  match t1, t2 with
  | Sqrt n1, Sqrt n2 =>
       let temp := N.mul n1 n2 in
       match find table (Z.of_N temp) with
       | (true, n) => inr [(n, Sqrt 1)]
       | (false, _) => inl (Sqrt temp)
       end
  end.

End PSqrtNum.

Module PSqrtVar <: PRODS' PolyRationalVar.

Inductive term :=
  | Sqrt : StringName.t -> term.

Definition term_eqb (tm1 tm2 : term) : bool :=
  match tm1, tm2 with
  | Sqrt s1, Sqrt s2 => StringName.eqb s1 s2
  end.

Definition t := list term.

Definition empty : t := nil.

Definition eqb := eqb_of_list term_eqb.

Definition c := PolyRationalVar.t.

Definition convert (tm : term) : PVar.term :=
  match tm with
  | Sqrt s => PVar.Var s
  end.

(* the function simulates the process of multiplying two radical expressions (only contain letters there)
   and always trys to extract a coefficient out of the result *)
Definition merge (t1 t2 : t) : t + list (c * t) :=
  let t0 := app t1 t2 in
  (* t0_no_dup : all terms which occur in t0 *)
  let t0_no_dup := list_no_dup term_eqb nil t0 in
  (* t0_count : list (Z * term) : all terms which occur in t0 along with the number of occurrences *)
  let t0_count := map (fun x => (fold_left (fun n y => if term_eqb x y then n + 1 else n) t0 0, x)) t0_no_dup in
  (* t0_occur_once : all terms which occur in t0 once *)
  let t0_occur_once := filter (fun x => Z.eqb (fst x) 1) t0_count in
  (* t0_occur_more : all terms which occur in t0 more than once *)
  let t0_occur_more := filter (fun x => negb (Z.eqb (fst x) 1)) t0_count in
  (* if those terms all occur once, then concatenate t1 and t2 *)
  if eqb (map (fun x => snd x) t0_occur_more) nil then inl t0
  (* ifnot, terms that occur even and odd times should be treated differently *)
  else let t0_of_coef := map (fun x => if Z.even (fst x) then x else ((fst x) - 1, snd x)) t0_occur_more in
  let t0_occur_odd := filter (fun x => Z.eqb (fst x) 1) (map (fun x => if Z.even (fst x) then x else (1, snd x)) t0_occur_more) in
  let t0_of_prods := app t0_occur_once t0_occur_odd in
  inr [([PolyRationalVar.Build_term (1, 1) (concat (map (fun x => repeat (convert (snd x))
  (Z.to_nat (Z.div2 (fst x)))) t0_of_coef))], map (fun x => snd x) t0_of_prods)].

End PSqrtVar.

Module PSqrtVarTest.

Example Sa : PSqrtVar.term :=
  PSqrtVar.Sqrt "a".

Example Sb : PSqrtVar.term :=
  PSqrtVar.Sqrt "b".

Example Sc : PSqrtVar.term :=
  PSqrtVar.Sqrt "c".

End PSqrtVarTest.

Module PolyRationalVarSqrtVar := Poly' PolyRationalVar PSqrtVar.

Module PolyRationalVarSqrtVarTest.

Example one : PolyRationalVarSqrtVar.term :=
  PolyRationalVarSqrtVar.Build_term [PolyRationalVarTest.one] nil.

Example two : PolyRationalVarSqrtVar.term :=
  PolyRationalVarSqrtVar.Build_term [PolyRationalVarTest.two] nil.

Example P1 : PolyRationalVarSqrtVar.t :=
  let temp1 := PolyRationalVarSqrtVar.Build_term (PolyRationalVar.mult [PolyRationalVarTest.P1a] [PolyRationalVarTest.two]) [PSqrtVarTest.Sa ; PSqrtVarTest.Sb] in
  let temp2 := PolyRationalVarSqrtVar.Build_term [PolyRationalVarTest.one] [PSqrtVarTest.Sc] in
  [temp1 ; temp2].

Example P2 : PolyRationalVarSqrtVar.t :=
  let temp1 := PolyRationalVarSqrtVar.Build_term (PolyRationalVar.mult [PolyRationalVarTest.P1a] [PolyRationalVarTest.one]) [PSqrtVarTest.Sa ; PSqrtVarTest.Sb] in
  let temp2 := PolyRationalVarSqrtVar.Build_term [PolyRationalVarTest.one] [PSqrtVarTest.Sc] in
  [temp1 ; temp2].

Compute P1.
Compute P2.

(* (2a√ab + √c) * (a√ab + √c) = 2a^3b + 3a√abc + c *)
Compute (PSqrtVar.merge [PSqrtVarTest.Sa ; PSqrtVarTest.Sb] [PSqrtVarTest.Sa ; PSqrtVarTest.Sb]).
Compute (PolyRationalVarSqrtVar.mult P1 P2).

(* merge √a^3bc √a^2bc := a^2bc√a *)
Compute (PSqrtVar.merge
[PSqrtVarTest.Sc ; PSqrtVarTest.Sa ; PSqrtVarTest.Sa ; PSqrtVarTest.Sa ; PSqrtVarTest.Sb]
[PSqrtVarTest.Sa ; PSqrtVarTest.Sb ; PSqrtVarTest.Sc ; PSqrtVarTest.Sa]).

End PolyRationalVarSqrtVarTest.

Module PSqrtPolyRationalVar <: PRODS' PolyRationalVar.

Inductive term :=
  | Sqrt : PolyRationalVar.t -> term.

Definition term_eqb (tm1 tm2 : term) : bool :=
  match tm1, tm2 with
  | Sqrt p1, Sqrt p2 => PolyRationalVar.eqb p1 p2
  end.

Definition t := list term.

Definition empty : t := nil. 

Definition eqb := eqb_of_list term_eqb.

Definition c := PolyRationalVar.t.

Definition term_is_const (tm : term) : bool :=
  match tm with
  | Sqrt poly => forallb (fun x => PVar.eqb (PolyRationalVar.prods x) nil) poly
  end.

Definition divide (tm : term) : t :=
  match tm with | Sqrt poly =>
    match poly with
    | nil => nil
    | tm1 :: nil =>
          match tm1 with
          | PolyRationalVar.Build_term c p =>
               if CRational.eqb c (1, 1) then map (fun x => Sqrt [PolyRationalVar.Build_term (1, 1) [x]]) p
               else (Sqrt [PolyRationalVar.Build_term c nil]) :: map (fun x => Sqrt [PolyRationalVar.Build_term (1, 1) [x]]) p
          end
    | _ => [tm]
    end
  end.

Definition merge_without_const (t1 t2 : t) : (t + list (c * t)) * t :=
  let t0 := concat (map divide (map (fun x => match x with | Sqrt poly => Sqrt (PolyRationalVar.simplify poly) end) (app t1 t2))) in
  let t0_const := filter term_is_const t0 in
  let t0_no_const := filter (fun x => negb (term_is_const x)) t0 in
  let t0_no_dup := list_no_dup term_eqb nil t0_no_const in
  let t0_count := map (fun x => (fold_left (fun n y => if term_eqb x y then n + 1 else n) t0_no_const 0, x)) t0_no_dup in
  let t0_occur_once := filter (fun x => Z.eqb (fst x) 1) t0_count in
  let t0_occur_more := filter (fun x => negb (Z.eqb (fst x) 1)) t0_count in
  if eqb (map (fun x => snd x) t0_occur_more) nil then (inl t0, t0_const)
  else let t0_of_coef := map (fun x => if Z.even (fst x) then x else ((fst x) - 1, snd x)) t0_occur_more in
  let t0_occur_odd := filter (fun x => Z.eqb (fst x) 1) (map (fun x => if Z.even (fst x) then x else (1, snd x)) t0_occur_more) in
  let t0_of_prods := app t0_occur_once t0_occur_odd in
  (inr [(fold_left (fun x y => fold_left PolyRationalVar.mult (repeat (match snd y with | Sqrt p => p end) (Z.to_nat (Z.div2 (fst y)))) x) t0_of_coef [PolyRationalVarTest.one],
  map (fun x => snd x) t0_of_prods)], t0_const).

Definition merge (t1 t2 : t) : t + list (c * t) :=
  let (res, t0_const) := merge_without_const t1 t2 in
  let constant := fold_left (fun x y => match y with | Sqrt poly => fold_left (fun z w => CRational.mult (PolyRationalVar.coef w) z) poly x end) t0_const (1, 1) in
  let numerator_sqrt := Z.sqrt (fst constant) in
  let denominator_sqrt := Z.sqrt (snd constant) in
  if andb (Z.eqb (Z.mul numerator_sqrt numerator_sqrt) (fst constant)) (Z.eqb (Z.mul denominator_sqrt denominator_sqrt) (snd constant))
  then let extra_coef := [PolyRationalVar.Build_term (numerator_sqrt, denominator_sqrt) nil] in
  match res with
  | inl t0 => inr [(extra_coef, t0)]
  | inr l => inr (map (fun x => (PolyRationalVar.mult extra_coef (fst x), snd x)) l)
  end
  else let extra_prods := Sqrt [PolyRationalVar.Build_term constant nil] in
  match res with
  | inl t0 => inl (extra_prods :: t0)
  | inr l => inr (map (fun x => (fst x, extra_prods :: (snd x))) l)
  end.

End PSqrtPolyRationalVar.

Module PolyRationalVarSqrtPolyRationalVar := Poly' PolyRationalVar PSqrtPolyRationalVar.

Module PolyRationalVarSqrtPolyRationalVarTest.

Example one : PolyRationalVarSqrtPolyRationalVar.term :=
  PolyRationalVarSqrtPolyRationalVar.Build_term [PolyRationalVarTest.one] nil.

Example sqrt_x_plus_1 : PolyRationalVarSqrtPolyRationalVar.term :=
  PolyRationalVarSqrtPolyRationalVar.Build_term [PolyRationalVarTest.one]
  [PSqrtPolyRationalVar.Sqrt [PolyRationalVar.Build_term (1, 1) [PVar.Var "x"] ; PolyRationalVar.Build_term (1, 1) nil]].

Example sqrt_2x : PolyRationalVarSqrtPolyRationalVar.term :=
  PolyRationalVarSqrtPolyRationalVar.Build_term [PolyRationalVarTest.one]
  [PSqrtPolyRationalVar.Sqrt [PolyRationalVar.Build_term (2, 1) [PVar.Var "x"]]].

Example sqrt_8x : PolyRationalVarSqrtPolyRationalVar.term :=
  PolyRationalVarSqrtPolyRationalVar.Build_term [PolyRationalVarTest.one]
  [PSqrtPolyRationalVar.Sqrt [PolyRationalVar.Build_term (8, 1) [PVar.Var "x"]]].

Compute (PSqrtPolyRationalVar.term_is_const (PSqrtPolyRationalVar.Sqrt [PolyRationalVar.Build_term (1, 1) [PVar.Var "x" ; PVar.Var "x"]])).

Compute (PSqrtPolyRationalVar.term_is_const (PSqrtPolyRationalVar.Sqrt [PolyRationalVar.Build_term (16, 1) nil])).

(* (√x+1 + 1) * (√x+1 - 1) = x *)
Compute (PolyRationalVarSqrtPolyRationalVar.mult
(PolyRationalVarSqrtPolyRationalVar.plus [sqrt_x_plus_1] [one])
(PolyRationalVarSqrtPolyRationalVar.minus [sqrt_x_plus_1] [one])).

(* √2x * √8x = 4x *)
Compute (PolyRationalVarSqrtPolyRationalVar.mult [sqrt_2x] [sqrt_8x]).

(* √x+1 * √x+1 * √x+1 * √x+1 * √x+1 = (x^2 + 2x + 1) * √x+1 *)
Compute (PolyRationalVarSqrtPolyRationalVar.mult (PolyRationalVarSqrtPolyRationalVar.mult (PolyRationalVarSqrtPolyRationalVar.mult (PolyRationalVarSqrtPolyRationalVar.mult
[sqrt_x_plus_1] [sqrt_x_plus_1]) [sqrt_x_plus_1]) [sqrt_x_plus_1]) [sqrt_x_plus_1]).

End PolyRationalVarSqrtPolyRationalVarTest.



(* the polynomial that will practically be employed *)

(* tool functions that will be used *)

Definition crational_is_certain_positive (t0 : CRational.t) : bool :=
  (Z.mul (fst t0) (snd t0)) >? 0.

Definition crational_is_certain_negative (t0 : CRational.t) : bool :=
  (Z.mul (fst t0) (snd t0)) <? 0.

Definition crational_is_zero (t0 : CRational.t) : bool :=
  Z.eqb (Z.mul (fst t0) (snd t0)) 0.

Definition term_is_num (tm : term) : bool :=
  match tm with
  | TNum z => true
  | _ => false
  end.

Fixpoint term_is_num_operation (tm : term) : bool :=
  match tm with
  | TNum z => true
  | TUnOp TERM.RNeg tm1 => term_is_num_operation tm1
  | TBinOp TERM.RPlus tm1 tm2 | TBinOp TERM.RMinus tm1 tm2 | TBinOp TERM.RMult tm1 tm2 | TBinOp TERM.RDiv tm1 tm2 => andb (term_is_num_operation tm1) (term_is_num_operation tm2)
  | _ => false
  end.

Definition term_is_zero (tm : term) : bool :=
  match tm with
  | TNum z => Z.eqb z 0
  | _ => false
  end.

Definition term_is_one (tm : term) : bool :=
  match tm with
  | TNum z => Z.eqb z 1
  | _ => false
  end.

Definition term_is_two (tm : term) : bool :=
  match tm with
  | TNum z => Z.eqb z 2
  | _ => false
  end.

Definition term_is_three (tm : term) : bool :=
  match tm with
  | TNum z => Z.eqb z 3
  | _ => false
  end.

Definition term_get_num (tm : term) : Z :=
  match tm with
  | TNum z => z
  | _ => 0
  end.

Fixpoint term_is_round (tm : term) : bool :=
  match tm with
  | TNum _ => true
  | TUnOp u t1 =>
       match u with
       | TERM.RAbs | TERM.RNeg => term_is_round t1
       | TERM.ZCeil | TERM.ZFloor => true
       | TERM.RSin | TERM.RCos => false (* to be elaborated *)
       | _ => false
       end
  | TBinOp b t1 t2 =>
       match b with
       | TERM.RDiv => andb (term_is_round t1) (term_is_one t2)
       | TERM.RMult | TERM.RPlus | TERM.RMinus | TERM.RPower | TERM.RMax | TERM.RMin => andb (term_is_round t1) (term_is_round t2)
       | _ => false
       end
  | _ => false
  end.

Fixpoint term_is_pair (tm : term) : bool :=
  match tm with
  | TNum z => Z.eqb (Z.modulo z 2) 0
  | TUnOp u t1 =>
       match u with
       | TERM.RAbs | TERM.RNeg => term_is_pair t1
       | TERM.ZCeil | TERM.ZFloor => false
       | TERM.RSin | TERM.RCos => false (* to be elaborated *)
       | _ => false
       end
  | TBinOp b t1 t2 =>
       match b with
       | TERM.RDiv => andb (term_is_pair t1) (term_is_one t2)
       | TERM.RMult => orb (andb (term_is_pair t1) (term_is_round t2)) (andb (term_is_pair t2) (term_is_round t1))
       | TERM.RPlus | TERM.RMinus => andb (andb (term_is_round t1) (term_is_round t2)) (negb (xorb (term_is_pair t1) (term_is_pair t2)))
       | TERM.RMax | TERM.RMin => andb (term_is_pair t1) (term_is_pair t2)
       | _ => false
       end
  | _ => false
  end.

Compute term_is_pair (TBinOp TERM.RMinus (TNum 5) (TBinOp TERM.RPlus (TBinOp TERM.RMult (TNum 2) (TUnOp TERM.ZCeil (TVar "x"))) (TNum 1))).

Definition term_is_const (tm : term) : bool :=
  match tm with
  | TConst _ => true
  | _ => false
  end.

Definition term_is_const_Pi (tm : term) : bool :=
  match tm with
  | TConst TERM.RPi => true
  | _ => false
  end.

Definition term_is_const_E (tm : term) : bool :=
  match tm with
  | TConst TERM.RE => true
  | _ => false
  end.

Definition term_is_var (tm : term) : bool :=
  match tm with
  | TVar _ => true
  | _ => false
  end.

Definition term_is_plus (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RPlus _ _ => true
  | _ => false
  end.

Definition term_is_minus (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RMinus _ _ => true
  | _ => false
  end.

Definition term_is_mult (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RMult _ _ => true
  | _ => false
  end.

Definition term_is_sqrt (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RSqrt _ _ => true
  | _ => false
  end.

Definition term_is_sqrt_num (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RSqrt _ t2 => term_is_num t2
  | _ => false
  end.

Definition term_is_sqrt_two (tm : term) : option term :=
  match tm with
  | TBinOp TERM.RSqrt t1 t2 => if term_is_two t1 then Some t2 else None
  | _ => None
  end.

Definition term_is_neg (tm : term) : option term :=
  match tm with
  | TUnOp TERM.RNeg t1 => Some t1
  | _ => None
  end.

Definition term_is_sin (tm : term) : bool :=
  match tm with
  | TUnOp TERM.RSin _ => true
  | _ => false
  end.

Definition term_extract_sin (tm : term) : option term :=
  match tm with
  | TUnOp TERM.RSin t => Some t
  | _ => None
  end.

Definition term_is_cos (tm : term) : bool :=
  match tm with
  | TUnOp TERM.RCos _ => true
  | _ => false
  end.

Definition term_extract_cos (tm : term) : option term :=
  match tm with
  | TUnOp TERM.RCos t => Some t
  | _ => None
  end.

Definition term_is_tri (tm : term) : bool :=
  orb (term_is_sin tm) (term_is_cos tm).

Definition term_extract_tri (tm : term) : option term :=
  match term_extract_sin tm, term_extract_cos tm with
  | Some t, None | None, Some t => Some t
  | _, _ => None
  end.

Fixpoint term_contain_tri (tm : term) : bool :=
  match tm with
  | TUnOp u tm1 =>
      match u with
      | TERM.RSin | TERM.RCos => true
      | _ => term_contain_tri tm1
      end
  | TBinOp _ tm1 tm2 => orb (term_contain_tri tm1) (term_contain_tri tm2)
  | _ => false
  end.

Definition term_is_min (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RMin _ _ => true
  | _ => false
  end.

Definition term_is_max (tm : term) : bool :=
  match tm with
  | TBinOp TERM.RMax _ _ => true
  | _ => false
  end.

Definition term_is_plus' (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RPlus t1 t2 => Some (t1, t2)
  | _ => None
  end.

Definition term_is_minus' (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RMinus t1 t2 => Some (t1, t2)
  | _ => None
  end.

Definition term_is_mult' (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RMult t1 t2 => Some (t1, t2)
  | _ => None
  end.

Definition term_is_div' (tm : term) : option (term * term) :=
  match tm with
  | TBinOp TERM.RDiv t1 t2 => Some (t1, t2)
  | _ => None
  end.

Definition term_is_lim (tm : term) : option (VarName.t * term * term) :=
  match tm with
  | TBinOp TERM.RLim t1 (TBinder TERM.LambdaB var t2) => Some (var, t1, t2)
  | _ => None
  end.

Definition term_is_func (tm : term) : option (VarName.t * term) :=
  match tm with
  | TBinder TERM.LambdaB x tm' => Some (x, tm')
  | _ => None
  end.

Definition cont_is_even (cont : prop_context) : bool :=
  match cont with
  | CEvenFun => true
  | _ => false
  end.

Definition cont_is_lim_plus (cont : prop_context) : bool :=
  match cont with
  | CLimPlus _ _ => true
  | _ => false
  end.

Definition cont_is_mult (cont : prop_context) : bool :=
  match cont with
  | CLimMult _ _ => true
  | _ => false
  end.



Module TRI_TABLE.

Definition tri_pair : Type := (TERM.UnOp * term).

Definition tri_pair_eqb (tp1 tp2 : tri_pair) : bool :=
  match tp1, tp2 with
  | (b1, t1), (b2, t2) => andb (TERM.UnOp_eqb b1 b2) (SYMBOLIC_CHECKER.test_eqn_R t1 t2)
  end.

Definition tri_value_map := tri_pair -> option term.

Definition empty_tri_value_map : tri_value_map := fun _ => None.

Definition update_tri_value_map (tp : tri_pair) (v : term) (m : tri_value_map) : tri_value_map :=
  fun tp' => if tri_pair_eqb tp tp' then Some v else m tp'.

Definition tri_keys :=
  (TERM.RSin, TNum 0) :: (TERM.RSin, TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 6)) :: (TERM.RSin, TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 4)) :: (TERM.RSin, TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 3)) :: (TERM.RSin, TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2)) :: (TERM.RSin, (TBinOp TERM.RDiv (TBinOp TERM.RMult (TNum 2) (TConst TERM.RPi)) (TNum 3))) ::
  (TERM.RCos, TNum 0) :: (TERM.RCos, TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 6)) :: (TERM.RCos, TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 4)) :: (TERM.RCos, TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 3)) :: (TERM.RCos, TBinOp TERM.RDiv (TConst TERM.RPi) (TNum 2)) :: (TERM.RCos, (TBinOp TERM.RDiv (TBinOp TERM.RMult (TNum 2) (TConst TERM.RPi)) (TNum 3))) :: nil.

Definition tri_values :=
  (TNum 0) :: (TBinOp TERM.RDiv (TNum 1) (TNum 2)) :: (TBinOp TERM.RDiv (TBinOp TERM.RSqrt (TNum 2) (TNum 2)) (TNum 2)) :: (TBinOp TERM.RDiv (TBinOp TERM.RSqrt (TNum 2) (TNum 3)) (TNum 2)) :: (TNum 1) :: (TBinOp TERM.RDiv (TBinOp TERM.RSqrt (TNum 2) (TNum 3)) (TNum 2)) ::
  (TNum 1) :: (TBinOp TERM.RDiv (TBinOp TERM.RSqrt (TNum 2) (TNum 3)) (TNum 2)) :: (TBinOp TERM.RDiv (TBinOp TERM.RSqrt (TNum 2) (TNum 2)) (TNum 2)) :: (TBinOp TERM.RDiv (TNum 1) (TNum 2)) :: (TNum 0) :: (TUnOp TERM.RNeg (TBinOp TERM.RDiv (TNum 1) (TNum 2))) :: nil.

Definition tri_table :=
  let fix f (lx : list tri_pair) (ly : list term) :=
       match lx, ly with
       | x :: lx', y :: ly' => (x, y) :: f lx' ly'
       | _, _ => nil
       end in
  fold_left (fun m x => update_tri_value_map (fst x) (snd x) m) (f tri_keys tri_values) empty_tri_value_map.

End TRI_TABLE.

Fixpoint tri_calculator (tm : term) : option term :=
  match tm with
  | TUnOp TERM.RCos tm' => TRI_TABLE.tri_table (TERM.RCos, tm')
  | TUnOp TERM.RSin tm' => TRI_TABLE.tri_table (TERM.RSin, tm')
  | TUnOp u tm1 =>
      match tri_calculator tm1 with
      | Some tm1' => Some (TUnOp u tm1')
      | None => None
      end
  | TBinOp b tm1 tm2 =>
      match tri_calculator tm1, tri_calculator tm2 with
      | Some tm1', Some tm2' => Some (TBinOp b tm1' tm2')
      | Some tm1', None => Some (TBinOp b tm1' tm2)
      | None, Some tm2' => Some (TBinOp b tm1 tm2')
      | None, None => None
      end
  | TApply tm1 tm2 =>
      match tri_calculator tm1, tri_calculator tm2 with
      | Some tm1', Some tm2' => Some (TApply tm1' tm2')
      | Some tm1', None => Some (TApply tm1' tm2)
      | None, Some tm2' => Some (TApply tm1 tm2')
      | None, None => None
      end
  | _ => None
  end.

Fixpoint terms_extract_num (t : list term) : CRational.t :=
  match t with
  | nil => (1, 1)
  | tm :: t' => let res := match crational_eval tm with
                           | Some r => r
                           | None => (1, 1)
                           end in
                CRational.mult res (terms_extract_num t')
  end.

Fixpoint terms_extract_const (t : list term) : PConst.t :=
  match t with
  | nil => nil
  | tm :: t' => let res := match tm with
                           | TConst TERM.RPi => [PConst.Pi]
                           | TConst TERM.RE => [PConst.E]
                           | _ => nil
                           end in
                app res (terms_extract_const t')
  end.

Fixpoint terms_extract_var (t : list term) : PVar.t :=
  match t with
  | nil => nil
  | tm :: t' => let res := match tm with
                           | TVar x => [PVar.Var x]
                           | _ => nil
                           end in
                app res (terms_extract_var t')
  end.

Definition terms_literal_mult (t1 t2 : list term) : list term :=
  concat (map (fun x => map (fun y => TBinOp TERM.RMult x y ) t2) t1).

Compute (terms_literal_mult [TVar "a" ; TVar "b"] [TVar "b" ; TVar "c"]).

Fixpoint term_simplify_plus (tm : term) : list term :=
  match tm with
  | TBinOp b tm1 tm2 =>
       match b with
       | TERM.RPlus => app (term_simplify_plus tm1) (term_simplify_plus tm2)
       | TERM.RMinus => app (term_simplify_plus tm1) (map (fun x => TUnOp TERM.RNeg x) (term_simplify_plus tm2))
       | TERM.RMult => terms_literal_mult (term_simplify_plus tm1) (term_simplify_plus tm2)
       | _ => [tm]
       end
  | _ => [tm]
  end.

Compute (term_simplify_plus (TBinOp TERM.RMult (TBinOp TERM.RPlus (TVar "a") (TVar "b")) (TBinOp TERM.RPlus (TVar "b") (TVar "c")))).

Fixpoint term_simplify_mult (tm : term) : list term :=
  match tm with
  | TBinOp b tm1 tm2 =>
       match b with
       | TERM.RMult => app (term_simplify_mult tm1) (term_simplify_mult tm2)
       | _ => [tm]
       end
  | _ => [tm]
  end.

Compute (term_simplify_mult (TBinOp TERM.RMult (TBinOp TERM.RPlus (TVar "a") (TVar "b")) (TBinOp TERM.RPlus (TVar "b") (TVar "c")))).

Definition term_is_certain_positive (tm : term) : bool :=
  match tm with
  | TNum z => z >? 0
  | TInfty Positive_Infty => true
  | TConst _ => true
  | TUnOp TERM.RAbs _ => true
  | TBinOp TERM.RSqrt tm1 _ => term_is_pair tm1
  | _ => false
  end. (* to be elaborated *)

Definition term_is_certain_negative (tm : term) : bool :=
  match tm with
  | TNum z => z <? 0
  | TInfty Negative_Infty => true
  | TUnOp TERM.RNeg (TConst _) => true
  | TUnOp TERM.RNeg (TUnOp TERM.RAbs _) => true
  | TUnOp TERM.RNeg (TBinOp TERM.RSqrt tm1 _) => term_is_pair tm1
  | _ => false
  end. (* to be elaborated *)

Definition term_symbolic_negation (tm : term) : term :=
  match tm with
  | TNum z => TNum (-z)
  | TUnOp TERM.RNeg t1 => t1
  | _ => TUnOp TERM.RNeg tm
  end.

Definition term_symbolic_inverse (tm : term) : term :=
  match tm with
  | TBinOp TERM.RDiv tm1 tm2 =>
      if term_eqb (tm1) (TNum 1) then tm2
      else TBinOp TERM.RDiv tm2 tm1
  | _ => TBinOp TERM.RDiv (TNum 1) tm
  end.

Definition term_number_division (tm1 tm2 : term) : term :=
  match tm1, tm2 with
  | TNum z1, TNum z2 =>
        let g := Z.gcd z1 z2 in
        if Z.eqb g z2 then TNum (Z.div z1 g)
        else TBinOp TERM.RDiv (TNum (Z.div z1 g)) (TNum (Z.div z2 g))
  | _, _ => TVar "undefined"
  end.

Definition term_number_multiplication (tm1 tm2 : term) : term :=
  match tm1, tm2 with
  | TNum z1, TNum z2 => TNum (Z.mul z1 z2)
  | _, _ => TVar "undefined"
  end.

Definition term_number_addition (tm1 tm2 : term) : term :=
  match tm1, tm2 with
  | TNum z1, TNum z2 => TNum (Z.add z1 z2)
  | _, _ => TVar "undefined"
  end.

Definition term_number_subtraction (tm1 tm2 : term) : term :=
  match tm1, tm2 with
  | TNum z1, TNum z2 => TNum (Z.sub z1 z2)
  | _, _ => TVar "undefined"
  end.

Definition term_number_exponentiation (tm1 tm2 : term) : term :=
  match tm1, tm2 with
  | TNum z1, TNum z2 => TNum (Z.pow z1 z2)
  | _, _ => TVar "undefined"
  end.

Definition term_number_root (tm1 tm2 : term) : term :=
  match tm1, tm2 with
  | TNum z1, TNum z2 =>
       if Z.eqb z1 2 then
       let temp := Z.sqrt z2 in
       if Z.eqb (Z.pow temp 2) z2 then TNum temp else TBinOp TERM.RSqrt tm1 tm2
       else if Z.eqb z1 3 then
       if Z.eqb z2 1 then TNum 1 else if Z.eqb z2 8 then TNum 2 else if Z.eqb z2 27 then TNum 3 else TBinOp TERM.RSqrt tm1 tm2
       else TBinOp TERM.RSqrt tm1 tm2
  | _, _ => TVar "undefined"
  end.

Fixpoint term_find_divisor (tm : term) : list term :=
  match tm with
  | TBinOp TERM.RMult t1 t2 =>
       app (term_find_divisor t1) (term_find_divisor t2)
  | TBinOp TERM.RPower t1 t2 =>
       if andb (term_is_num t2) ((term_get_num t2) >? 0) then repeat t1 (Z.to_nat (term_get_num t2))
       else [tm]
  | _ => [tm]
  end.

Fixpoint term_spread_exp (tm : term) : term :=
  match tm with
  | TUnOp u t1 =>
       TUnOp u (term_spread_exp t1)
  | TBinOp TERM.RPower t1 t2 =>
       let num := term_get_num t2 in
       let t' := term_spread_exp t1 in
       if num >? 0 then fold_left (fun x y => TBinOp TERM.RMult x y) (repeat t' (Z.to_nat (Z.pred num))) t'
       else tm
  | TBinOp b t1 t2 =>
       TBinOp b (term_spread_exp t1) (term_spread_exp t2)
  | TApply t1 t2 =>
       TApply (term_spread_exp t1) (term_spread_exp t2)
  | TBinder b x t1 =>
       TBinder b x (term_spread_exp t1)
  | _ => tm
  end.

Definition terms_spread_exp (t0 : list term) : list term :=
  map term_spread_exp t0.

Fixpoint term_symbolic_simplify (tm : term) : term :=
  match tm with
  | TUnOp u t1 =>
       let res1 := term_symbolic_simplify t1 in
       match u with
       | TERM.RAbs =>
            if term_is_certain_positive res1 then res1
            else if term_is_certain_negative res1 then term_symbolic_negation res1
            else match term_is_neg res1 with
                 | Some t' => TUnOp u t'
                 | None => TUnOp u res1
                 end
       | TERM.RNeg =>
            term_symbolic_negation res1
       | TERM.ZCeil =>
            if term_is_num res1 then res1
            else if term_is_const_Pi res1 then TNum 4
            else if term_is_const_E res1 then TNum 3
            else TUnOp u res1
       | TERM.ZFloor =>
            if term_is_num res1 then res1
            else if term_is_const_Pi res1 then TNum 3
            else if term_is_const_E res1 then TNum 2
            else TUnOp u res1
       | TERM.RSin | TERM.RCos => match tri_calculator tm with | Some tm' => tm' | None => tm end
       | _ => TUnOp u res1
       end
  | TBinOp b t1 t2 =>
       let res1 := term_symbolic_simplify t1 in
       let res2 := term_symbolic_simplify t2 in
       match b with
       | TERM.RDiv =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_division res1 res2
            else if orb (term_is_zero res1) (term_is_zero res2) then TNum 0
            else if term_is_one res2 then res1
            else if term_eqb res1 res2 then TNum 1
            else TBinOp b res1 res2
       | TERM.RMult =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_multiplication res1 res2
            else if orb (term_is_zero res1) (term_is_zero res2) then TNum 0
            else if term_is_one res1 then res2
            else if term_is_one res2 then res1
            else TBinOp b res1 res2
       | TERM.RPlus =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_addition res1 res2
            else if term_is_zero res1 then res2
            else if term_is_zero res2 then res1
            else TBinOp b res1 res2
       | TERM.RMinus =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_subtraction res1 res2
            else if term_is_zero res1 then term_symbolic_negation res2
            else if term_is_zero res2 then res1
            else TBinOp b res1 res2
       | TERM.RPower =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_exponentiation res1 res2
            else if term_is_zero res2 then TNum 1
            else if term_is_zero res1 then TNum 0
            else if term_is_one res1 then TNum 1
            else if term_is_one res2 then res1
            else term_spread_exp (TBinOp b res1 res2)
       | TERM.RSqrt =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_root res1 res2
            else if term_is_zero res1 then TNum 0
            else if term_is_one res1 then TNum 1
            else let l := map (fun x => TBinOp TERM.RSqrt x res2) (term_find_divisor res1) in
            match l with | nil => TVar "undefined" | n :: l' =>
            fold_left (TBinOp TERM.RMult) l' n end
        | _ => TBinOp b res1 res2
           (* need to be fixed*)
       end
  | TApply t1 t2 => TApply (term_symbolic_simplify t1) (term_symbolic_simplify t2)
  | TBinder b x t1 => TBinder b x (term_symbolic_simplify t1)
  | _ => tm
  end.

Fixpoint term_symbolic_simplify' (tm : term) : term :=
  match tm with
  | TUnOp u t1 =>
       let res1 := term_symbolic_simplify' t1 in
       match u with
       | TERM.RAbs =>
            if term_is_certain_positive res1 then res1
            else if term_is_certain_negative res1 then term_symbolic_negation res1
            else match term_is_neg res1 with
                 | Some t' => TUnOp u t'
                 | None => TUnOp u res1
                 end
       | TERM.RNeg =>
            term_symbolic_negation res1
       | TERM.ZCeil =>
            if term_is_num res1 then res1
            else if term_is_const_Pi res1 then TNum 4
            else if term_is_const_E res1 then TNum 3
            else TUnOp u res1
       | TERM.ZFloor =>
            if term_is_num res1 then res1
            else if term_is_const_Pi res1 then TNum 3
            else if term_is_const_E res1 then TNum 2
            else TUnOp u res1
       | TERM.RSin | TERM.RCos => match tri_calculator tm with | Some tm' => tm' | None => tm end
       | _ => TUnOp u res1
       end
  | TBinOp b t1 t2 =>
       let res1 := term_symbolic_simplify' t1 in
       let res2 := term_symbolic_simplify' t2 in
       match b with
       | TERM.RDiv =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_division res1 res2
            else if orb (term_is_zero res1) (term_is_zero res2) then TNum 0
            else if term_is_one res2 then res1
            else if term_eqb res1 res2 then TNum 1
            else TBinOp b res1 res2
       | TERM.RMult =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_multiplication res1 res2
            else if orb (term_is_zero res1) (term_is_zero res2) then TNum 0
            else if term_is_one res1 then res2
            else if term_is_one res2 then res1
            else TBinOp b res1 res2
       | TERM.RPlus =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_addition res1 res2
            else if term_is_zero res1 then res2
            else if term_is_zero res2 then res1
            else TBinOp b res1 res2
       | TERM.RMinus =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_subtraction res1 res2
            else if term_is_zero res1 then term_symbolic_negation res2
            else if term_is_zero res2 then res1
            else TBinOp b res1 res2
       | TERM.RPower =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_exponentiation res1 res2
            else if term_is_zero res2 then TNum 1
            else if term_is_zero res1 then TNum 0
            else if term_is_one res1 then TNum 1
            else if term_is_one res2 then res1
            else tm
       | TERM.RSqrt =>
            if andb (term_is_num res1) (term_is_num res2) then term_number_root res1 res2
            else if term_is_zero res1 then TNum 0
            else if term_is_one res1 then TNum 1
            else let l := map (fun x => TBinOp TERM.RSqrt x res2) (term_find_divisor res1) in
            match l with | nil => TVar "undefined" | n :: l' =>
            fold_left (TBinOp TERM.RMult) l' n end
        | _ => TBinOp b res1 res2
           (* need to be fixed*)
       end
  | TApply t1 t2 => TApply (term_symbolic_simplify' t1) (term_symbolic_simplify' t2)
  | TBinder b x t1 => TBinder b x (term_symbolic_simplify' t1)
  | _ => tm
  end.



(* instantiations *)

Module PolyRationalConst := Poly CRational PConst.

Module Coef := Poly PolyRationalConst PVar.

Definition coef_is_certain_positive (t0 : Coef.t) : bool :=
  let f := fun x =>
  match x with
  | Coef.Build_term p v =>
       if PVar.eqb v nil
       then forallb (fun x => crational_is_certain_positive (PolyRationalConst.coef x)) (PolyRationalConst.simplify p)
       else false
  end in
  forallb f t0.

Definition coef_is_certain_negative (t0 : Coef.t) : bool :=
  let f := fun x =>
  match x with
  | Coef.Build_term p v =>
       if PVar.eqb v nil
       then forallb (fun x => crational_is_certain_negative (PolyRationalConst.coef x)) (PolyRationalConst.simplify p)
       else false
  end in
  forallb f t0.

Definition coef_is_zero (t0 : Coef.t) : bool :=
  let f := fun x =>
  match x with
  | Coef.Build_term p v =>
       if PVar.eqb v nil
       then forallb (fun x => crational_is_zero (PolyRationalConst.coef x)) (PolyRationalConst.simplify p)
       else false
  end in
  forallb f t0.



Module helper_Prods <: PRODS' Coef.

Definition term := Lang.term.

Definition term_eqb := Lang.term_eqb.

Definition t := list term.

Definition empty : t := nil.

Definition eqb := eqb_of_list term_eqb.

Definition c := Coef.t.

Definition extract_coef (t0 : t) : c * t :=
  let t' := map term_symbolic_simplify t0 in
  ([Coef.Build_term [PolyRationalConst.Build_term (terms_extract_num t') (terms_extract_const t')] (terms_extract_var t')],
  filter (fun x => negb ((term_is_num x) || (term_is_const x) || (term_is_var x))) t').

Definition extract (t0 : t) : list (c * t) :=
  let t0_term_simplify := map (fun x => map term_simplify_mult (term_simplify_plus (term_symbolic_simplify x))) t0 in
  match t0_term_simplify with | nil => nil | tm :: t' =>
  let t0_simplify := fold_left (fun x y => concat (map (fun z => map (fun w => app z w) y) x)) t' tm in
  map extract_coef t0_simplify end.

Definition dilation (tm : term) : list t :=
  map term_simplify_mult (term_simplify_plus (term_symbolic_simplify tm)).

Definition dilation_reduce (t0 : t) : list (c * t) :=
  match map dilation t0 with
  | nil => nil
  | n :: l => map extract_coef (fold_left (fun x y => concat (map (fun z => map (app z) y) x)) l n)
  end.

Definition merge (t1 t2 : t) : t + list (c * t) :=
  let t0 := extract (map term_symbolic_simplify (app t1 t2)) in
  let t0_prods := filter (fun x => negb (eqb (snd x) nil)) t0 in
  let t0_no_prods := filter (fun x => eqb (snd x) nil) t0 in
  inr (app (concat (map (fun x => map (fun y => (Coef.mult (fst x) (fst y), snd y)) (dilation_reduce (snd x))) t0_prods)) t0_no_prods).

End helper_Prods.

Module helper_poly := Poly' Coef helper_Prods.

Definition helper_poly_one :=
  [{| helper_poly.coef := [{| Coef.coef := [{| PolyRationalConst.coef := (1, 1);
                                               PolyRationalConst.prods := [] |}];
                              Coef.prods := [] |}];
       helper_poly.prods := [] |}].

Definition neg_count (t0 : list term) : (list term) * Z :=
  (map (fun x => match x with | TUnOp TERM.RNeg tm' => tm' | _ => x end) t0, Z.of_nat (length (filter (fun x => match x with | TUnOp TERM.RNeg _ => true | _ => false end) t0))).

Definition helper_poly_neg (t0 : helper_poly.t) : helper_poly.t :=
  map (fun x => let (p, n) := neg_count (helper_poly.prods x) in if Z.eqb (Z.modulo n 2) 0 then helper_poly.Build_term (helper_poly.coef x) p
  else helper_poly.Build_term (Coef.mult (helper_poly.coef x) [{| Coef.coef := [{| PolyRationalConst.coef := (-1, 1);
  PolyRationalConst.prods := [] |}]; Coef.prods := [] |}]) p) t0.

Definition helper_poly_eval (tm : term) : helper_poly.t :=
  helper_poly.mult helper_poly_one [helper_poly.Build_term [Coef.Build_term [PolyRationalConst.Build_term (1, 1) []] []] [tm]].

Definition helper_poly_term_eqb (tm1 tm2 : term) : bool :=
  helper_poly.eqb_zero (helper_poly.mult helper_poly_one (helper_poly_neg (helper_poly.minus (helper_poly_eval tm1) (helper_poly_eval tm2)))).



Module Prods <: PRODS' Coef.

Definition term := Lang.term.

Definition term_eqb tm1 tm2 :=
  if Lang.term_eqb tm1 tm2 then true
  else if helper_poly_term_eqb tm1 tm2 then true
  else match tm1, tm2 with
       | TBinOp TERM.RSqrt (TNum 2) tm1', TBinOp TERM.RSqrt (TNum 2) tm2' => helper_poly_term_eqb tm1' tm2'
       | _, _ => false
       end.

Definition t := list term.

Definition empty : t := nil.

Definition eqb := eqb_of_list term_eqb.

Definition c := Coef.t.

Definition helper1 (t0 : t) : t :=
  concat (map (fun x => match x with | TBinOp TERM.RSqrt e (TNum _) => [e] | _ => [] end) t0).

Definition helper2 (t0 : t) (tm : term) : t :=
  match tm with
  | TBinOp TERM.RSqrt e1 (TNum z1) =>
       if existsb (fun x => term_eqb x e1) (helper1 t0)
       then map (fun x => match x with | TBinOp TERM.RSqrt e2 (TNum z2) => if term_eqb e1 e2 then TBinOp TERM.RSqrt e2 (TNum (Z.mul z1 z2)) else x | _ => x end) t0
       else tm :: t0
  | _ => tm :: t0
  end.

Definition terms_sqrt_num_combine (t0 : t) : t :=
  let terms_sqrt_num := filter term_is_sqrt_num t0 in
  let terms_non_sqrt_num := filter (fun x => negb (term_is_sqrt_num x)) t0 in
  let terms_sqrt_num_combine := fold_left helper2 terms_sqrt_num [] in
  app terms_sqrt_num_combine terms_non_sqrt_num.

Definition merge_sqrt (t0 : t) : t :=
  let t0_spread_exp := terms_spread_exp t0 in
  let t0_sqrt := filter term_is_sqrt t0_spread_exp in
  let t0_nonsqrt := filter (fun x => negb (term_is_sqrt x)) t0_spread_exp in
  let t0_sqrt_no_dup := list_no_dup term_eqb nil t0_sqrt in
  let t0_sqrt_count := map (fun x => (fold_left (fun n y => if term_eqb x y then n + 1 else n) t0_spread_exp 0, x)) t0_sqrt_no_dup in
  app (concat (map (fun x => match snd x with
                             | TBinOp TERM.RSqrt t1 t2 =>
                                  if (term_get_num t1) >? 0 then
                                  match app (repeat t2 (Z.to_nat (Z.div (fst x) (term_get_num t1)))) (repeat (snd x) (Z.to_nat (Z.modulo (fst x) (term_get_num t1)))) with
                                  | nil => []
                                  | n :: l => [fold_left (TBinOp TERM.RMult) l n]
                                  end
                                  else [snd x]
                             | _ => [snd x]
                             end) t0_sqrt_count)) t0_nonsqrt.

Definition extract_coef (t0 : t) : c * t :=
  let t' := map term_symbolic_simplify t0 in
  ([Coef.Build_term [PolyRationalConst.Build_term (terms_extract_num t') (terms_extract_const t')] (terms_extract_var t')],
  filter (fun x => negb ((term_is_num_operation x) || (term_is_const x) || (term_is_var x))) t').

Definition extract (t0 : t) : list (c * t) :=
  let t0_term_simplify := map (fun x => map term_simplify_mult (term_simplify_plus (term_symbolic_simplify x))) t0 in
  match t0_term_simplify with | nil => nil | tm :: t' =>
  let t0_simplify := map merge_sqrt (fold_left (fun x y => concat (map (fun z => map (fun w => app z w) y) x)) t' tm) in
  map extract_coef t0_simplify end.

Definition dilation (tm : term) : list t :=
  map term_simplify_mult (term_simplify_plus (term_symbolic_simplify tm)).

Definition dilation_reduce (t0 : t) : list (c * t) :=
  match map dilation t0 with
  | nil => nil
  | n :: l => map extract_coef (fold_left (fun x y => concat (map (fun z => map (app z) y) x)) l n)
  end.

Definition merge (t1 t2 : t) : t + list (c * t) :=
  let t0 := extract (map term_symbolic_simplify (terms_sqrt_num_combine (app t1 t2))) in
  let t0_prods := filter (fun x => negb (eqb (snd x) nil)) t0 in
  let t0_no_prods := filter (fun x => eqb (snd x) nil) t0 in
  inr (app (concat (map (fun x => map (fun y => (Coef.mult (fst x) (fst y), snd y)) (dilation_reduce (snd x))) t0_prods)) t0_no_prods).

End Prods.

Definition prods_is_certain_positive (t0 : Prods.t) : bool :=
  forallb term_is_certain_positive t0.

Definition prods_is_certain_negative (t0 : Prods.t) : bool :=
  forallb term_is_certain_negative t0.

Definition prods_is_zero (t0 : Prods.t) : bool :=
  false.

Module ProdsTest.

Compute (Prods.merge [TNum 3 ; TUnOp TERM.RNeg (TNum 4)] [TNum 2]).

Compute (Prods.merge [TUnOp TERM.RNeg (TNum 3) ; TUnOp TERM.RNeg (TUnOp TERM.RNeg (TNum 4))] [TNum 2]).

Compute (Prods.merge [TUnOp TERM.RAbs (TBinOp TERM.RMult (TNum 3) (TNum 4))] [TNum 2]).

Compute (Prods.merge [TBinOp TERM.RMult (TNum 3) (TNum 4)] [TNum 2]).

Compute (Prods.merge [TBinOp TERM.RPlus (TBinOp TERM.RMult (TNum 3) (TConst TERM.RE)) (TBinOp TERM.RMult (TNum 2) (TConst TERM.RPi))] [TBinOp TERM.RMult (TNum 5) (TVar "x")]).

Compute (Prods.merge [TBinOp TERM.RPlus (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RPlus (TNum 1) (TVar "x"))) (TNum 1)] [TBinOp TERM.RMinus (TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RPlus (TNum 1) (TVar "x"))) (TNum 1)]).

Compute (Prods.merge [(TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RPlus (TNum 1) (TVar "x")))] [(TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RPlus (TNum 1) (TVar "x")))]).

Compute (Prods.merge [(TBinOp TERM.RSqrt (TNum 2) (TVar "x")) ; (TBinOp TERM.RSqrt (TNum 2) (TVar "x"))] []).

Compute (Prods.merge [TBinOp TERM.RPower (TBinOp TERM.RSqrt (TNum 2) (TVar "x")) (TNum 2)] []).

End ProdsTest.



(* poly definitions and operations *)

Module poly := Poly' Coef Prods.

Definition poly_one :=
  [{| poly.coef := [{| Coef.coef := [{| PolyRationalConst.coef := (1, 1);
                                        PolyRationalConst.prods := [] |}];
                       Coef.prods := [] |}];
      poly.prods := [] |}].

Definition poly_is_certain_positive (t0 : poly.t) : bool :=
  forallb (fun x => orb (andb (coef_is_certain_positive (poly.coef x))
  (prods_is_certain_positive (poly.prods x))) (andb (coef_is_certain_negative (poly.coef x)) (prods_is_certain_negative (poly.prods x))))
  (poly.mult poly_one (poly.simplify t0)).

Definition poly_is_certain_negative (t0 : poly.t) : bool :=
  forallb (fun x => orb (andb (coef_is_certain_positive (poly.coef x))
  (prods_is_certain_negative (poly.prods x))) (andb (coef_is_certain_negative (poly.coef x)) (prods_is_certain_positive (poly.prods x))))
  (poly.mult poly_one (poly.simplify t0)).

Definition poly_is_zero (t0 : poly.t) : bool :=
  forallb (fun x => orb (coef_is_zero (poly.coef x)) (prods_is_zero (poly.prods x)))
  (poly.mult poly_one (poly.simplify t0)).

Definition poly_var_insert (t0 : poly.term) :=
  match t0 with
  | poly.Build_term c p =>
       map (fun x => match x with
                     | Coef.Build_term rc v =>
                          if PVar.eqb v nil then poly.Build_term [x] p
                          else poly.Build_term [Coef.Build_term rc nil]
                          (app (map (fun y => match y with
                                              | PVar.Var s => TVar s
                                              end) v) p)
                      end) c
  end.

Definition subst_poly_term (tm : poly.term) (st : subst_task) :=
  match tm with
  | poly.Build_term c p =>
       poly.Build_term c (map (fun x => subst_term x st) p)
  end.

Definition subst_poly (t0 : poly.t) (st : subst_task) : poly.t :=
  poly.mult poly_one (map (fun x => subst_poly_term x st) (concat (map poly_var_insert t0))).

Definition poly_primary_factorization (t0 : poly.t) : PVar.t * Prods.t * poly.t :=
  let t1 := poly.mult poly_one t0 in
  let vars :=
       match concat (map (fun x => map (fun y => Coef.prods y) (poly.coef x)) t1) with
       | nil => nil
       | v :: vars' =>
            fold_left (fun x y => list_extract_dup PVar.term_eqb x y) vars' v
       end in
  let t1' := map (fun x => poly.Build_term (map (fun y => Coef.Build_term (Coef.coef y) (list_del_dup
             PVar.term_eqb (Coef.prods y) vars)) (poly.coef x)) (poly.prods x)) t1 in
  let terms :=
       match map (fun x => poly.prods x) t1' with
       | nil => nil
       | tm :: terms' =>
            fold_left (fun x y => list_extract_dup term_eqb x y) terms' tm
       end in
  let t1'' := map (fun x => poly.Build_term (poly.coef x) (list_del_dup term_eqb (poly.prods x) terms)) t1' in
  (vars, terms, t1'').



(* rational definitions and operations *)

Module rational.

Record t : Type := {
  numerator : poly.t;
  denominator : poly.t;
}.

Definition eqb_zero (t0 : t) : bool :=
  poly.eqb_zero (poly.mult poly_one (numerator t0)).

Definition primary_factorization (t0 : t) : t :=
  let (temp1, numera_rest) := poly_primary_factorization (numerator t0) in
  let (numera_vars, numera_terms) := temp1 in
  let (temp2, denomina_rest) := poly_primary_factorization (denominator t0) in
  let (denomina_vars, denomina_terms) := temp2 in
  let vars := list_extract_dup PVar.term_eqb numera_vars denomina_vars in
  let terms := list_extract_dup term_eqb numera_terms denomina_terms in
  let numera_new_vars := list_del_dup PVar.term_eqb numera_vars vars in
  let denomina_new_vars := list_del_dup PVar.term_eqb denomina_vars vars in
  let numera_new_terms := list_del_dup term_eqb numera_terms terms in
  let denomina_new_terms := list_del_dup term_eqb denomina_terms terms in
  let numera_rest1 := map (fun x => poly.Build_term (map (fun y => Coef.Build_term (Coef.coef y) (app (Coef.prods y) numera_new_vars)) (poly.coef x)) (poly.prods x)) numera_rest in
  let numera_rest2 := map (fun x => poly.Build_term (poly.coef x) (app (poly.prods x) numera_new_terms)) numera_rest1 in
  let denomina_rest1 := map (fun x => poly.Build_term (map (fun y => Coef.Build_term (Coef.coef y) (app (Coef.prods y) denomina_new_vars)) (poly.coef x)) (poly.prods x)) denomina_rest in
  let denomina_rest2 := map (fun x => poly.Build_term (poly.coef x) (app (poly.prods x) denomina_new_terms)) denomina_rest1 in
  Build_t numera_rest2 denomina_rest2.

Definition neg (t1 : t) : t :=
  primary_factorization {| numerator := poly.neg (numerator t1) ; denominator := (denominator t1) |}.

Definition plus (t1 t2 : t) : t :=
  primary_factorization {| numerator := poly.plus (poly.mult (numerator t1) (denominator t2)) (poly.mult (numerator t2) (denominator t1)) ;
                           denominator := poly.mult (denominator t1) (denominator t2) |}.

Definition minus (t1 t2 : t) : t := 
  primary_factorization (plus t1 (neg t2)).

Definition mult (t1 t2 : t) : t :=
  primary_factorization {| numerator := poly.mult (numerator t1) (numerator t2) ;
                           denominator := poly.mult (denominator t1) (denominator t2) |}.

Definition div (t1 t2 : t) : option t :=
  if poly.eqb_zero (poly.mult poly_one (numerator t2)) then None
  else Some (primary_factorization {| numerator := poly.mult (numerator t1) (denominator t2) ;
                                      denominator := poly.mult (numerator t2) (denominator t1) |}).

Definition eqb (t1 t2 : t) : bool :=
  eqb_zero (minus t1 t2).

End rational.

Definition rational_is_certain_positive (t0 : rational.t) : bool :=
  orb (andb (poly_is_certain_positive (rational.numerator t0)) (poly_is_certain_positive (rational.denominator t0)))
  (andb (poly_is_certain_negative (rational.numerator t0)) (poly_is_certain_negative (rational.denominator t0))).

Definition rational_is_certain_negative (t0 : rational.t) : bool :=
  orb (andb (poly_is_certain_positive (rational.numerator t0)) (poly_is_certain_negative (rational.denominator t0)))
  (andb (poly_is_certain_positive (rational.numerator t0)) (poly_is_certain_negative (rational.denominator t0))).

Definition rational_is_zero (t0 : rational.t) : bool :=
  poly_is_zero (rational.numerator t0).

Definition subst_rational (t0 : rational.t) (st : subst_task) : rational.t :=
  {| rational.numerator := subst_poly (rational.numerator t0) st ;
     rational.denominator := subst_poly (rational.denominator t0) st |}.



(* now we interact with term *)

(*
Definition poly_eval (tm : term) : poly.t :=
  poly.mult poly_one [poly.Build_term [Coef.Build_term [PolyRationalConst.Build_term (1, 1) []] []] [tm]].
*)

Definition poly_unop_eval (u : TERM.UnOp) (t0 : poly.t) : option poly.t :=
  match u with
  | TERM.RAbs =>
       if poly_is_certain_positive t0 then Some t0
       else if poly_is_certain_negative t0 then Some (poly.neg t0)
       else if poly.eqb_zero t0 then Some t0
       else None
  | TERM.RNeg => Some (poly.neg t0)
  | _ => None
  end.

Definition poly_binop_eval (b : TERM.BinOp) (t1 t2 : poly.t) : option poly.t :=
  match b with
  | TERM.RMult => Some (poly.mult t1 t2)
  | TERM.RPlus => Some (poly.plus t1 t2)
  | TERM.RMinus => Some (poly.minus t1 t2)
  | TERM.RPower => if poly.eqb t2 (poly.plus poly_one poly_one) then Some (poly.mult t1 t1) else None
  | _ => None
  end.

Fixpoint poly_eval (tm : term) : poly.t :=
  match tm with
  | TUnOp u t1 =>
       match poly_unop_eval u (poly_eval t1) with
       | Some r => r
       | None => poly.mult poly_one [poly.Build_term [Coef.Build_term [PolyRationalConst.Build_term (1, 1) []] []] [tm]]
       end
  | TBinOp b t1 t2 =>
       match poly_binop_eval b (poly_eval t1) (poly_eval t2) with
       | Some r => r
       | None => poly.mult poly_one [poly.Build_term [Coef.Build_term [PolyRationalConst.Build_term (1, 1) []] []] [tm]]
       end
  | _ => poly.mult poly_one [poly.Build_term [Coef.Build_term [PolyRationalConst.Build_term (1, 1) []] []] [tm]]
  end.

Definition rational_unop_eval (u : TERM.UnOp) (t0 : rational.t) : option rational.t :=
  match u with
  | TERM.RAbs =>
       if rational_is_certain_positive t0 then Some t0
       else if rational_is_certain_negative t0 then Some (rational.neg t0)
       else if rational.eqb_zero t0 then Some t0
       else None
  | TERM.RNeg => Some (rational.neg t0)
  | _ => None
  end.

Definition rational_binop_eval (b : TERM.BinOp) (t1 t2 : rational.t) : option rational.t :=
  match b with
  | TERM.RDiv => rational.div t1 t2
  | TERM.RMult => Some (rational.mult t1 t2)
  | TERM.RPlus => Some (rational.plus t1 t2)
  | TERM.RMinus => Some (rational.minus t1 t2)
  | _ => None
  end.

Fixpoint rational_eval (tm : term) : rational.t :=
  match tm with
  | TUnOp u t1 =>
       match rational_unop_eval u (rational_eval t1) with
       | Some r => r
       | None =>
            {| rational.numerator := poly.mult poly_one (poly_eval tm) ; rational.denominator := poly_one |}
       end
  | TBinOp b t1 t2 =>
       match rational_binop_eval b (rational_eval t1) (rational_eval t2) with
       | Some r => r
       | None =>
            {| rational.numerator := poly.mult poly_one (poly_eval tm) ; rational.denominator := poly_one |}
       end
  | _ =>
       {| rational.numerator := poly.mult poly_one (poly_eval tm) ; rational.denominator := poly_one |}
  end.

Definition test_eqn_R (t1 t2 : term) : bool :=
  rational.eqb (rational_eval t1) (rational_eval t2).

Definition poly_ge_0 (t0 : poly.t) : bool :=
  orb (poly_is_certain_positive t0) (poly_is_zero t0).

Definition poly_gt_0 (t0 : poly.t) : bool :=
  poly_is_certain_positive t0.

Definition poly_le_0 (t0 : poly.t) : bool :=
  orb (poly_is_certain_negative t0) (poly_is_zero t0).

Definition poly_lt_0 (t0 : poly.t) : bool :=
  poly_is_certain_negative t0.

Definition rational_ge_0 (t0 : rational.t) :bool :=
  orb (rational_is_certain_positive t0) (rational_is_zero t0).

Definition rational_gt_0 (t0 : rational.t) :bool :=
  rational_is_certain_positive t0.

Definition rational_le_0 (t0 : rational.t) :bool :=
  orb (rational_is_certain_negative t0) (rational_is_zero t0).

Definition rational_lt_0 (t0 : rational.t) :bool :=
  rational_is_certain_negative t0.

Definition rational_is_poly (t0 : rational.t): bool :=
  false.

Definition compare_r_le (t1 t2 : rational.t) : bool :=
  let temp := poly.minus (poly.mult (rational.numerator t2) (rational.denominator t1))
             (poly.mult (rational.numerator t1) (rational.denominator t2)) in
  poly_ge_0 temp.

Definition compare_r_lt (t1 t2 : rational.t) : bool :=
  let temp := poly.minus (poly.mult (rational.numerator t2) (rational.denominator t1))
             (poly.mult (rational.numerator t1) (rational.denominator t2)) in
  poly_gt_0 temp.

Definition compare_r_ge (t1 t2 : rational.t) : bool :=
  let temp := poly.minus (poly.mult (rational.numerator t1) (rational.denominator t2))
             (poly.mult (rational.numerator t2) (rational.denominator t1)) in
  poly_ge_0 temp. 

Definition compare_r_gt (t1 t2 : rational.t) : bool :=
  let temp := poly.minus (poly.mult (rational.numerator t1) (rational.denominator t2))
             (poly.mult (rational.numerator t2) (rational.denominator t1)) in
  poly_gt_0 temp.  

Compute (poly_eval (TBinOp TERM.RPower (TBinOp TERM.RSqrt (TNum 2) (TNum 27)) (TNum 2))).

Definition term_eq_P (t1 t2 : term) : bool :=
  let p1 := poly_eval t1 in
  let p2 := poly_eval t2 in
  poly.eqb p1 p2.

Definition term_ge_P (t1 t2 : term) : bool :=
  let p1 := poly_eval t1 in
  let p2 := poly_eval t2 in
  poly_ge_0 (poly.minus p1 p2).

Definition term_le_P (t1 t2 : term) : bool :=
  let p1 := poly_eval t1 in
  let p2 := poly_eval t2 in
  poly_le_0 (poly.minus p1 p2).

Definition term_gt_P (t1 t2 : term) : bool :=
  let p1 := poly_eval t1 in
  let p2 := poly_eval t2 in
  poly_gt_0 (poly.minus p1 p2).

Definition term_lt_P (t1 t2 : term) : bool :=
  let p1 := poly_eval t1 in
  let p2 := poly_eval t2 in
  poly_lt_0 (poly.minus p1 p2).

Definition term_positive_P (t1 : term) : bool :=
  poly_ge_0 (poly_eval t1).

Definition term_negative_P (t1 : term) : bool :=
  poly_le_0 (poly_eval t1).

Definition term_strict_positive_P (t1 : term) : bool :=
  poly_gt_0 (poly_eval t1).

Definition term_strict_negative_P (t1 : term) : bool :=
  poly_lt_0 (poly_eval t1).


Definition term_eq_R (t1 t2 : term) : bool :=
  let p1 := rational_eval t1 in
  let p2 := rational_eval t2 in
  rational.eqb p1 p2.

Definition term_ge_R (t1 t2 : term) : bool :=
  let p1 := rational_eval t1 in
  let p2 := rational_eval t2 in
  rational_ge_0 (rational.minus p1 p2).

Definition term_le_R (t1 t2 : term) : bool :=
  let p1 := rational_eval t1 in
  let p2 := rational_eval t2 in
  rational_le_0 (rational.minus p1 p2).

Definition term_gt_R (t1 t2 : term) : bool :=
  let p1 := rational_eval t1 in
  let p2 := rational_eval t2 in
  rational_gt_0 (rational.minus p1 p2).

Definition term_lt_R (t1 t2 : term) : bool :=
  let p1 := rational_eval t1 in
  let p2 := rational_eval t2 in
  rational_lt_0 (rational.minus p1 p2).

Definition term_positive_R (t1 : term) : bool :=
  rational_ge_0 (rational_eval t1).

Definition term_negative_R (t1 : term) : bool :=
  rational_le_0 (rational_eval t1).

Definition term_strict_positive_R (t1 : term) : bool :=
  rational_gt_0 (rational_eval t1).

Definition term_strict_negative_R (t1 : term) : bool :=
  rational_lt_0 (rational_eval t1).



(* 利用前提以及表达式本身性质判断 term 符号 *)
Fixpoint term_is_positive (hypos : list prop) (tm : term) : bool :=
  if existsb (fun x => orb (orb (prop_eqb x (PBinPred PROP.RGe tm (TNum 0))) (prop_eqb x (PBinPred PROP.RGt tm (TNum 0)))) (orb (prop_eqb x (PBinPred PROP.RLe (TUnOp TERM.RNeg tm) (TNum 0))) (prop_eqb x (PBinPred PROP.RLt (TUnOp TERM.RNeg tm) (TNum 0))))) hypos then true
  else if term_positive_P tm then true
  else if term_negative_P tm then false
  else match tm with
  | TNum z => z >=? 0
  | TInfty Positive_Infty => true
  | TConst _ => true
  | TUnOp u t1 =>
       match u with
       | TERM.RAbs => true
       | TERM.RNeg => if term_is_negative hypos t1 then true
                      else false
       | _ => false
       end
  | TBinOp b t1 t2 =>
       match b with
       | TERM.RDiv | TERM.RMult => orb (andb (term_is_positive hypos t1) (term_is_positive hypos t2)) (andb (term_is_negative hypos t1) (term_is_negative hypos t2))
       | TERM.RPlus => andb (term_is_positive hypos t1) (term_is_positive hypos t2)
       | TERM.RMinus => andb (term_is_positive hypos t1) (term_is_negative hypos t2)
       | TERM.RSqrt => term_is_pair t2
       | TERM.RPower => term_is_positive hypos t1
       | _ => false
       end
  | _ => false
  end
with term_is_negative (hypos : list prop) (tm : term) : bool :=
  if existsb (fun x => orb (orb (prop_eqb x (PBinPred PROP.RLe tm (TNum 0))) (prop_eqb x (PBinPred PROP.RLt tm (TNum 0)))) (orb (prop_eqb x (PBinPred PROP.RGe (TUnOp TERM.RNeg tm) (TNum 0))) (prop_eqb x (PBinPred PROP.RGt (TUnOp TERM.RNeg tm) (TNum 0))))) hypos then true
  else if term_positive_P tm then false
  else if term_negative_P tm then true
  else match tm with
  | TNum z => z <=? 0
  | TInfty Negative_Infty => true
  | TConst _ => false
  | TUnOp u t1 =>
        match u with
        | TERM.RAbs => false
        | TERM.RNeg => if term_is_positive hypos t1 then true
                    else false
        | _ => false
        end
  | TBinOp b t1 t2 =>
        match b with
        | TERM.RDiv | TERM.RMult => orb (andb (term_is_positive hypos t1) (term_is_negative hypos t2)) (andb (term_is_negative hypos t1) (term_is_negative hypos t2))
        | TERM.RPlus => andb (term_is_negative hypos t1) (term_is_negative hypos t2)
        | TERM.RMinus => andb (term_is_negative hypos t1) (term_is_positive hypos t2)
        | TERM.RSqrt => term_is_negative hypos t1
        | _ => false
        end
  | _ => false
  end.

Compute term_is_positive ((PBinPred PROP.RGe (TVar "omega") (TNum 0)) :: nil)
(TBinOp TERM.RDiv (TVar "omega") (TNum 2)).





Module ln_function.

Definition term_is_ln (t : term) : bool :=
  match t with
  | TUnOp TERM.RLn t1 => true
  | _ => false
  end.

Definition term_is_const (t: term) : bool :=
  match t with 
  | TVar x => true
  | TConst c => true
  | TNum z => true
  | _ =>false
  end.

Definition two_term_ln (t1 t2 :term) : bool :=
  match t1,t2 with
  | TUnOp TERM.RLn t1', TUnOp TERM.RLn t2' => true
  | _, _ => false
  end.

Definition ln_eqb (t1 t2 :term) : bool :=
  match t1,t2 with
  | TUnOp TERM.RLn t1',TUnOp TERM.RLn t2' => term_eqb t1' t2'
  | _,_ => false
  end.

Definition rm_ln (t : term) : term :=
  match t with
  | TUnOp TERM.RLn t' => t'
  | _ => t
  end.

(* ln a + ln b = ln ab *)
Definition ln_plus_l (t1 t2 :term) : term :=
  let t1':= rm_ln t1 in
  let t2':= rm_ln t2 in
  TUnOp TERM.RLn (TBinOp TERM.RMult t1' t2').

(* ln a - ln b = ln (a/b)*) 
Definition ln_minus_l (t1 t2 :term) : term :=
  let t1':= rm_ln t1 in
  let t2':= rm_ln t2 in
  TUnOp TERM.RLn (TBinOp TERM.RDiv t1' t2').

(*-lna = ln a^-1*)
Definition neg_ln (t : term) : term :=
  match t with
  | TUnOp TERM.RNeg t' => let t1':= rm_ln t' in
                         TUnOp TERM.RLn (TBinOp TERM.RPower t1' (TNum (-1)))
  | _ => t
  end.                       
Definition get_power (t : term) : option (term*term) :=
  match t with
  | TUnOp TERM.RLn (TBinOp TERM.RPower t1 t2) =>Some (t1,t2)
  | _ => None
  end. 
 (* ln a^b = b ln a*) 
Definition ln_power_l (t: term) : term :=
  match get_power t with
  | Some (t1,t2) => match t1 with
                   | TConst TERM.RE => t2
                   | TNum 1 => TNum 0
                   | _ => TBinOp TERM.RMult t2 (TUnOp TERM.RLn t1)
                   end
  | None => t
  end.

(* a = ln e ^a ,alnb = ln b^a,(ln b )/a = ln (b ^(1/a))*)
Fixpoint term_transfer (t : term) : term :=
  match t with 
  | TConst c => TUnOp TERM.RLn (TBinOp TERM.RPower (TConst TERM.RE) t)
  | TNum z => TUnOp TERM.RLn (TBinOp TERM.RPower (TConst TERM.RE) t)
  | TVar x => TUnOp TERM.RLn (TBinOp TERM.RPower (TConst TERM.RE) t)
  | TUnOp u t1 =>match u with
                |TERM.RLn => t
                |TERM.SeqLimit =>TUnOp TERM.SeqLimit  (term_transfer t1)
                | _ =>term_transfer t1
                end
  | TBinOp b t1 t2 => match b with
                     | TERM.RPlus => TBinOp b (term_transfer t1) (term_transfer t2)
                     | TERM.RMinus => TBinOp b (term_transfer t1) (term_transfer t2)
                     | TERM.RMult => match t2 with 
                                     | TUnOp TERM.RLn t2' => TUnOp TERM.RLn (TBinOp TERM.RPower t2' t1)
                                     | _ => match t1 with 
                                            | TUnOp TERM.RLn t1' => TUnOp TERM.RLn (TBinOp TERM.RPower t1' t2)
                                            | _ => t (*shouldn't happen*)
                                            end
                                     end
                     | TERM.RDiv => match t1 with 
                                    | TUnOp TERM.RLn t1' => TUnOp TERM.RLn (TBinOp TERM.RPower t1' (TBinOp TERM.RDiv (TNum 1) t2))
                                    | _ => t (*shouldn't happen*)
                                    end 
                     | TERM.RLim => TBinOp b t1 (term_transfer t2)
                     | _ => t
                     end
  | TBinder b x t' => TBinder b x (term_transfer t')
  | _ => t
  end.

Fixpoint term_has_ln (t : term) : bool :=
  match t with
  | TUnOp u t' => match u with
                | TERM.RLn =>true
                | _ => term_has_ln t'
                end
  | TBinOp b t1 t2 => term_has_ln t1 || term_has_ln t2
  | _ => false
  end.

(*
Compute term_has_ln (TBinOp TERM.RPlus (TVar "a") (TBinOp TERM.RPlus (TVar "b")(TUnOp TERM.RLn (TVar "a")))).
*)


Fixpoint if_ln_domain (t : term) :bool :=
  match t with
  | TConst c => true
  | TNum z => true
  | TVar x => true
  | TUnOp u t' => match u with 
                | TERM.SeqLimit
                | TERM.RNeg => if_ln_domain t'
                | TERM.RLn => true
                | _ => false
                end
  | TBinOp b t1 t2 => match b with
                     | TERM.RPlus => if_ln_domain t1 && if_ln_domain t2
                     | TERM.RMinus => if_ln_domain t1 && if_ln_domain t2
                     | TERM.RMult => (term_is_const t1 && term_is_ln t2) || (term_is_const t2 && term_is_ln t1)
                     | TERM.RDiv => term_is_ln t1 && term_is_const t2
                     | TERM.RLim => if_ln_domain t2
                     | _ => false
                     end
  | TBinder b x t' => if_ln_domain t'
  | _ => false
  end.
 
  (*
  Compute term_transfer (TBinOp TERM.RPlus (TVar "a") (TBinOp TERM.RPlus (TVar "b")(TUnOp TERM.RLn (TVar "a")))).
  *)

Fixpoint ln_merge (t : term) : term :=
  match t with 
  | TBinOp TERM.RPlus t1 t2 => ln_plus_l (ln_merge t1) (ln_merge t2)
  | TBinOp TERM.RMinus t1 t2 => ln_minus_l (ln_merge t1) (ln_merge t2)
  | TBinOp TERM.RLim t1 t2 => TBinOp TERM.RLim t1 (ln_merge t2)
  | TUnOp  TERM.RNeg t1 => neg_ln (ln_merge t1)
  | TUnOp  TERM.SeqLimit t1 => TUnOp TERM.SeqLimit (ln_merge t1)
  | TBinder b x t' => TBinder b x (ln_merge t')
  | _ => t
  end.

Compute ln_merge (term_transfer (TBinOp TERM.RPlus (TVar "a") (TBinOp TERM.RPlus (TVar "b")(TUnOp TERM.RLn (TVar "a"))))).

Definition ln_transfer (tm : term) : term :=
  ln_merge (term_transfer tm).

End ln_function.



Module equivalent_infinitesimal_pattern.

Record pattern : Type := {
  pleft : term_pattern;
  pright : term_pattern;
  xvalue : term;
  tvalue : term;
}.

Definition pattern1_left : term_pattern :=
  TPUnOp TERM.RSin (TPTVar "x").

Definition pattern1_right : term_pattern :=
  TPTVar "x".

Definition pattern1 : pattern :=
  {| pleft := pattern1_left ; pright := pattern1_right ;
     xvalue := TNum 0 ; tvalue := TNum 0 |}.

Definition pattern2_left : term_pattern :=
  TPBinOp TERM.RMinus (TPNum 1) (TPUnOp TERM.RCos (TPTVar "x")).

Definition pattern2_right : term_pattern :=
  TPBinOp TERM.RDiv (TPBinOp TERM.RPower (TPTVar "x") (TPNum 2)) (TPNum 2).

Definition pattern2 : pattern :=
  {| pleft := pattern2_left ; pright := pattern2_right ;
     xvalue := TNum 0 ; tvalue := TNum 0 |}.

Definition pattern2'_left : term_pattern :=
  TPBinOp TERM.RMinus (TPNum 1) (TPUnOp TERM.RCos (TPTVar "x")).

Definition pattern2'_right : term_pattern :=
  TPBinOp TERM.RMult (TPBinOp TERM.RDiv (TPNum 1) (TPNum 2)) (TPBinOp TERM.RPower (TPTVar "x") (TPNum 2)).

Definition pattern2' : pattern :=
  {| pleft := pattern2'_left ; pright := pattern2'_right ;
     xvalue := TNum 0 ; tvalue := TNum 0 |}.

Definition pattern3_left : term_pattern :=
  TPBinOp TERM.RMinus (TPTVar "x") (TPUnOp TERM.RSin (TPTVar "x")).

Definition pattern3_right : term_pattern :=
  TPBinOp TERM.RDiv (TPBinOp TERM.RPower (TPTVar "x") (TPNum 3)) (TPNum 6).

Definition pattern3 : pattern :=
  {| pleft := pattern3_left ; pright := pattern3_right ;
     xvalue := TNum 0 ; tvalue := TNum 0 |}.

Definition pattern4_left : term_pattern :=
  TPBinOp TERM.RMinus (TPBinOp TERM.RPower (TPBinOp TERM.RPlus (TPNum 1) (TPTVar "x")) (TPTVar "a")) (TPNum 1).

Definition pattern4_right : term_pattern :=
  TPBinOp TERM.RMult (TPTVar "a") (TPTVar "x").

Definition pattern4 : pattern :=
  {| pleft := pattern4_left ; pright := pattern4_right ;
     xvalue := TNum 0 ; tvalue := TNum 0 |}.

Definition pattern5_left : term_pattern :=
  TPBinOp TERM.RMinus (TPBinOp TERM.RPower (TPConst TERM.RE) (TPTVar "x")) (TPNum 1).

Definition pattern5_right : term_pattern :=
  TPTVar "x".

Definition pattern5 : pattern :=
  {| pleft := pattern5_left ; pright := pattern5_right ;
     xvalue := TNum 0 ; tvalue := TNum 0 |}.

Definition pattern6_left : term_pattern :=
  TPUnOp TERM.RLn (TPBinOp TERM.RPlus (TPNum 1) (TPTVar "x")).

Definition pattern6_right : term_pattern :=
  TPTVar "x".

Definition pattern6 : pattern :=
  {| pleft := pattern6_left ; pright := pattern6_right ;
     xvalue := TNum 0 ; tvalue := TNum 0 |}.

Definition pattern6'_left : term_pattern :=
  TPUnOp TERM.RLn (TPBinOp TERM.RPlus (TPTVar "x") (TPNum 1)).

Definition pattern6'_right : term_pattern :=
  TPTVar "x".

Definition pattern6' : pattern :=
  {| pleft := pattern6'_left ; pright := pattern6'_right ;
     xvalue := TNum 0 ; tvalue := TNum 0 |}.

Compute TERM_PM.pattern_match_term_rec (TBinOp TERM.RMinus (TVar "haha") (TUnOp TERM.RSin (TVar "haha"))) pattern3_left nil nil.

Compute TERM_PM.pattern_match_term_rec (TBinOp TERM.RMinus (TVar "hihi") (TUnOp TERM.RSin (TVar "haha"))) pattern3_left nil nil.

Definition pattern_list : list pattern :=
  pattern1 :: pattern2 :: pattern2' :: pattern3 :: pattern4 :: pattern5 :: pattern6 :: pattern6' :: nil.

Fixpoint lst_helper (lst : list (TermVarName.t * term)) : option term :=
  match lst with
  | nil => None
  | st :: lst' =>
       if TermVarName.eqb (fst st) "x"
       then Some (snd st)
       else lst_helper lst'
  end.

Definition pattern_match_double_term_rec (t1 : term * term) (t2 : term_pattern * term_pattern) (binded : list VarName.t) (res : list (TermVarName.t * term)) : option term :=
  let (t11, t21) := t1 in
  let (t12, t22) := t2 in
  let helper := (fun st1 st2 => andb (TermVarName.eqb (fst st1) (fst st2)) (term_eq_P (snd st1) (snd st2))) in
  match TERM_PM.pattern_match_term_rec t11 t12 binded res, TERM_PM.pattern_match_term_rec t21 t22 binded res with
  | Some l1, Some l2 =>
       if eqb_of_list helper l1 l2
       then lst_helper l1
       else None
  | _, _ =>
       match TERM_PM.pattern_match_term_rec t11 t22 binded res, TERM_PM.pattern_match_term_rec t21 t12 binded res with
       | Some l1, Some l2 =>
            if eqb_of_list helper l1 l2
            then lst_helper l1
            else None
       | _, _ => None
       end
  end.

Compute pattern_match_double_term_rec (TBinOp TERM.RMinus (TBinOp TERM.RPower (TBinOp TERM.RPlus (TNum 1) (TBinOp TERM.RPlus (TVar "k") (TNum 1))) (TNum 2)) (TNum 1), TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RPlus (TNum 1) (TVar "k"))) (pattern4_left, pattern4_right) nil nil.

Fixpoint apply_pattern (pattern_list : list pattern) (tm1 tm2 : term) : option (term * term) :=
  match pattern_list with
  | nil => None
  | p :: pattern_list' =>
       match pattern_match_double_term_rec (tm1, tm2) (pleft p, pright p) nil nil with
       | Some tm => Some (tm, xvalue p)
       | None => apply_pattern pattern_list' tm1 tm2
       end
  end.

End equivalent_infinitesimal_pattern.

Definition form_correspondence (tm1 tm2 : term) : option (term * term) :=
  equivalent_infinitesimal_pattern.apply_pattern (equivalent_infinitesimal_pattern.pattern_list) tm1 tm2.

Definition value_validity (tm val : term) (tmvar : VarName.t) (tmval : term) : bool :=
  let stm := term_symbolic_simplify (subst_term tm [(tmvar, tmval)]) in
  term_eq_P val stm.

Definition equal_small (tm1 tm2 : term) (tmvar : VarName.t) (tmval : term) : bool * (option prop) :=
  match form_correspondence tm1 tm2 with
  | Some (tm, val) =>
       if value_validity tm val tmvar tmval then (true, None) else (false, Some (PBinPred PROP.REq (TBinOp TERM.RLim tmval (TBinder TERM.LambdaB tmvar tm)) val))
  | None => (false, None)
  end.



Module ExamSample1Test.

Example Sqrt1 : term :=
  TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RPlus (TVar "x") (TNum 1)).

Example Sqrt2 : term :=
  TBinOp TERM.RSqrt (TNum 3) (TBinOp TERM.RPlus (TVar "x") (TNum 1)).

Example step_one : term :=
  TBinOp TERM.RDiv (TBinOp TERM.RMinus Sqrt2 (TNum 1)) (TBinOp TERM.RMinus Sqrt1 (TNum 1)).

Example step_two : term :=
  TBinOp TERM.RMult
  (TBinOp TERM.RDiv (TVar "x") (TBinOp TERM.RPlus (TBinOp TERM.RPlus (TBinOp TERM.RPower Sqrt2 (TNum 2)) Sqrt2) (TNum 1)))
  (TBinOp TERM.RDiv (TBinOp TERM.RPlus Sqrt1 (TNum 1)) (TVar "x")).

Compute test_eqn_R step_one step_two.

Compute test_eqn_R
(TBinOp TERM.RDiv
	(TBinOp TERM.RMinus
	(TBinOp TERM.RSqrt (TNum 3) (TBinOp TERM.RPlus
	(TVar "x" )	(TNum 1)))	(TNum 1))	(TBinOp TERM.RMinus
	(TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RPlus
	(TVar "x" )	(TNum 1))) (TNum 1)))

  ((TBinOp TERM.RMult
	((TBinOp TERM.RDiv
	(TVar "x" )	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TBinOp TERM.RSqrt (TNum 3) (TBinOp TERM.RPlus
	(TVar "x")	(TNum 1))))	(TNum 2)))	(TBinOp TERM.RPlus
	(TBinOp TERM.RSqrt (TNum 3) (TBinOp TERM.RPlus
	(TVar "x")	(TNum 1)))	(TNum 1))))))	(TBinOp TERM.RDiv
	(TBinOp TERM.RPlus
	(TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RPlus
	(TVar "x")	(TNum 1))) (TNum 1))	(TVar "x" )))).

Example task : subst_task :=
  [("x", TNum 0)].

Compute subst_rational (rational_eval step_two) task.

End ExamSample1Test.

Module ExamSample2Test.

Example Sqrt1 : term :=
  TBinOp TERM.RSqrt (TNum 2) (TBinOp TERM.RPlus (TVar "x") (TNum 1)).

Example Sqrt2 : term :=
  TBinOp TERM.RSqrt (TNum 3) (TBinOp TERM.RPlus (TVar "x") (TNum 2)).

Example step_one : term :=
  TBinOp TERM.RDiv (TBinOp TERM.RMinus Sqrt2 (TBinOp TERM.RSqrt (TNum 3) (TNum 2))) (TBinOp TERM.RMinus Sqrt1 (TNum 1)).

Example step_two : term :=
  TBinOp TERM.RMult
  (TBinOp TERM.RDiv (TVar "x") (TBinOp TERM.RPlus (TBinOp TERM.RPlus (TBinOp TERM.RPower Sqrt2 (TNum 2)) (TBinOp TERM.RMult (TBinOp TERM.RSqrt (TNum 3) (TNum 2)) Sqrt2)) (TBinOp TERM.RSqrt (TNum 3) (TNum 4))))
  (TBinOp TERM.RDiv (TBinOp TERM.RPlus Sqrt1 (TNum 1)) (TVar "x")).

Compute test_eqn_R step_one step_two.

Compute rational_eval step_one.

Compute rational_eval step_two.

Compute rational.minus (rational_eval step_one) (rational_eval step_two).

Compute Prods.terms_sqrt_num_combine [TBinOp TERM.RSqrt (TNum 3) (TNum 4) ; TBinOp TERM.RSqrt (TNum 3) (TNum 2)].

Compute test_eqn_R
(TBinOp TERM.RDiv
	((TBinOp TERM.RMinus
	(TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) ((TNum 3)))	((TNum 1))))	((TBinOp TERM.RMinus
	(TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) (TNum 2))	((TNum 1)))))((TBinOp TERM.RMult
	((TBinOp TERM.RDiv
	((TVar "x" ))	((TBinOp TERM.RPlus
	((TBinOp TERM.RPower
	((TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) ((TNum 3))))	((TNum 2))))	((TBinOp TERM.RPlus
	(TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) ((TNum 3)))	((TNum 1))))))))	((TBinOp TERM.RDiv
	((TBinOp TERM.RPlus
	(TBinOp TERM.RSqrt ((TBinOp TERM.RPlus
	((TVar "x" ))	((TNum 1)))) (TNum 2))	((TNum 1))))	((TVar "x" )))))).

Example task : subst_task :=
  [("x", TNum 0)].

Compute subst_rational (rational_eval step_two) task.

End ExamSample2Test.



(* 乘除式，用于处理仅含有乘法、除法、指数运算的表达式 *)

Module Type MULDIV.

Parameter t : Type.

Parameter eqb : t -> t -> bool.

Parameter inverse : t -> t.

Parameter power : t -> Lang.term -> t.

Parameter merge : t -> t -> t.

Parameter reduce : t -> t.

Parameter diff : t -> t -> t.

Parameter eval : Lang.term -> t.

Parameter export : t -> Lang.term.

End MULDIV.



Module muldiv_exp <: MULDIV.

Definition term := prod Lang.term Lang.term. (* 第一个 term 为底数，第二个 term 为指数 *)

Definition term_eqb (tm1 tm2 : term) : bool :=
  if orb (term_eq_P (fst tm1) (fst tm2)) (term_eq_R (fst tm1) (fst tm2))
  then (if orb (term_eq_P (snd tm1) (snd tm2)) (term_eq_R (snd tm1) (snd tm2)) then true
  else match crational_eval (snd tm1), crational_eval (snd tm2) with
       | Some r1, Some r2 => CRational.eqb r1 r2
       | _, _ => false
       end)
  else false.

Definition t := prod CRational.t (list term). (* 提取系数仅支持简单情况，不考虑 -1 的指数化简和复杂的数字运算 *)

Definition eqb (t1 t2 : t) : bool :=
  let (t1r, t1') := t1 in
  let (t2r, t2') := t2 in
  andb (CRational.eqb t1r t2r) ((eqb_of_list term_eqb) t1' t2').

Definition inverse (t1 : t) : t :=
  ((snd (fst t1), fst (fst t1)), map (fun x => (fst x, term_symbolic_negation (snd x))) (snd t1)).

Definition power (t1 : t) (exponent : Lang.term) : t :=
  let exp := term_symbolic_simplify exponent in
  let powered_term := map (fun x => (fst x, term_symbolic_simplify (TBinOp TERM.RMult (snd x) exp))) (snd t1) in
  match exp with
  | TNum z =>
      if Z.eqb z 0 then (1, 1, nil)
      else if Z.gtb z 0
      then (Z.pow (fst (fst t1)) z, Z.pow (snd (fst t1)) z, powered_term)
      else (Z.pow (snd (fst t1)) (Z.abs z), Z.pow (fst (fst t1)) (Z.abs z), powered_term)
  | _ =>
      let tm1 : list term := if Z.eqb (fst (fst t1)) 1 then nil else (TNum (fst (fst t1)), exp) :: nil in
      let tm2 : list term := if Z.eqb (snd (fst t1)) 1 then nil else (TNum (snd (fst t1)), term_symbolic_negation exp) :: nil in
      (1, 1, app tm1 (app tm2 powered_term))
  end.

Fixpoint merge_term_helper (t1 : list term) (tm : term) : list term :=
  match t1 with
  | tm1 :: t1' =>
       if term_eq_P (fst tm1) (fst tm)
       then let exp := term_symbolic_simplify (TBinOp TERM.RPlus (snd tm1) (snd tm)) in
       (if Lang.term_eqb exp (TNum 0) then t1'
       else (fst tm1, exp) :: t1')
       else tm1 :: (merge_term_helper t1' tm)
  | nil => tm :: nil
  end.

Definition merge_term (t1 : t) (tm : term) : t :=
  let (t1r, t1') := t1 in
  match crational_eval (TBinOp TERM.RPower (fst tm) (snd tm)) with
  | Some r => (CRational.mult r t1r, t1')
  | None => (t1r, merge_term_helper t1' tm)
  end.

Fixpoint merge_helper (t1 : t) (t2 : list term) : t :=
  match t2 with
  | nil => t1
  | tm :: t2' => merge_helper (merge_term t1 tm) t2'
  end.

Definition merge (t1 t2 : t) : t := (* t1 * t2*)
  let (t2r, t2') := t2 in
  match merge_helper t1 t2' with
  | (tr', t') => (CRational.mult tr' t2r, t')
  end.

Definition reduce (t1 : t) : t :=
  let helper := fix f l :=
      match l with
      | (base, exponent) :: l' =>
          if orb (Lang.term_eqb (term_symbolic_simplify base) (TNum 1)) (Lang.term_eqb (term_symbolic_simplify exponent) (TNum 0))
          then f l' else (base, exponent) :: (f l')
      | nil => nil
      end in
  (CRational.simplify (fst t1), helper (snd t1)).

Definition diff : t -> t -> t := (* t1 / t2 *)
  fun t1 t2 : t => merge t1 (inverse t2).

Fixpoint eval' (tm : Lang.term) : t :=
  match tm with
  | TBinOp TERM.RMult t1 t2 => merge (eval' t1) (eval' t2)
  | TBinOp TERM.RDiv t1 t2 => merge (eval' t1) (inverse (eval' t2))
  | TBinOp TERM.RPower t1 t2 => power (eval' t1) t2
  | TBinOp TERM.RSqrt t1 t2 => power (eval' t2) (TBinOp TERM.RDiv (TNum 1) t1)
  | _ => match crational_eval tm with
         | Some r => (r, nil)
         | None => ((1, 1), (tm, TNum 1) :: nil)
         end
  end.

Definition eval (tm : Lang.term) : t := reduce (eval' tm).

Definition export (t1 : t) : Lang.term :=
  let (t1r, t1') := t1 in
  let (numerator, denominator) := CRational.simplify t1r in
  let coefficient := if Z.eqb denominator 1 then (if Z.eqb numerator 1 then None else Some (TNum numerator))
                     else Some (TBinOp TERM.RDiv (TNum numerator) (TNum denominator)) in
  let helper := fix f l :=
      match l with
      | n1 :: l' =>
          let tm := if Lang.term_eqb (term_symbolic_simplify (snd n1)) (TNum 1)
                    then fst n1 else TBinOp TERM.RPower (fst n1) (term_symbolic_simplify (snd n1)) in
          match f l' with
          | Some tm' => Some (TBinOp TERM.RMult tm tm')
          | None => Some tm
          end
      | nil => None
      end in
  match coefficient, helper t1' with
  | Some c, Some p => TBinOp TERM.RMult c p
  | Some c, None => c
  | None, Some p => p
  | None, None => TVar "null"
  end.

Definition prop_transformation (pg : proof_goal) : list (bool * t) :=
  let helper := fix f (l : list prop) : list (bool * t) :=
      match l with
      | n :: l' =>
          app (match n with
          | PBinPred PROP.RGt (TNum 0) tm | PBinPred PROP.RLt tm (TNum 0) =>
              let t1 := eval tm in
              [(false, t1) ; (false, inverse t1)]
          | PBinPred PROP.RGt tm (TNum 0) | PBinPred PROP.RLt (TNum 0) tm =>
              let t1 := eval tm in
              [(true, t1) ; (true, inverse t1)]
          | _ => nil
          end) (f l')
      | nil => nil
      end in
  let hypos := map (fun x => snd x) pg.(assu) in
  helper hypos.

Definition inclusion (t1 t2 : t) : option t := (* if t2 contains t1 *)
  let (t1r, t1') := t1 in
  let (t2r, t2') := t2 in
  if forallb (fun x => list_in term_eqb t1' x) t2'
  then Some (CRational.div t1r t2r, list_del_dup term_eqb t1' t2')
  else None.

Fixpoint sign_determination (direction : bool) (t1 : t) (hypos : list (bool * t)) : bool :=
  match hypos with
  | (b, hypo) :: hypos' =>
      match inclusion t1 hypo with
      | Some t1' =>
          if b then sign_determination direction t1' hypos'
          else sign_determination (negb direction) t1' hypos'
      | None =>
          sign_determination direction t1 hypos'
      end
  | nil =>
      let (t1r, t1') := t1 in
      match t1' with
      | nil =>
          orb (andb direction (Z.gtb ((fst t1r) * (snd t1r)) 0)) (andb (negb direction) (Z.ltb ((fst t1r) * (snd t1r)) 0))
      | _ =>
          let tm := export (1, 1, t1') in
          orb (andb direction (term_is_positive nil tm)) (andb (negb direction) (term_is_negative nil tm))
      end
  end.

End muldiv_exp.





Compute muldiv_exp.eval (TBinOp TERM.RDiv
((TBinOp TERM.RPower
((TVar "x" ))	(((TBinOp TERM.RPlus
((TNum 1))	((TVar "x" )))))))	((TBinOp TERM.RPower
(((TBinOp TERM.RPlus
((TNum 1))	((TVar "x" )))))	(((TVar "x" )))))).

Compute muldiv_exp.eval (TBinOp TERM.RPower
((TVar "x" ))	(((TBinOp TERM.RPlus
((TNum 1))	((TVar "x" )))))).

(* TODO *)


Definition term_eq_MDE (t1 t2 : term) : bool :=
  let md1 := muldiv_exp.eval t1 in
  let md2 := muldiv_exp.eval t2 in
  muldiv_exp.eqb md1 md2.

Definition term_ge_MDE (t1 t2 : term) : bool :=
  false.

Definition term_le_MDE (t1 t2 : term) : bool :=
  false.

Definition term_gt_MDE (t1 t2 : term) : bool :=
  false.

Definition term_lt_MDE (t1 t2 : term) : bool :=
  false.

Definition new_MuldivExp_check (pg : proof_goal) (P : prop) : bool :=
  match P with 
  | PBinPred o t1 t2 => match o with
                     | PROP.REq => term_eq_MDE t1 t2
                     | PROP.RGe => term_eq_MDE t1 t2
                     | PROP.RLe => term_eq_MDE t1 t2
                     | PROP.RGt => term_eq_MDE t1 t2
                     | PROP.RLt => term_eq_MDE t1 t2 (* TODO *)
                     | _ => false 
                     end
  | _ => false
  end.



Module muldiv_base <: MULDIV.

Definition term := prod Lang.term Lang.term.

Definition term_eqb (tm1 tm2 : term) : bool :=
  if orb (term_eq_P (snd tm1) (snd tm2)) (term_eq_R (snd tm1) (snd tm2))
  then (if orb (term_eq_P (fst tm1) (fst tm2)) (term_eq_R (fst tm1) (fst tm2)) then true
  else match crational_eval (fst tm1), crational_eval (fst tm2) with
       | Some r1, Some r2 => CRational.eqb r1 r2
       | _, _ => false
       end)
  else false.

Definition t := list term.

Definition eqb : t -> t -> bool :=
  eqb_of_list term_eqb.

Definition inverse : t -> t :=
  map (fun x => (term_symbolic_inverse (fst x), snd x)).

Definition power (t1 : t) (exponent : Lang.term) : t :=
  map (fun x => (fst x, term_symbolic_simplify (TBinOp TERM.RMult (snd x) exponent))) t1.

Fixpoint merge_term (t1 : t) (tm : term) : t :=
  match t1 with
  | tm1 :: t1' =>
      if Lang.term_eqb (snd tm) (snd tm1)
      then let base := term_symbolic_simplify (TBinOp TERM.RMult (fst tm) (fst tm1)) in
      (if term_eq_MDE base (TNum 1) then t1'
      else (base, snd tm1) :: t1')
      else tm1 :: (merge_term t1' tm)
  | nil => tm :: nil
  end.

Fixpoint merge (t1 t2 : t) : t :=
  match t2 with
  | tm2 :: t2' =>
      merge (merge_term t1 tm2) t2'
  | nil => t1
  end.

Definition reduce (t1 : t) : t :=
  let helper := fix f l :=
      match l with
      | (base, exponent) :: l' =>
          if orb (Lang.term_eqb (term_symbolic_simplify base) (TNum 1)) (Lang.term_eqb (term_symbolic_simplify exponent) (TNum 0))
          then f l' else (base, exponent) :: (f l')
      | nil => nil
      end in
  helper t1.

Definition diff : t -> t -> t := (* t1 / t2 *)
  fun t1 t2 : t => merge t1 (inverse t2).

Fixpoint eval' (tm : Lang.term) : t :=
  match tm with
  | TBinOp TERM.RMult t1 t2 => merge (eval' t1) (eval' t2)
  | TBinOp TERM.RDiv t1 t2 => merge (eval' t1) (inverse (eval' t2))
  | TBinOp TERM.RPower t1 t2 => power (eval' t1) t2
  | TBinOp TERM.RSqrt t1 t2 => power (eval' t2) (TBinOp TERM.RDiv (TNum 1) t1)
  | _ => ((tm, TNum 1) :: nil)
  end.

Definition eval (tm : Lang.term) : t := reduce (eval' tm).

Definition export (t1 : t) : Lang.term :=
  let helper := fix f l :=
      match l with
      | n1 :: l' =>
          let tm := if Lang.term_eqb (term_symbolic_simplify (snd n1)) (TNum 1)
                    then fst n1 else TBinOp TERM.RPower (fst n1) (term_symbolic_simplify (snd n1)) in
          match f l' with
          | Some tm' => Some (TBinOp TERM.RMult tm tm')
          | None => Some tm
          end
      | nil => None
      end in
  match helper t1 with
  | Some p => p
  | None => TVar "null"
  end.

Definition prop_transformation (pg : proof_goal) : list (bool * t) :=
  let helper := fix f (l : list prop) : list (bool * t) :=
      match l with
      | n :: l' =>
          app (match n with
          | PBinPred PROP.RGt (TNum 0) tm | PBinPred PROP.RLt tm (TNum 0) =>
              let t1 := eval tm in
              [(false, t1) ; (false, inverse t1)]
          | PBinPred PROP.RGt tm (TNum 0) | PBinPred PROP.RLt (TNum 0) tm =>
              let t1 := eval tm in
              [(true, t1) ; (true, inverse t1)]
          | _ => nil
          end) (f l')
      | nil => nil
      end in
  let hypos := map (fun x => snd x) pg.(assu) in
  helper hypos.

Definition inclusion (t1 t2 : t) : option t := (* if t2 contains t1 *)
  if forallb (fun x => list_in term_eqb t1 x) t2
  then Some (list_del_dup term_eqb t1 t2)
  else None.

Fixpoint sign_determination (direction : bool) (t1 : t) (hypos : list (bool * t)) : bool :=
  match hypos with
  | (b, hypo) :: hypos' =>
      match inclusion t1 hypo with
      | Some t1' =>
          if b then sign_determination direction t1' hypos'
          else sign_determination (negb direction) t1' hypos'
      | None =>
          sign_determination direction t1 hypos'
      end
  | nil =>
      match t1 with
      | nil => true
      | _ =>
          let tm := export t1 in
          orb (andb direction (term_is_positive nil tm)) (andb (negb direction) (term_is_negative nil tm))
      end
  end.

End muldiv_base.

Definition term_eq_MDB (t1 t2 : term) : bool :=
  let md1 := muldiv_base.eval t1 in
  let md2 := muldiv_base.eval t2 in
  muldiv_base.eqb md1 md2.



Module muldiv_eln <: MULDIV.

Definition term := prod Lang.term Lang.term.

Definition term_eqb (tm1 tm2 : term) : bool :=
  if orb (term_eq_P (fst tm1) (fst tm2)) (term_eq_R (fst tm1) (fst tm2))
  then (if orb (term_eq_P (snd tm1) (snd tm2)) (term_eq_R (snd tm1) (snd tm2)) then true
  else match crational_eval (snd tm1), crational_eval (snd tm2) with
       | Some r1, Some r2 => CRational.eqb r1 r2
       | _, _ => false
       end)
  else false.

Definition t := list term.

Definition eqb : t -> t -> bool :=
  eqb_of_list term_eqb.

Definition inverse (t1 : t) : t :=
  map (fun x => (fst x, term_symbolic_negation (snd x))) t1.

Definition power (t1 : t) (exponent : Lang.term) : t :=
  map (fun x => (fst x, term_symbolic_simplify (TBinOp TERM.RMult (snd x) exponent))) t1.

Fixpoint merge_term_helper (t1 : list term) (tm : term) : list term :=
  match t1 with
  | tm1 :: t1' =>
       if term_eq_P (fst tm1) (fst tm)
       then let exp := term_symbolic_simplify (TBinOp TERM.RPlus (snd tm1) (snd tm)) in
       (if Lang.term_eqb exp (TNum 0) then t1'
       else (fst tm1, exp) :: t1')
       else tm1 :: (merge_term_helper t1' tm)
  | nil => tm :: nil
  end.

Fixpoint merge_term (t1 : list term) (tm : term) : list term :=
  match t1 with
  | tm1 :: t1' =>
       if term_eq_P (fst tm1) (fst tm)
       then let exp := term_symbolic_simplify (TBinOp TERM.RPlus (snd tm1) (snd tm)) in
       (if Lang.term_eqb exp (TNum 0) then t1'
       else (fst tm1, exp) :: t1')
       else tm1 :: (merge_term t1' tm)
  | nil => tm :: nil
  end.

Fixpoint merge (t1 t2 : t) : t :=
  match t2 with
  | tm2 :: t2' =>
      merge (merge_term t1 tm2) t2'
  | nil => t1
  end.

Fixpoint exp_extract_ln_muldiv (tm : Lang.term) : option (Lang.term * Lang.term) :=
  match tm with
  | TBinOp TERM.RMult tm1 tm2 =>
      match exp_extract_ln_muldiv tm1, exp_extract_ln_muldiv tm2 with
      | Some (tm11, tm12), _ => Some (TBinOp TERM.RMult tm11 tm2, tm12)
      | None, Some (tm21, tm22) => Some (TBinOp TERM.RMult tm1 tm21, tm22)
      | None, None => None
      end
  | TBinOp TERM.RDiv tm1 tm2 =>
      match exp_extract_ln_muldiv tm1, exp_extract_ln_muldiv tm2 with
      | Some (tm11, tm12), _ => Some (TBinOp TERM.RDiv tm11 tm2, tm12)
      | _, _ => None
      end
  | TUnOp TERM.RLn tm1 => Some (TNum 1, tm1)
  | _ => None
  end.

Fixpoint exp_extract_ln_poly (tm : Lang.term) : (option Lang.term) * (option (Lang.term * Lang.term)) :=
  let helper := fun x (k : Lang.term -> Lang.term) =>
      match x with
      | (Some tm1, x') => (Some (k tm1), x')
      | (None, x') => (Some (k (TNum 0)), x')
      end in
  match tm with
  | TBinOp TERM.RPlus tm1 tm2 =>
      let t1 := exp_extract_ln_poly tm1 in
      let t2 := exp_extract_ln_poly tm2 in
      match t1, t2 with
      | (_, Some _), _ => helper t1 (fun x => TBinOp TERM.RPlus x tm2)
      | _, (_, Some _) => helper t2 (fun x => TBinOp TERM.RPlus tm1 x)
      | _, _ => (Some tm, None)
      end
  | TBinOp TERM.RMinus tm1 tm2 =>
      let t1 := exp_extract_ln_poly tm1 in
      let t2 := exp_extract_ln_poly tm2 in
      match t1, t2 with
      | (_, Some _), _ => helper t1 (fun x => TBinOp TERM.RMinus x tm2)
      | _, (_, Some _) => helper t2 (fun x => TBinOp TERM.RMinus tm1 x)
      | _, _ => (Some tm, None)
      end
  | TUnOp TERM.RNeg tm1 =>
      match exp_extract_ln_poly tm1 with
      | (Some tm11, Some (tm12, tm13)) => (Some (TUnOp TERM.RNeg tm11), Some (TUnOp TERM.RNeg tm12, tm13))
      | (None, Some (tm12, tm13)) => (None, Some (TUnOp TERM.RNeg tm12, tm13))
      | _ => (Some tm, None)
      end
  | _ =>
      match exp_extract_ln_muldiv tm with
      | Some (tm1, tm2) => (None, Some (tm1, tm2))
      | None => (Some tm, None)
      end
  end.


Definition reduce (t1 : t) : t :=
  let helper := fix f l :=
      match l with
      | (base, exponent) :: l' =>
          if orb (Lang.term_eqb (term_symbolic_simplify base) (TNum 1)) (Lang.term_eqb (term_symbolic_simplify exponent) (TNum 0)) then f l'
          else if Lang.term_eqb base (TConst TERM.RE)
          then (match exp_extract_ln_poly exponent with
               | (Some tm1, Some (tm2, tm3)) => (tm3, tm2) :: (TConst TERM.RE, tm1) :: (f l')
               | (None, Some (tm2, tm3)) => (tm3, tm2) :: (f l')
               | _ => (base, exponent) :: (f l')
               end)
          else (base, exponent) :: (f l')
      | nil => nil
      end in
  helper t1.

Definition diff : t -> t -> t :=
  fun t1 t2 : t => merge t1 (inverse t2).

Fixpoint eval' (tm : Lang.term) : t :=
  match tm with
  | TBinOp TERM.RMult t1 t2 => merge (eval' t1) (eval' t2)
  | TBinOp TERM.RDiv t1 t2 => merge (eval' t1) (inverse (eval' t2))
  | TBinOp TERM.RPower t1 t2 => power (eval' t1) t2
  | TBinOp TERM.RSqrt t1 t2 => power (eval' t2) (TBinOp TERM.RDiv (TNum 1) t1)
  | _ => ((tm, TNum 1) :: nil)
  end.

Definition eval (tm : Lang.term) : t := reduce (eval' tm).

Definition export (t1 : t) : Lang.term :=
  let helper := fix f l :=
      match l with
      | n1 :: l' =>
          let tm := if Lang.term_eqb (term_symbolic_simplify (snd n1)) (TNum 1)
                    then fst n1 else TBinOp TERM.RPower (fst n1) (term_symbolic_simplify (snd n1)) in
          match f l' with
          | Some tm' => Some (TBinOp TERM.RMult tm tm')
          | None => Some tm
          end
      | nil => None
      end in
  match helper t1 with
  | Some p => p
  | None => TVar "null"
  end.

End muldiv_eln.

Definition term_eq_MDELn (t1 t2 : term) : bool :=
  let md1 := muldiv_eln.eval t1 in
  let md2 := muldiv_eln.eval t2 in
  muldiv_eln.eqb md1 md2.


Module MultiMuldiv (Muldiv : MULDIV).

Definition term : Type := prod bool Muldiv.t. (* bool 表示加减号，不过我们只要关心两个 term 对应位置的 bool 是否相等就行了 *)

Definition eqb_term (tm1 tm2 : term) : bool :=
  andb (bool_eq (fst tm1) (fst tm2)) (Muldiv.eqb (snd tm1) (snd tm2)).

Definition t : Type := list term.

Fixpoint correspondence (t1 t2 : t) : option ((list Muldiv.t) * (list Muldiv.t)) :=
  match t1, t2 with
  | (b1, tm1) :: t1', (b2, tm2) :: t2' =>
      if bool_eq b1 b2
      then match correspondence t1' t2' with
           | Some (l1, l2) => Some (tm1 :: l1, tm2 :: l2)
           | None => None
           end
      else None
  | nil, nil => Some (nil, nil)
  | _, _ => None
  end.

Definition eqb (t1 t2 : t) : bool :=
  match correspondence t1 t2 with
  | Some (l1, l2) => eqb_of_list Muldiv.eqb l1 l2
  | None => false
  end.

Definition neg (t1 : t) : t :=
  map (fun x => (negb (fst x), snd x)) t1.

Definition plus := @app term.

Definition minus (t1 t2 : t) : t :=
  plus t1 (neg t2).

Definition inverse (t1 : t) : t :=
  map (fun x => (fst x, Muldiv.inverse (snd x))) t1.

Definition power (t1 : t) (exponent : Lang.term) : t :=
  map (fun x => (fst x, Muldiv.power (snd x) exponent)) t1.

Definition diff (t1 t2 : t) : option (list Muldiv.t) :=
  let helper := fix f l1 l2 :=
      match l1, l2 with
      | n1 :: l1', n2 :: l2' => (n1, n2) :: (f l1' l2')
      | _, _ => nil
      end in
  match correspondence t1 t2 with
  | Some (l1, l2) => Some (map (fun x => Muldiv.diff (fst x) (snd x)) (helper l1 l2))
  | None => None
  end.

Fixpoint eval (tm : Lang.term) : t :=
  match tm with
  | TUnOp TERM.RNeg tm1 => neg (eval tm1)
  | TBinOp TERM.RPlus tm1 tm2 => plus (eval tm1) (eval tm2)
  | TBinOp TERM.RMinus tm1 tm2 => minus (eval tm1) (eval tm2)
  | _ => (true, Muldiv.eval tm) :: nil
  end.

Fixpoint squash (l1 : list Muldiv.t) : option Muldiv.t :=
  match l1 with
  | nil => None
  | t1 :: l1' =>
      match l1' with
      | t1' :: l1'' =>
          match squash l1' with
          | Some t2 => if Muldiv.eqb t1 t2 then Some t1 else None
          | None => None
          end
      | nil => Some t1
      end
  end.

End MultiMuldiv.



Module multi_muldiv_exp := MultiMuldiv muldiv_exp.

Module multi_muldiv_base := MultiMuldiv muldiv_base.

Module MultiMuldivTest.

Definition tm1 := TBinOp TERM.RMinus (TBinOp TERM.RPlus
(TBinOp TERM.RMult (TVar "a") (TVar "b")) (TBinOp TERM.RMult (TVar "a") (TVar "c")))
(TBinOp TERM.RMult (TVar "a") (TVar "d")).

Definition tm2 := TBinOp TERM.RMinus (TBinOp TERM.RPlus
((TVar "b")) ((TVar "c")))
((TVar "d")).

Compute multi_muldiv_exp.diff (multi_muldiv_exp.eval tm1) (multi_muldiv_exp.eval tm2).

End MultiMuldivTest.


(* 一个支持无穷的计算器 *)
Fixpoint infinity_calculator (tm : term) : term :=
  match tm with
  | TUnOp u t1 =>
       match infinity_calculator t1 with
       | TNum z =>
            match u with
            | TERM.RAbs | TERM.ZCeil | TERM.ZFloor => TNum z
            | _ => TUnOp u (TNum z)
            end
       | TInfty i =>
            match u with
            | TERM.RAbs => TInfty TERM.Positive_Infty
            | TERM.RNeg => TInfty (TERM.Infty_opposite i)
            | TERM.RLn | TERM.ZCeil | TERM.ZFloor => TInfty i
            | _ => TUnOp u (TInfty i)
            end
       | tm1 => TUnOp u tm1
       end
  | TBinOp b t1 t2 =>
       match infinity_calculator t1, infinity_calculator t2 with
       | TNum z1, TNum z2 =>
            match b with
            | TERM.RMult => TNum (z1 * z2)
            | TERM.RPlus => TNum (z1 + z2)
            | TERM.RMinus => TNum (z1 - z2)
            | TERM.RPower => TNum (z1 ^ z2)
            | TERM.RMax => TNum (Z.max z1 z2)
            | TERM.RMin => TNum (Z.min z1 z2)
            | _ => TBinOp b (TNum z1) (TNum z2)
            end
       | TInfty i1, TInfty i2 =>
            match b with
            | TERM.RMult =>
                 match i1, i2 with
                 | TERM.Positive_Infty, TERM.Positive_Infty => TInfty TERM.Positive_Infty
                 | TERM.Positive_Infty, TERM.Negative_Infty => TInfty TERM.Negative_Infty
                 | TERM.Negative_Infty, TERM.Positive_Infty => TInfty TERM.Negative_Infty
                 | TERM.Negative_Infty, TERM.Negative_Infty => TInfty TERM.Positive_Infty
                 end
            | TERM.RPlus =>
                 match i1, i2 with
                 | TERM.Positive_Infty, TERM.Positive_Infty => TInfty TERM.Positive_Infty
                 | TERM.Positive_Infty, TERM.Negative_Infty | TERM.Negative_Infty, TERM.Positive_Infty => TBinOp b (TInfty i1) (TInfty i2)
                 | TERM.Negative_Infty, TERM.Negative_Infty => TInfty TERM.Negative_Infty
                 end
            | TERM.RMinus =>
                 match i1, i2 with
                 | TERM.Positive_Infty, TERM.Positive_Infty | TERM.Negative_Infty, TERM.Negative_Infty => TBinOp b (TInfty i1) (TInfty i2)
                 | TERM.Positive_Infty, TERM.Negative_Infty => TInfty TERM.Positive_Infty
                 | TERM.Negative_Infty, TERM.Positive_Infty => TInfty TERM.Negative_Infty
                 end
            | TERM.RPower =>
                 match i1, i2 with
                 | TERM.Positive_Infty, TERM.Positive_Infty => TInfty TERM.Positive_Infty
                 | TERM.Positive_Infty, TERM.Negative_Infty | TERM.Negative_Infty, TERM.Negative_Infty => TNum 0
                 | TERM.Negative_Infty, TERM.Positive_Infty => TBinOp b (TInfty i1) (TInfty i2)
                 end
            | TERM.RMax =>
                 match i1, i2 with
                 | TERM.Positive_Infty, TERM.Positive_Infty => TInfty TERM.Positive_Infty
                 | TERM.Positive_Infty, TERM.Negative_Infty => TInfty TERM.Positive_Infty
                 | TERM.Negative_Infty, TERM.Positive_Infty => TInfty TERM.Positive_Infty
                 | TERM.Negative_Infty, TERM.Negative_Infty => TInfty TERM.Negative_Infty
                 end
            | TERM.RMin =>
                 match i1, i2 with
                 | TERM.Positive_Infty, TERM.Positive_Infty => TInfty TERM.Positive_Infty
                 | TERM.Positive_Infty, TERM.Negative_Infty => TInfty TERM.Negative_Infty
                 | TERM.Negative_Infty, TERM.Positive_Infty => TInfty TERM.Negative_Infty
                 | TERM.Negative_Infty, TERM.Negative_Infty => TInfty TERM.Negative_Infty
                 end
            | _ => TBinOp b (TInfty i1) (TInfty i2) 
            end
       | tm', TInfty i =>
            match b with
            | TERM.RDiv => TNum 0
            | TERM.RMult =>
                 if term_is_certain_positive tm' then TInfty i
                 else if term_is_certain_negative tm' then TInfty (TERM.Infty_opposite i)
                 else TBinOp b tm' (TInfty i)
            | TERM.RPlus => TInfty i
            | TERM.RMinus => TInfty (TERM.Infty_opposite i)
            | TERM.RMax => if TERM.Infty_eqb i TERM.Positive_Infty then TInfty TERM.Positive_Infty else tm'
            | TERM.RMin => if TERM.Infty_eqb i TERM.Negative_Infty then TInfty TERM.Negative_Infty else tm'
            | _ => TBinOp b tm' (TInfty i)
            end
       | TInfty i, tm' =>
            match b with
            | TERM.RDiv | TERM.RMult =>
                 if term_is_certain_positive tm' then TInfty i
                 else if term_is_certain_negative tm' then TInfty (TERM.Infty_opposite i)
                 else TBinOp b (TInfty i) tm'
            | TERM.RPlus => TInfty i
            | TERM.RMinus => TInfty (TERM.Infty_opposite i)
            | TERM.RPower =>
                 if term_is_certain_positive tm' then TInfty i
                 else if term_is_certain_negative tm' then TNum 0
                 else TBinOp b tm' (TInfty i)
            | TERM.RMax => if TERM.Infty_eqb i TERM.Positive_Infty then TInfty TERM.Positive_Infty else tm'
            | TERM.RMin => if TERM.Infty_eqb i TERM.Negative_Infty then TInfty TERM.Negative_Infty else tm'
            | _ => TBinOp b (TInfty i) tm'
            end
       | tm1, tm2 => TBinOp b tm1 tm2
       end
  | _ => tm
  end.

Compute infinity_calculator (TBinOp TERM.RPlus (TNum 1) (TBinOp TERM.RMinus (TBinOp TERM.RDiv (TNum 1) (TInfty TERM.Positive_Infty)) (TBinOp TERM.RDiv (TNum 2) (TInfty TERM.Positive_Infty)))).

Compute rational_eval (TBinOp TERM.RDiv (TBinOp TERM.RDiv (TBinOp TERM.RMult (TNum 3) (TBinOp TERM.RPlus (TVar "x") (TVar "y"))) (TBinOp TERM.RMult (TNum 2) (TBinOp TERM.RPlus (TVar "z") (TVar "w")))) (TBinOp TERM.RPlus (TVar "x") (TVar "y"))).