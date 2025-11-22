Require Import List.
let mid := len / 2 in
let l1 := firstn mid l in
let l2 := skipn mid l in
match l2 with
| [] => 0
| h2'::l2' =>
if (x <? h2') then bsearch x l1
else if x =? h2' then mid
else mid + (bsearch x l2)
end
end.
Proof.
- intros. rewrite firstn_length_le.
+ simpl length. apply Nat.div_lt; lia.
+ simpl length. apply Nat.lt_le_incl. apply Nat.div_lt; lia.
- intros. rewrite <- teq1. rewrite length_skipn. simpl length.
apply Nat.sub_lt.
+ apply Nat.lt_le_incl. apply Nat.div_lt; lia.
+ apply Nat.div_str_pos; lia.
Defined.


Lemma test0: bsearch 1 [] = 0.
Proof. rewrite bsearch_equation. reflexivity. Qed.


Lemma test1: bsearch 1 [0;2;3] = 1.
Proof.
rewrite bsearch_equation. simpl.
rewrite bsearch_equation. destruct (1 <=? 0) eqn: H.
- inversion H.
- reflexivity.
Qed.


Lemma test2: bsearch 2 [0;2;3] = 1.
Proof. rewrite bsearch_equation. simpl. reflexivity. Qed.


Lemma test3: bsearch 2 [0;2;3;4] = 1.
Proof.
rewrite bsearch_equation. simpl.
rewrite bsearch_equation. simpl. reflexivity.
Qed.


Lemma test4: bsearch 3 [0;1;2;3;4;5] = 3.
Proof.
rewrite bsearch_equation. simpl. reflexivity.
Qed.


Lemma bsearch_valid_pos: forall l x, 0 <= bsearch x l < length l.
Admitted.