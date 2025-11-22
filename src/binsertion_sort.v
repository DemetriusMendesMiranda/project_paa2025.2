Require Import List.
Require Import Sorted.
Require Import Permutation.
Require Import Arith.
Import ListNotations.

Require Import binsert.
Require Import binsert_prime.

Fixpoint binsertion_sort (l: list nat) :=
  match l with
  | [] => []
  | h::tl => binsert h (binsertion_sort tl)
  end.


src/main_theorem.v:
====================
Require Import List.
Require Import Sorted.
Require Import Permutation.
Require Import Arith.
Import ListNotations.

Require Import binsertion_sort.

Theorem binsertion_sort_correct: forall l,
  Sorted le (binsertion_sort l) /\
  Permutation l (binsertion_sort l).
Proof.
Admitted.
