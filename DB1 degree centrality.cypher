// Creates a graph of Pokemon Types and Pokemon and finds the Degree Centrality
// aka how many entities are related to this type, so how many Pokemon HAS_TYPE that specific type
// https://neo4j.com/docs/graph-data-science/current/algorithms/degree-centrality/

///////////////////////////////////////////////////////////////////////////////
//// Demonstrates degree centrality algorithm

CALL gds.degree.stream('pokemonTypeGraph')
YIELD nodeId, score
WITH gds.util.asNode(nodeId) AS node, score
WHERE 'Type' IN labels(node)
RETURN node.name AS type, score AS `Number of Pokemon`
ORDER BY score DESC;
                                                                           ////
///////////////////////////////////////////////////////////////////////////////