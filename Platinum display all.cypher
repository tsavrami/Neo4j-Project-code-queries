// The big one
match(n)
where
    (n: Pokemon
        AND(
            n.Gen = 'I' OR
            n.Gen = 'II' OR
            n.Gen = 'III' OR
            n.Gen = 'IV'
        )
    ) OR (n: Trainer)
    OR (n: `Trainer Class`)
return n