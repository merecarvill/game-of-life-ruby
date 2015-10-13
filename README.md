# Conway's Game of Life

Run in the command line using executable ```gol``` located in 'bin/'

Arguments are:
- Number of generations to render. e.g. '5'
- Coordinates of the bottom right corner of the 2D grid to display. The upper left corner will always be [0, 0]. e.g. '8-8'
- All cordinates that should start as living. e.g. '4-3,4-4,4-5'

Thus, an example line you might run in the command line from the root directory might be:

```bin/gol 5 8-8 4-3,4-4,4-5```

This example would run for 5 generations, render an 9x9 window into the 2D grid (from [0, 0] in the upper left to [8, 8] in the bottom right), and begin the first generation with living cells at [4, 3], [4, 4], and [4, 5].

Note that you're rendering a window into an infinte grid. There's nothing preventing live cells from migrating outside of the space you're viewing. There's also no reason why you couldn't render a window that goes into the negative coordinate space, except that I'm lazy. You'll probably break things if you enter negative coordinates for anything.