// Projects all the necessary graphs for the demo
// https://neo4j.com/docs/graph-data-science/current/management-ops/graph-creation/graph-project/

///////////////////////////////////////////////////////////////////////////////
//// Project a Types<-->Pokemon graph

CALL gds.graph.project(
	'pokemonTypeGraph',
	['Pokemon', 'Type'],
	{ HAS_TYPE: {orientation: 'UNDIRECTED'} }
);
                                                                           ////
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
//// Project Trainer-->Pokemon graph

call gds.graph.project(
	'trainerPokemonGraph',
	['Trainer', 'Pokemon'],
	{ HAS_POKE: { orientation: 'UNDIRECTED' } }
);
                                                                           ////
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
//// Project Trainer class<--Trainer-->Pokemon graph

call{
	match (source: Pokemon)
	where source: `Pokemon` AND (source.Gen IN ["I", "II", "III", "IV"])
	return source
	union
	match (source: Trainer)
	return source
	union
	match (source: `Trainer Class`)
	return source
}
optional match (source: Trainer)-[r:IS_CLASS|HAS_POKE]->(target: `Trainer Class`|Pokemon)
with gds.graph.project(
	'classTrainerPokemonGraph',
	source,
	target,
	{
		sourceNodeLabels: labels(source),
		targetNodeLabels: labels(target),
		relationshipType: type(r)
	}
) AS g
return
	g.graphName AS graph,
	g.nodeCount AS nodes,
	g.relationshipCount AS rels;
                                                                           ////
///////////////////////////////////////////////////////////////////////////////
