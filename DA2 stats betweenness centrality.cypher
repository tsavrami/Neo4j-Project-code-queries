// Creates a graph of Pokemon Types and Pokemon and finds the Betweenness Centrality using all modes
// Aka, which type is the most 'central' in the expanded graph, which doesn't really mean anything
// https://neo4j.com/docs/graph-data-science/current/algorithms/betweenness-centrality/

///////////////////////////////////////////////////////////////////////////////
//// Demonstrate the stats mode

CALL gds.betweenness.stats('pokemonTypeGraph')
YIELD centralityDistribution
RETURN centralityDistribution.min AS minimumScore, centralityDistribution.mean AS meanScore;
                                                                           ////
///////////////////////////////////////////////////////////////////////////////