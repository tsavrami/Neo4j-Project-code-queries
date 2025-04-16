////////////////////////////////////////////////
//// Assigns t:Trainer HAS_POKE p:Pokemon 

// For every Pokemon...
match (p: Pokemon)

// Check every trainer
match (t: Trainer)
where (
    t.Poke1 = p.name OR
    t.Poke2 = p.name OR
    t.Poke3 = p.name OR
    t.Poke4 = p.name OR
    t.Poke5 = p.name OR
    t.Poke6 = p.name
)

// Create the relation
merge (t)-[:HAS_POKE]->(p);
                                            ////
////////////////////////////////////////////////

////////////////////////////////////////////////
////
                                            ////
////////////////////////////////////////////////