// Creates a graph of Pokemon Types and Pokemon and finds the Betweenness Centrality using all modes
// Aka, which type is the most 'central' in the expanded graph, which doesn't really mean anything
// https://neo4j.com/docs/graph-data-science/current/algorithms/betweenness-centrality/

///////////////////////////////////////////////////////////////////////////////
////
CALL gds.betweenness.write('pokemonTypeGraph', { writeProperty: 'betweenness' })
YIELD centralityDistribution, nodePropertiesWritten
RETURN centralityDistribution.min AS minimumScore, centralityDistribution.mean AS meanScore, nodePropertiesWritten;

// Print the graph
match (p: Pokemon)-[r: HAS_TYPE]->(t:`Type`)
return p, t;
                                                                           ////
///////////////////////////////////////////////////////////////////////////////