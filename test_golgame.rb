require 'minitest/autorun'
require_relative 'golgame'
require_relative 'gol'
require 'pry'

class TestGame < Minitest::Unit::TestCase
# basic test - dead grid and it says dead
# test case for overpopulation, test case for resurrection and test case for staying alive_neighbours
#be careful two different rules can col(glide with a proper size it can be avoided
# for each test set a new grid
  def test_for_cell_dying
     game = Game.new
     grid = Grid.new(10, 10)
     grid.set_cell(1, 1, true) # cell to be tested
     grid.set_cell(2, 0, true) # neighbour 1
     live = grid.live?(1, 1)
     live_neighbours = grid.neighbours(1,1)

     assert_equal false, game.live_in_next_grid?(live, live_neighbours)
  end

  def test_for_cell_staying_alive
    game = Game.new
    grid = Grid.new(10, 10)
    grid.set_cell(1, 1, true) #cell to be tested
    grid.set_cell(2, 0, true) # neighbour 1
    grid.set_cell(2, 1, true) # neighbour 2
    grid.set_cell(2, 2, true) # neighbour 3
    live = grid.live?(1, 1)
    live_neighbours = grid.neighbours(1,1)

    assert_equal true, game.live_in_next_grid?(live, live_neighbours)
  end

  def test_for_overpopulation
    grid = Grid.new(10, 10)
    grid.set_cell(1, 1, true) #cell to be tested
    grid.set_cell(2, 0, true) # neighbour 1
    grid.set_cell(2, 1, true) # neighbour 2
    grid.set_cell(2, 2, true) # neighbour 3
    grid.set_cell(1, 0, true) # neighbour 4
    live = grid.live?(1, 1)
    live_neighbours = grid.neighbours(1,1)

    game = Game.new(grid)
    assert_equal false, game.live_in_next_grid?(live, live_neighbours)
  end

  def test_for_resurrection
    game = Game.new
    grid = Grid.new(10, 10)
    grid.set_cell(2, 0, true) # neighbour 1
    grid.set_cell(2, 1, true) # neighbour 2
    grid.set_cell(2, 2, true) # neighbour 3
    live = grid.live?(1, 1)
    live_neighbours = grid.neighbours(1,1)

    assert_equal true, game.live_in_next_grid?(live, live_neighbours)
  end

  def test_step_with_a_dead_grid
    grid = Grid.new(10, 10)
    game = Game.new(grid, randomize: false)
    game.step
    assert_equal grid, game.grid
  end

  def test_step_with_a_grid_with_different_cell_states
      grid = Grid.new(10, 10)
      grid.set_cell(1, 1, true) #cell to be tested as staying alive
      grid.set_cell(2, 0, true) # neighbour 1
      grid.set_cell(2, 1, true) # neighbour 2 and will die because of overpopulation
      grid.set_cell(2, 2, true) # neighbour 3
      grid.set_cell(1, 3, true) # cell to be tested for dying with only 1 neighbour (2,2)
      grid.set_cell(3, 1, true) # cell to overpopulate and make (2,1) die
      grid.set_cell(4, 0, true) # cell to make (3,0) resurrect
      game = Game.new(grid, randomize: false)
      assert_equal true, game.grid.live?(1,1)
      assert_equal false, game.grid.live?(1,3)
      assert_equal false, game.grid.live?(2,1)
      assert_equal true, game.grid.live?(3,0) # dead cell with 3 neighbors that is supposed to resurrect
  end

end
