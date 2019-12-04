#Expert Systems Example

## Test
Find all cousins of Robin Vonk. \
Returns: List = [sanna_vonk, kimberly_vonk, patrick_vonk, dennis_vonk, miranda_vonk, cynthia_dekker, jeffrey_dekker, gijs_dekker, melle_dekker].
```shell script
findall(Y, cousin_of(robin_vonk, Y), List).
```

Find all aunts of Robin Vonk. \
Returns: List = [marjanne_dekker].
```shell script
findall(Y, aunt_of(robin_vonk, Y), List).
```

Find first occurrence of an uncle of Robin Vonk. \
Returns: X = alfred_vonk 
```shell script
uncle_of(X, robin_vonk).
```

Check if Lara Vonk is a brother of Robin Vonk. \
Returns: False
```shell script
brother_of(robin_vonk, lara_vonk).
```

Check if Lara Vonk is a sister of Robin Vonk. \
Returns: True
```shell script
sister_of(robin_vonk, lara_vonk).
```

Find all grandchildren of Henk Vonk. \
Returns: List = [robin_vonk, lara_vonk, sanna_vonk, kimberly_vonk, patrick_vonk, dennis_vonk, miranda_vonk].
```shell script
findall(Y, grandchild_of(henk_vonk, Y), List).
```
## Family tree
![](img/FamilyTree.jpeg)