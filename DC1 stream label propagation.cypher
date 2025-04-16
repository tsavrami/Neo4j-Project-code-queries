// https://neo4j.com/docs/graph-data-science/current/algorithms/label-propagation/

///////////////////////////////////////////////////////////////////////////////
//// Demonstrates the label propagation algorithm

CALL gds.labelPropagation.stream('pokemonTypeGraph')
YIELD nodeId, communityId
WITH gds.util.asNode(nodeId) AS node, communityId
WHERE 'Type' IN labels(node)
RETURN
	node.name AS `Type`,
	communityId AS `Score`
ORDER BY `Score` DESC;
                                                                           ////
///////////////////////////////////////////////////////////////////////////////