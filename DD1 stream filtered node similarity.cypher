// match (t:Trainer)-[r_p:HAS_POKE]->(p) where p.Gen IN ['I', 'II', 'III', 'IV'] return t, p, r_p
// https://neo4j.com/docs/graph-data-science/current/algorithms/filtered-node-similarity/

///////////////////////////////////////////////////////////////////////////////
//// Demonstrates filtered node similarity algorithm

CALL gds.nodeSimilarity.filtered.stream(
	'trainerPokemonGraph',
	{sourceNodeFilter:'Trainer', targetNodeFilter:'Trainer' }
	)
YIELD
	node1,
	node2,
	similarity
RETURN
	gds.util.asNode(node1).name AS `Trainer A`,
	gds.util.asNode(node2).name AS `Trainer B`,
	similarity AS `Similarity`
ORDER BY
	`Similarity` DESC,
	`Trainer A`,
	`Trainer B`
                                                                           ////
///////////////////////////////////////////////////////////////////////////////