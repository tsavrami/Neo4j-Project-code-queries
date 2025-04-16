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