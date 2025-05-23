// Loads and/or creates Pokemon and Type (and relevant relationships)

///////////////////////////////////////////////////////////////////////////////
//// Load Pokemon data from .csv

LOAD CSV WITH HEADERS FROM 'file:///pokemon_reformatted.csv' AS row
with 
  coalesce(row.Name, '') AS name,
  toInteger(coalesce(row.`Dex Number`, '0')) AS `Dex Number`,
  coalesce(row.Gen, '') AS `Gen`,
  coalesce(row.`Type 1`, '') AS `Type 1`,
  coalesce(row.`Type 2`, '') AS `Type 2`,
  coalesce(row.Classification, '') AS `Classification`,
  toFloat(coalesce(row.`Height (meters)`, '0')) AS `Height (meters)`,
  toFloat(coalesce(row.`Weight (kg)`, '0')) AS `Weight (kg)`,
  toInteger(coalesce(row.BST, '0')) AS `BST`,
  toInteger(coalesce(row.HP, '0')) AS `HP`,
  toInteger(coalesce(row.Attack, '0')) AS `Attack`,
  toInteger(coalesce(row.Defense, '0')) AS `Defense`,
  toInteger(coalesce(row.`Special Atk.`, '0')) AS `Special Atk.`,
  toInteger(coalesce(row.`Special Def.`, '0')) AS `Special Def.`,
  toInteger(coalesce(row.Speed, '0')) AS `Speed`,
  coalesce(row.`Ability 1`, '') AS `Ability 1`,
  coalesce(row.`Ability 2`, '') AS `Ability 2`,
  coalesce(row.`Ability 3`, '') AS `Ability 3`,
  coalesce(row.`Ability Hidden`, '') AS `Ability Hidden`,
  toInteger(coalesce(row.`Psuedo-legendary`, '0')) AS `Psuedo-legendary`,
  toInteger(coalesce(row.Legendary, '0')) AS `Legendary`,
  toInteger(coalesce(row.Mythical, '0')) AS `Mythical`,
  coalesce(row.`Base Evolution`, '') AS `Base Evolution`,
  coalesce(row.`Stage 1 Evolution`, '') AS `Stage 1 Evolution`,
  coalesce(row.`Stage 2 Evolution`, '') AS `Stage 2 Evolution`,
  coalesce(row.`Flavor text`, '') AS `Flavor text`
merge (poke: Pokemon { name: name })
set poke += {
  `Dex Number`: `Dex Number`,
  `Gen`: `Gen`,
  `Type 1`: `Type 1`,
  `Type 2`: `Type 2`,
  `Classification`: `Classification`,
  `Height (meters)`: `Height (meters)`,
  `Weight (kg)`: `Weight (kg)`,
  `BST`: `BST`,
  `HP`: `HP`,
  `Attack`: `Attack`,
  `Defense`: `Defense`,
  `Special Atk.`: `Special Atk.`,
  `Special Def.`: `Special Def.`,
  `Speed`: `Speed`,
  `Ability 1`: `Ability 1`,
  `Ability 2`: `Ability 2`,
  `Ability 3`: `Ability 3`,
  `Ability Hidden`: `Ability Hidden`,
  `Psuedo-legendary`: `Psuedo-legendary`,
  `Legendary`: `Legendary`,
  `Mythical`: `Mythical`,
  `Base Evolution`: `Base Evolution`,
  `Stage 1 Evolution`: `Stage 1 Evolution`,
  `Stage 2 Evolution`: `Stage 2 Evolution`,
  `Flavor text`: `Flavor text`
};
                                                                           ////
///////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////
//// Load type data from .csv, then create HAS_TYPE relationships

LOAD CSV WITH HEADERS FROM 'file:///pokemontypes.csv' AS row
with row
merge (n: Type { name: row.`name`});
                                                                           ////
///////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////
//// Assigns p:Pokemon IS_TYPE t:type

// For each type...
match(t: Type)

// Check every Pokemon's 1st and 2nd type
match(p: Pokemon)
where (
	p.`Type 1` contains t.name
	OR p.`Type 2` contains t.name
)

// Create the relationships
merge (p)-[:HAS_TYPE]->(t);
                                                                           ////
///////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////
//// Assigns p:Pokemon EVOLVES_FROM p:Pokemon

// Create EVOLVES_FROM from stage 1 (connects to base)
// Get var 1
match (p: Pokemon)
where (
	p.`Stage 1 Evolution` = p.name				// Is the correct stage of the evol family
	AND p.name = p.name							// Not a different member of evol family
)

// Get var 2
match (prev: Pokemon)
where prev.name = p.`Base Evolution` 			// gets the correct enitity

// create the relation
merge (p)-[:EVOLVES_FROM]->(prev);

// Create EVOLVES_FROM from stage 2 (connects to stage 1)
// Get var 1
match (p: Pokemon)
where (
	p.`Stage 2 Evolution` = p.name				// Is the correct stage of the evol family
	AND p.name = p.name							// Not a different member of evol family
)

// Get var 2
match (prev: Pokemon)
where prev.name = p.`Stage 1 Evolution` 		// gets the correct enitity

// create the relation
merge (p)-[:EVOLVES_FROM]->(prev);
                                                                           ////
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
//// 
                                                                           ////
///////////////////////////////////////////////////////////////////////////////