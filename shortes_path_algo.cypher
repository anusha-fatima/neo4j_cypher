// The following statement will project a graph using a native projection and store it in the graph catalog under the name 'myGraph'.
CALL gds.graph.project(
    'myGraph',
    'Location',
    'ROAD',
    {
        relationshipProperties: 'cost'
    }
)

// The following will run the algorithm and stream results
MATCH (source:Location {name: 'A'})
CALL gds.allShortestPaths.delta.stream('myGraph', {
    sourceNode: source,
    relationshipWeightProperty: 'cost',
    delta: 3.0
})
YIELD index, sourceNode, targetNode, totalCost, nodeIds, costs, path
RETURN
    index,
    gds.util.asNode(sourceNode).name AS sourceNodeName,
    gds.util.asNode(targetNode).name AS targetNodeName,
    totalCost,
    [nodeId IN nodeIds | gds.util.asNode(nodeId).name] AS nodeNames,
    costs,
    nodes(path) as path
ORDER BY index
