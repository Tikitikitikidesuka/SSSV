# BaseSearchAlgorithm Class

The `BaseSearchAlgorithm` class is extended by all search algorithms. It includes useful methods common to most search algorithms.

## Methods

-   `orderPathsByHeuristic(CP)`

    > Orders `CP`, which is a list of paths, by their heuristic value in descending order. The path's heuristic value is public and can be set at any time.

-   `orderPathsByCost(CP)`

    > Orders `CP`, which is a list of paths, by their cost in descending order. The path's cost value is public and can be set at any time.

-   `orderPathsByCostAndHeuristic(CP)`

    > Orders `CP`, which is a list of paths, by the sum of the path's cost and heuristic values in descending order. The path's cost and heuristic values are public and can be set at any time.