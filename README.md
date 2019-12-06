## Authors
Robin Vonk -- robinvonk789@gmail.com\
Michel Rummens -- michelrummens@gmail.com

# Expert Systems Example

## Test
Find all cousins of Robin Vonk. \
Returns: Nieces = [sanna_vonk, kimberly_vonk, miranda_vonk, cynthia_dekker].

```shell script
nieces_of(robin_vonk, Nieces).
```

Find all aunts of Robin Vonk. \
Returns: List = [marjanne_dekker].
```shell script
aunts_of(robin_vonk, Aunts).
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
