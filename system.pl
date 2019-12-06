
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
female(stefanie_vonk).
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
female(geerie_vonk).


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

parent_of(robin_vonk, spruit_vonk).
parent_of(maan_roos_moeskops, spruit_vonk).
parent_of(robin_vonk, bloempje_vonk).
parent_of(maan_roos_moeskops, bloempje_vonk).


/* gen 2 to gen 3 */
parent_of(edwin_vonk, robin_vonk).
parent_of(simone_dekker, robin_vonk).
parent_of(edwin_vonk, lara_vonk).
parent_of(simone_dekker, lara_vonk).

parent_of(alfred_vonk, sanna_vonk).
parent_of(annemiek_vonk, sanna_vonk).

parent_of(dirk_vonk, dennis_vonk).
parent_of(marie_vonk, dennis_vonk).
parent_of(dirk_vonk, miranda_vonk).
parent_of(marie_vonk, miranda_vonk).

parent_of(willem_vonk, kimberly_vonk).
parent_of(geerie_vonk, kimberly_vonk).
parent_of(willem_vonk, stefanie_vonk).
parent_of(geerie_vonk, stefanie_vonk).
parent_of(willem_vonk, patrick_vonk).
parent_of(geerie_vonk, patrick_vonk).

parent_of(marjanne_dekker, cynthia_dekker).
parent_of(gerard_dekker, cynthia_dekker).
parent_of(marjanne_dekker, jeffrey_dekker).
parent_of(gerard_dekker, jeffrey_dekker).

parent_of(ben_dekker, gijs_dekker).
parent_of(jolanda_dekker, gijs_dekker).
parent_of(ben_dekker, melle_dekker).
parent_of(jolanda_dekker, melle_dekker).


/* gen 1 to gen 2 */
parent_of(henk_vonk, edwin_vonk).
parent_of(greet_vonk, edwin_vonk).
parent_of(henk_vonk, alfred_vonk).
parent_of(greet_vonk, alfred_vonk).
parent_of(henk_vonk, willem_vonk).
parent_of(greet_vonk, willem_vonk).
parent_of(henk_vonk, dirk_vonk).
parent_of(greet_vonk, dirk_vonk).

parent_of(siem_dekker, simone_dekker).
parent_of(sien_dekker, simone_dekker).
parent_of(siem_dekker, marjanne_dekker).
parent_of(sien_dekker, marjanne_dekker).
parent_of(siem_dekker, ben_dekker).
parent_of(sien_dekker, ben_dekker).


/* Rules */
cousin_of(X,Y):-
    uncle_aunt_of(Z,X),
    child_of(Z,Y).

child_of(X,Y):-
    parent_of(X, Y).

male_child_of(X,Y):- male(Y),
    parent_of(X, Y).

female_child_of(X,Y):- female(Y),
    parent_of(X, Y).

grandchild_of(X,Y):-
    parent_of(X, Z),
    parent_of(Z, Y).

male_grandchild_of(X,Y):- male(Y),
    parent_of(X, Z),
    parent_of(Z, Y).

female_grandchild_of(X,Y):- female(Y),
    parent_of(X, Z),
    parent_of(Z, Y).

male_parent_of(X,Y):- male(X),
    parent_of(X,Y).

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

