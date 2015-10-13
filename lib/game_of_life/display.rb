module GameOfLife
  class Display
    LIVE_CELL_ICON = "[]"
    DEAD_CELL_ICON = ".."

    def initialize(bottom_right: [9, 9])
      @bottom_right = bottom_right
    end

    def run(world, generations)
      generations.times do
        system "clear"
        show(world)
        world = world.advance_generation
        sleep(0.5)
      end
    end

    def show(world)
      row_limit, col_limit = @bottom_right

      (0..row_limit).each do |row|
        (0..col_limit).each do |col|
          print_appropriate_icon(world, [row, col])
        end
        print "\n"
      end
    end

    def print_appropriate_icon(world, coordinates)
      if world.alive_at? coordinates
        print LIVE_CELL_ICON
      else
        print DEAD_CELL_ICON
      end
    end
  end
end