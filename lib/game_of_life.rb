require "game_of_life/version"
require "game_of_life/display"
require "game_of_life/world"

# RULES
# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by over-population.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
