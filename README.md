# State Space Search Visualizer

SSSV makes understanding state space search algorithms intuitive. It represents a state space as a maze such that each state is a tile. The algorithm's goal is to go from the start tile, the inital state, to the end tile, the solution state.

## Features

-   **Algorithm selector** that lets the user choose among the assortment of algorithms found in `Code/SearchAlgorithms`.

    ![option menu](docs/images/option_menu.gif)

-   **Maze editor** which allows the user to change any tile into a path or a wall.

    ![edit](docs/images/edit.gif)

-   **Precise controls** let the user step incrementally through the search algorithm.

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

## Dependencies
This project was made using the [Godot Game Engine](https://godotengine.org/). A free and open source game engine, I would very much recommend checking out. Its github page can be found [here](https://github.com/godotengine/godot).
<p align="center">
  <a href="https://godotengine.org">
    <img src="https://github.com/godotengine/godot/raw/master/logo_outlined.svg" width="400" alt="Godot Engine logo">
  </a>
</p>

## Authors
This project was developed by:
* SneakyGerbil
    * deesneakygerbil@gmail.com
    * [Itch.io](https://sneakygerbil.itch.io)
    * [YouTube](https://www.youtube.com/channel/UC4r_WrJ5SXjd10lFQdO3UyQ)
    * [GitHub](https://github.com/SneakyGerbil)

## License
Shield: [![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg