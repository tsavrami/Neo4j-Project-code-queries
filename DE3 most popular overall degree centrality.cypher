// match (t:Trainer)-[r_p:HAS_POKE]->(p) where p.Gen IN ['I', 'II', 'III', 'IV'] return t, p, r_p
// Creates a graph of Pokemon, and trainers
// find each Pokemon's degree == how many trainers have that pokemon, to find which is most popular
// https://neo4j.com/docs/graph-data-science/current/algorithms/degree-centrality/
///////////////////////////////////////////////////////////////////////////////
//// Find overall Pokemon popularity using gds.degree.stream function

CALL gds.degree.stream('trainerPokemonGraph')
YIELD
	nodeId,
	score
WITH
	gds.util.asNode(nodeId) AS p,
	score
WHERE
	p: Pokemon
	AND p.Gen IN ['I', 'II', 'III', 'IV']
RETURN
	p.name AS Pokemon,
	score AS Frequency
ORDER BY Frequency DESC;
                                                                           ////
///////////////////////////////////////////////////////////////////////////////