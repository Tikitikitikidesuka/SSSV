# Developing Custom Algorithms

A [custom algorithm `gdscript` file containing the basic search algorithm structure](search_algorithm.gd) can be found among the documentation. It's code is as follows:
```gdscript
# Extend BaseSearchAlgorithm to have useful methods
extends "res://Code/BaseSearchAlgorithm.gd"

# Code run when algorithm is instantiated
func _init(newGraph2D).(newGraph2D):
	pass

# Expand method takes CP and path as parameters:
#
# CP: List with all paths to consider in the future.
# path: Path being checked in the expand method call.
#
# The method should add, in some way, neighbour tiles to the last one in path.
func expand(CP, path):
	pass
```

The `expand` method is the most important. It must modify CP so that it contains the paths that should be considered in next steps.
-   `CP` contains the all the paths to consider in the future.
-   `path` contains the path being checked in the current expand method call.

## Algorithm Usage
The Graph2DSearch class will use the algorithm defined:
1.  It initializes `CP` to contain a path containing only the start node.
2.  While `CP` isn't empty:
    1.  The first path of `CP` is extracted as `path`.
    2.  If `path` reaches the end node, a solution has been found.
    3.  If not, the algorithm's `expand` method is called with `CP` and `path` as parameters.
3.  If `CP` is empty, there are no solutions to the problem.


# Adding Custom Algorithms

Adding custom algorithms is simple. Just place the algorithm's `gdscript` file in the `Code/SearchAlgorithms` directory. All algorithms in the directory will be automatically added to the algorithm menu at runtime.