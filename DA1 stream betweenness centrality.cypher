// Creates a graph of Pokemon Types and Pokemon and finds the Betweenness Centrality using all modes
// Aka, which type is the most 'central' in the expanded graph, which doesn't really mean anything
// https://neo4j.com/docs/graph-data-science/current/algorithms/betweenness-centrality/

///////////////////////////////////////////////////////////////////////////////
//// Demonstrate the stream mode

CALL gds.betweenness.stream('pokemonTypeGraph')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS node, score
WHERE 'Type' IN labels(node)
RETURN node.name AS type, score
ORDER BY score DESC;
                                                                           ////
///////////////////////////////////////////////////////////////////////////////