require_relative 'gol'

class Game
 attr_accessor :grid

  def initialize(grid = Grid.new(80, 60), randomize: true)
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
  def step
    grid = Grid.new(10, 10)


    # access board and iterate over each cell and call to see if it should be resurrected or killed
    # Method step() makes a new grid from the current one and assigns it to @grid. To do so, you instantiate a new Grid with the same width and height as the current one and assign it to a local variable.
    #
    #   Then iterate over all coordinates x from 0 to width-1 and y from 0 to height-1 and
    # check if the cell at (x, y) lives (use the existing Grid method for this)
    # calculate the number of living neighbour cells of the cell at (x,y) (use the existing Grid method for this)
    # use these two results to calculate if the cell should live in the new grid (use the existing Grid method for this). Store this as a boolean, true/false
    # assign this boolean to the cell at (x,y) in the new grid (use the existing Grid method for this).
    # After that you assign your new grid to @grid, thereby making it the current one.
    @grid = grid
  end

  def start
  end

end

# game = Game.new
# game.grid.print

# game = Game.new
# grid = Grid.new(3, 3)
# grid.set_cell(1, 1, true)
# grid.set_cell(1, 0, true)
# grid.set_cell(1, 2, true)
# grid.set_cell(2, 1, true)
# game.live_in_next_grid?(false, 3)
