Require Import List.
Require Import Sorted.
Require Import Permutation.
Require Import Arith.
Import ListNotations.


Require Import binsertion_sort.


Theorem binsertion_sort_correct : forall l,
Sorted le (binsertion_sort l) /\
Permutation l (binsertion_sort l).
Proof.
Admitted.