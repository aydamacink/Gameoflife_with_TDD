require_relative 'gol'
require 'pry'
class Game
    attr_accessor :grid

    def initialize(grid = Grid.new(10, 10), randomize: true)
        self.grid = Grid.new
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
        new_grid = Grid.new
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
    end


end


    # game = Game.new
    # game.grid = Grid.new(3, 3)
    # game.grid.set_cell(1, 1, true)
    # game.grid.set_cell(1, 0, true)
    # game.grid.set_cell(1, 2, true)
    # game.grid.set_cell(2, 1, true)
    # # puts game.live_in_next_grid?(false, 3)
    # game.grid.print

    game = Game.new
    game.grid = Grid.new


    game.grid.set_cell(1, 1, true) #cell to be tested as staying alive
    game.grid.set_cell(2, 0, true) # neighbour 1
    game.grid.set_cell(2, 1, true) # neighbour 2 and will die because of overpopulation
    game.grid.set_cell(2, 2, true) # neighbour 3
    game.grid.set_cell(1, 3, true) # cell to be tested for dying with only 1 neighbour (2,2)
    game.grid.set_cell(3, 1, true) # cell to overpopulate and make (2,1) die
    game.grid.set_cell(4, 0, true) # cell to make (3,0) resurrect
    game.grid.print
    puts game.live_in_next_grid?(true, 3)
    puts game.grid.neighbours(1,1)
    game.step
    game.grid.print
