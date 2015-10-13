module GameOfLife
  class World
    def self.build(live_cell_locations:)
      World.new(live_cell_locations: live_cell_locations)
    end

    def alive_at?(location)
      @live_cell_locations.include?(location)
    end

    def advance_generation
      next_generation_live_cell_locations = remove_dying_cell_locations(@live_cell_locations)
      next_generation_live_cell_locations += new_live_locations(@live_cell_locations)

      World.build(live_cell_locations: next_generation_live_cell_locations)
    end

    private

    def initialize(live_cell_locations:)
      @live_cell_locations = live_cell_locations.uniq
    end

    def new_live_locations(live_cell_locations)
      potential_locations = live_cell_locations.map { |location| neighbors_of(location) }.flatten(1)
      potential_locations.select { |location| potential_locations.count(location) == 3 }.uniq
    end

    def remove_dying_cell_locations(live_cell_locations)
      live_cell_locations.reject do |location|
        underpopulated?(location) || overpopulated?(location)
      end
    end

    def underpopulated?(location)
      num_live_neighbors(location) < 2
    end

    def overpopulated?(location)
      num_live_neighbors(location) > 3
    end

    def num_live_neighbors(location)
      neighbors_of(location).count { |neighbor| @live_cell_locations.include? neighbor }
    end

    def neighbors_of(location)
      row, col = location
      row_range = ((row - 1)..(row + 1)).to_a
      col_range = ((col - 1)..(col + 1)).to_a

      row_range.map do |neighboring_row|
        col_range.map { |neighboring_col| [neighboring_row, neighboring_col] }
      end.flatten(1) - [[row, col]]
    end
  end
end