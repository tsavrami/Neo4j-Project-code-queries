// Print the graph
match (p: Pokemon)-[r:HAS_TYPE]->(t: Type)
return p, r, t;