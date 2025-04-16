// The big one
match (n)-[r]-(m)
where (
    (n:Pokemon AND n.Gen IN ['I', 'II', 'III', 'IV']) OR
    n:Trainer OR
    n:`Trainer Class` OR
    n:`Type`
) AND (
    (m:Pokemon AND m.Gen IN ['I', 'II', 'III', 'IV']) OR
    m:Trainer OR
    m:`Trainer Class` OR
    m:`Type`
)
return distinct n, r, m;