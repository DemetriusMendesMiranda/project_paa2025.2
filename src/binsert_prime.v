Require Import List.
Function binsert' x l {measure length l} :=
match l with
| [] => [x]
| [y] => if (x <=? y) then [x; y] else [y; x]
| h1::h2::tl =>
let len := length l in
let mid := len / 2 in
let l1 := firstn mid l in
let l2 := skipn mid l in
match l2 with
| [] => l
| h2'::l2' => if x =? h2'
then l1 ++ (x ::l2)
else if x <? h2'
then binsert' x l1
else binsert' x l2
end
end.
Proof.
- intros. rewrite firstn_length_le.
+ simpl length. apply Nat.div_lt; lia.
+ simpl length. apply Nat.lt_le_incl. apply Nat.div_lt; lia.
- intros. rewrite <- teq1. rewrite length_skipn.
apply Nat.sub_lt.
+ simpl length. apply Nat.lt_le_incl. apply Nat.div_lt; lia.
+ simpl length. apply Nat.div_str_pos; lia.
Defined.


Lemma teste0: (binsert' 2 [1;2;3]) = [1;2;2;3].
Proof.
rewrite binsert'_equation. simpl. reflexivity.
Qed.


Lemma binsert_equiv_binsert': forall l x,
binsert x l = binsert' x l.
Admitted.


Corollary binsert'_correct: forall l x, Sorted le l -> Sorted le (binsert' x l).
Proof.
intros l x H. rewrite <- binsert_equiv_binsert'. apply binsert_correct. assumption.
Qed.