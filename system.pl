
/* Facts */
/* gen 4 */
other(spruit_vonk).
female(bloempje_vonk).

/* gen 3, me */
male(robin_vonk).
female(maan_roos_moeskops).
female(lara_vonk).

female(sanna_vonk).

male(dennis_vonk).
female(miranda_vonk).

female(kimberly_vonk).
male(patrick_vonk).

male(jeffrey_dekker).
female(cynthia_dekker).

male(melle_dekker).
male(gijs_dekker).


/* gen 2 */
male(edwin_vonk).
female(simone_dekker).
male(alfred_vonk).
female(annemiek_vonk).
male(dirk_vonk).
female(marie_vonk).
male(willem_vonk).
female(kim_vonk).


female(marjanne_dekker).
male(gerard_dekker).
male(ben_dekker).
female(jolanda_dekker).

/* gen 1 */
male(henk_vonk).
female(greet_vonk).
male(siem_dekker).
female(sien_dekker).


/* gen 3 to gen 4 */

parent_of(spruit_vonk, robin_vonk).
parent_of(spruit_vonk, maan_roos_moeskops).
parent_of(bloempje_vonk, robin_vonk).
parent_of(bloempje_vonk, maan_roos_moeskops).


/* gen 2 to gen 3 */
parent_of(robin_vonk, edwin_vonk).
parent_of(robin_vonk, simone_dekker).
parent_of(lara_vonk, edwin_vonk).
parent_of(lara_vonk, simone_dekker).

parent_of(sanna_vonk, alfred_vonk).
parent_of(sanna_vonk, annemiek_vonk).

parent_of(dennis_vonk, dirk_vonk).
parent_of(dennis_vonk, marie_vonk).
parent_of(miranda_vonk, dirk_vonk).
parent_of(miranda_vonk, marie_vonk).

parent_of(kimberly_vonk, willem_vonk).
parent_of(kimberly_vonk, kim_vonk).
parent_of(patrick_vonk, willem_vonk).
parent_of(patrick_vonk, kim_vonk).

parent_of(cynthia_dekker, marjanne_dekker).
parent_of(cynthia_dekker, gerard_dekker).
parent_of(jeffrey_dekker, marjanne_dekker).
parent_of(jeffrey_dekker, gerard_dekker).

parent_of(gijs_dekker, ben_dekker).
parent_of(gijs_dekker, jolanda_dekker).
parent_of(melle_dekker, ben_dekker).
parent_of(melle_dekker, jolanda_dekker).

/* gen 1 to gen 2 */
parent_of(edwin_vonk, henk_vonk).
parent_of(edwin_vonk, greet_vonk).
parent_of(alfred_vonk, henk_vonk).
parent_of(alfred_vonk, greet_vonk).
parent_of(willem_vonk, henk_vonk).
parent_of(willem_vonk, greet_vonk).
parent_of(dirk_vonk, henk_vonk).
parent_of(dirk_vonk, greet_vonk).

parent_of(simone_dekker, siem_dekker).
parent_of(simone_dekker, sien_dekker).
parent_of(marjanne_dekker, siem_dekker).
parent_of(marjanne_dekker, sien_dekker).
parent_of(ben_dekker, siem_dekker).
parent_of(ben_dekker, sien_dekker).

/* Rules */

male_parent_of(Child, Parent):- male(Parent),
    parent_of(Child, Parent).

female_parent_of(X,Y):- female(Y),
    parent_of(X,Y).

other_parent_of(X,Y):- other(Y),
    parent_of(X,Y).

child_of(Parent, Child):-
    parent_of(Child, Parent).

male_child_of(Parent, Child):-
    parent_of(Child, Parent),
    male(Child).

female_child_of(Parent, Child):-
    parent_of(Child, Parent),
    female(Child).

other_child_of(Parent, Child):-
    parent_of(Child, Parent),
    other(Child).

male_children_of(Parent, Child):-
    findall(Child, male_child_of(Parent, Child), Child).

female_children_of(Parent, Child):-
    findall(Child, female_child_of(Parent, Child), Child).

grandchild_of(Parent, Child):-
    parent_of(Z, Parent),
    parent_of(Child, Z).

male_grandchild_of(Parent, Child):-
    parent_of(Z, Parent),
    parent_of(Child, Z),
    male(Child).

female_grandchild_of(Parent, Child):-
    parent_of(Z, Parent),
    parent_of(Child, Z),
    female(Child).

grandchildren_of(Parent, Child):-
    findall(Child, grandchild_of(Parent, Child), Child).

male_grandchildren_of(Parent, Child):-
    findall(Child, male_grandchild_of(Parent, Child), Child).

grandfather_of(Child, Parent):-
    parent_of(Child, DADDY),
    parent_of(DADDY, Parent),
    male(Parent).

grandmother_of(Child, Parent):-
    parent_of(Child, MOMMY),
    parent_of(MOMMY, Parent),
    female(Parent).

sibling_of(Person, Sibling):-
    female_parent_of(Sibling, M),
    female_parent_of(Person, M),
    Person \= Sibling.

siblings_of(Person, Sibling):-
    findall(Sibling, sibling_of(Person,Sibling), Sibling).

brother_of(Person, Sibling):-
    female_parent_of(Sibling, M),
    female_parent_of(Person, M),
    Person \= Sibling,
    male(Sibling).

sister_of(Person, Sibling):-
    female_parent_of(Sibling, M),
    female_parent_of(Person, M),
    Person \= Sibling,
    female(Sibling).

brothers_of(Person, Brother):-
    findall(Brother, brother_of(Person, Brother), Brother).

aunt_of(Person, Aunt):-
    parent_of(Person, Z),
    sister_of(Z, Aunt).

uncle_of(Person, Uncle):-
    parent_of(Person, Z),
    brother_of(Z, Uncle).

uncle_and_aunt_of(Person, UncleAndAunt):-
    parent_of(Person, Z),
    sibling_of(Z, UncleAndAunt).

uncles_and_aunts_of(Person, UnclesAndAunts):-
    findall(UnclesAndAunts, uncle_and_aunt_of(Person, UnclesAndAunts), UnclesAndAunts).

cousin_of(Person, Cousin):-
    uncle_and_aunt_of(Person, Z),
    female_child_of(Z, Cousin).

cousins_of(Person, Cousin):-
    findall(Cousin, cousin_of(Person, Cousin), Cousin).
