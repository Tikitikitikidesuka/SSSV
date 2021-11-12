# State Space Search Visualizer

SSSV makes understanding state space search algorithms intuitive. It represents a state space as a maze such that each state is a tile. The algorithm's goal is to go from the start tile, the inital state, to the end tile, the solution state.

## Features

-   **Algorithm selector** that lets the user choose among the assortment of algorithms found in `Code/SearchAlgorithms`.

    ![option menu](docs/images/option_menu.gif)

-   **Maze editor** which allows the user to change any tile into a path or a wall.

    ![edit](docs/images/edit.gif)

-   **Precise controls** let the user step through each step of the algorithm.

    ![controls](docs/images/control_menu.gif)

## Algorithms

Currently SSSV ships with six different algorithms:
-   **Breadth First**
-   **Depth First**
-   **Branch and Bound**
-   **Best First**
-   **Hill Climbing**
-   **A\***

Adding custom algorithms is simple. The algorithm's `gd` file just needs to be placed in the `Code/SearchAlgorithms` directory.
For a more detailed explanation on developing and adding custom algorithms, refer to the [custom algorithms documentation](docs/custom_algorithms.md).