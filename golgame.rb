require_relative 'gol'
require 'pry'
class Game
    attr_accessor :grid

    def initialize(grid = Grid.new(80, 60), randomize: true)
        @grid = grid
        #@grid = Grid.new - Its the same
        grid.randomize if randomize
    end

    def live_in_next_grid?(live, live_neighbours)
        #Any live cell with fewer than two live neighbours dies, as if caused by under-population.
        if live && live_neighbours < 2
            false
            #Any live cell with two or three live neighbours lives on to the next generation.
        elsif live && (live_neighbours == 2 || live_neighbours == 3)
            true
            #Any live cell with more than three live neighbours dies, as if by over-population.
        elsif live && live_neighbours > 3
            false
            #Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
        elsif live == false &&  live_neighbours == 3
            true
        end
    end
    # don't test this method, execute something and then test - > integration test.
    def clear_screen
        puts "\e[H\e[2J"
    end
    # method that iterates over each item

    # access board and iterate over each cell and call to see if it should be resurrected or killed, set each cell of new grid to its new state.
    def step
        new_grid = grid.blank
        self.grid.cells.each_with_index do |row, x|
            row.each_with_index do |cell, y|
                state = self.grid.live?(x, y)
                neighbours = self.grid.neighbours(x, y)
                next_state = live_in_next_grid?(state, neighbours) # it should be a boolean
                new_grid.set_cell(x, y, next_state)
            end
        end
        @grid = new_grid
    end

    def start
        while true do
            clear_screen
            grid.print
            sleep(1)
            step
        end
    end
end


Game.new.start
