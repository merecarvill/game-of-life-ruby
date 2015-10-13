require 'spec_helper'

module GameOfLife
  describe World do
    describe "#alive_at?" do
      it "returns true if there is a living cell at given location" do
        alive_location = [0, 0]
        world = World.build(live_cell_locations: [alive_location])

        expect(world).to be_alive_at alive_location
      end

      it "returns false if there is not a living cell at given location" do
        alive_location = [0, 0]
        world = World.build(live_cell_locations: [alive_location])

        expect(world).not_to be_alive_at [1, 1]
      end
    end

    describe "#advance_generation" do
      it "returns a new world without changing the original world" do
        world = World.build(live_cell_locations: [])

        expect(world.advance_generation).not_to equal world
      end

      context "when a live cell has no live neighbors" do
        it "returns a world in which the live cell is dead" do
          alive_location = [0, 0]
          neighbors = []
          world = World.build(live_cell_locations: neighbors << alive_location)

          expect(world.advance_generation).not_to be_alive_at alive_location
        end
      end

      context "when a live cell has one live neighbor" do
        it "returns a world in which the live cell is dead" do
          alive_location = [0, 0]
          neighbors = [[0, 1]]
          world = World.build(live_cell_locations: neighbors << alive_location)

          expect(world.advance_generation).not_to be_alive_at alive_location
        end
      end

      context "when a live cell has two live neighbors" do
        it "returns a world in which the live cell is still alive" do
          alive_location = [0, 0]
          neighbors = [[0, 1], [1, 0]]
          world = World.build(live_cell_locations: neighbors << alive_location)

          expect(world.advance_generation).to be_alive_at alive_location
        end
      end

      context "when a live cell has three live neighbors" do
        it "returns a world in which the live cell is still alive" do
          alive_location = [0, 0]
          neighbors = [[0, 1], [1, 0], [1, 1]]
          world = World.build(live_cell_locations: neighbors << alive_location)

          expect(world.advance_generation).to be_alive_at alive_location
        end
      end

      context "when a live cell has four live neighbors" do
        it "returns a world in which the live cell is dead" do
          alive_location = [0, 0]
          neighbors = [[0, 1], [1, 0], [1, 1], [0, -1]]
          world = World.build(live_cell_locations: neighbors << alive_location)

          expect(world.advance_generation).not_to be_alive_at alive_location
        end
      end

      context "when a live cell has five live neighbors" do
        it "returns a world in which the live cell is dead" do
          alive_location = [0, 0]
          neighbors = [[0, 1], [1, 0], [1, 1], [0, -1], [-1, 0]]
          world = World.build(live_cell_locations: neighbors << alive_location)

          expect(world.advance_generation).not_to be_alive_at alive_location
        end
      end

      context "when three live cells neighbor the same location" do
        it "returns a world in which there is a live cell at that location" do
          initially_dead_location = [0, 1]
          alive_locations = [[0, 0], [0, 2], [1, 1]]
          world = World.build(live_cell_locations: alive_locations)

          expect(world.advance_generation).to be_alive_at initially_dead_location
        end
      end
    end
  end
end