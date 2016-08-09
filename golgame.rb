require_relative 'gol'

class Game
attr_accessor :grid

  def initialize
    self.grid = Grid.new(80, 60)
    #@grid = Grid.new - Its the same
    grid.randomize
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
    elsif live != false &&  live_neighbours == 3
      true
    end
  end
  # don't test this method, execute something and then test - > integration test.
 def clear_screen
   puts "\e[H\e[2J"
 end
# method that iterates over each item
  def step
    # access board and iterate over each cell and call to see if it should be resurrected or killed
  end
end

game = Game.new
game.grid.print
