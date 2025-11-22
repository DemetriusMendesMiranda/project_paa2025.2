Require Import List.
Import ListNotations.


Fixpoint insert_at i (x:nat) l :=
match i with
| 0 => x::l
| S k => match l with
| nil => [x]
| h::tl => h::(insert_at k x tl)
end
end.


Eval compute in (insert_at 2 3 [1;2;3]).


(* Lemmas a serem provados *)
(* length (insert_at i x l) = S (length l) *)
(* Permutation (x :: l) (insert_at i x l) *)




src/binsert.v:
==============
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


Theorem binsert_correct: forall l x, Sorted le l -> Sorted le (binsert x l).
Admitted.