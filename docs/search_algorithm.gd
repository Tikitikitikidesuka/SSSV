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