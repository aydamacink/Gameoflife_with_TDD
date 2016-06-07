require 'minitest/autorun'
require_relative 'golgame'
require_relative 'gol'

class TestGrid < MiniTest::Test
# basic test - dead grid and it says dead
# test case for overpopulation, test case for resurrection and test case for staying alive_neighbours
#be careful two different rules can col(glide with a proper size it can be avoided
# for each test set a new grid
  def test_live_in_next_grid?
    # grid = Grid.new(3, 3)
    # grid.set_cell(1, 1, true)
    game = Game.new
    assert_equal false, game.live_in_next_grid?(true, 1)
  end

end
