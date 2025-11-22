Require Import List.
Require Import Sorted.
Require Import Permutation.
Require Import Arith.
Require Import Lia.
Import ListNotations.


Require Import bsearch.
Require Import insert_at.


Definition binsert x l :=
let pos := bsearch x l in
insert_at pos x l.


Theorem binsert_correct : forall l x,
Sorted le l -> Sorted le (binsert x l).
Admitted.


Theorem binsert_perm : forall l x,
Permutation (x :: l) (binsert x l).
Admitted.