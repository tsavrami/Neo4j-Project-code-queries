// match (c:`Trainer Class`)<-[r_c:IS_CLASS]-(t:Trainer)-[r_p:HAS_POKE]->(p) where p.Gen IN ['I', 'II', 'III', 'IV'] return c, t, p, r_c, r_p

///////////////////////////////////////////////////////////////////////////////
//// Get the amount of trainer types assigned per Pokemon

match (c:`Trainer Class`)<-[:IS_CLASS]-(t:Trainer)-[:HAS_POKE]->(p:Pokemon)
where p.Gen IN ['I', 'II', 'III', 'IV']
return
	c.name AS `Trainer Class:`,
	p.name AS `Pokemon`,
	count(DISTINCT t) AS `Amount of trainers having...`
order by
	`Amount of trainers having...` DESC,
	`Trainer Class:` ASC,
	`Pokemon`
                                                                           ////
///////////////////////////////////////////////////////////////////////////////