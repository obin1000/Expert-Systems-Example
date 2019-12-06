
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
cousin_of(X,Y):-
    uncle_aunt_of(Z,X),
    child_of(Z,Y).

child_of(X,Y):-
    parent_of(X, Y).

male_child_of(X,Y):-
    parent_of(X, Y),
    male(Y).

female_child_of(X,Y):-
    parent_of(X, Y),
    female(Y).

grandchild_of(X,Y):-
    parent_of(X, Z),
    parent_of(Z, Y).

male_grandchild_of(X,Y):-
    parent_of(X, Z),
    parent_of(Z, Y),
    male(Y).

female_grandchild_of(X,Y):-
    parent_of(X, Z),
    parent_of(Z, Y),
    female(Y).

male_parent_of(X,Y):-
    parent_of(X,Y),
    male(X).

female_parent_of(X,Y):- female(X),
    parent_of(X,Y).

other_parent_of(X,Y):- other(X),
    parent_of(X,Y).

grandfather_of(X,Y):- male(X),
    parent_of(Z,Y),
    parent_of(X,Z).

grandmother_of(X,Y):- female(X),
    parent_of(X,Z),
    parent_of(Z,Y).

sibling_of(X, Y):-
    female_parent_of(M, Y), female_parent_of(M,X),X \= Y.

sister_of(X,Y):- female(X),
    female_parent_of(M, Y), female_parent_of(M,X),X \= Y.

aunt_of(X,Y):- female(X),
    parent_of(Z,Y), sister_of(Z,X),!.

brother_of(X,Y):- male(X),
    female_parent_of(M, Y), female_parent_of(M,X),X \= Y.

uncle_of(X, Y):-
    parent_of(Z,Y), brother_of(Z,X).

uncle_aunt_of(X,Y):-
    parent_of(Z,Y),
    sibling_of(Z,X).

ancestor_of(X,Y):- parent_of(X,Y).

ancestor_of(X,Y):- parent_of(X,Z),
    ancestor_of(Z,Y).

