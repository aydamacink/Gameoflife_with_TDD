require 'minitest/autorun'
require_relative 'golgame'
require_relative 'gol'

class TestGame < MiniTest::Test
# basic test - dead grid and it says dead
# test case for overpopulation, test case for resurrection and test case for staying alive_neighbours
#be careful two different rules can col(glide with a proper size it can be avoided
# for each test set a new grid
  def test_for_cell_dying
     game = Game.new
     grid = Grid.new(80, 60)
     grid.set_cell(1, 1, true) # cell to be tested
     grid.set_cell(2, 0, true) # neighbour 1
     live = grid.live?(1, 1)
     live_neighbours = grid.neighbours(1,1)

     assert_equal false, game.live_in_next_grid?(live, live_neighbours)
  end

  def test_for_cell_staying_alive
    game = Game.new
    grid = Grid.new(80, 60)
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
    grid = Grid.new(80, 60)
    grid.set_cell(2, 0, true) # neighbour 1
    grid.set_cell(2, 1, true) # neighbour 2
    grid.set_cell(2, 2, true) # neighbour 3
    live = grid.live?(1, 1)
    live_neighbours = grid.neighbours(1,1)

    assert_equal true, game.live_in_next_grid?(live, live_neighbours)
  end

  def test_step_with_a_dead_grid
    start_grid = Grid.new(5, 5)
    game = Game.new(grid)
    game.step

    assert_equal grid, game.grid
  end

end
