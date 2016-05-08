require 'minitest/autorun'
require_relative 'gol'

class TestGrid < MiniTest::Test

  def test_set_cell
    # given
    grid = Grid.new

    # when
    grid.set_cell(1, 1, true)

    # then
    assert_equal true, grid.live?(1, 1)
  end

  def test_print_as_string
    # given
    grid = Grid.new
    grid.set_cell(1, 2, true)

    # when
    result = grid.print_as_string

    # then
    expected =
      "          \n" +
      "          \n" +
      " X        \n" +
      "          \n" * 7
    assert_equal(expected, result)
  end

  def test_neighbours_for_a_normal_cell
    # given
    # ----------
    # X
    # X
    #  X
    #
    #
    #
    #
    #
    #
    #
    # ----------
    grid = Grid.new
    grid.set_cell(1, 2, true) # south
    grid.set_cell(2, 2, true) # se
    grid.set_cell(2, 1, true) # e
    grid.set_cell(2, 0, true) #Ne
    grid.set_cell(1, 0, true) # north
    grid.set_cell(0, 0, true) # nw
    grid.set_cell(0, 1, true) # w
    grid.set_cell(0, 2, true) #sw
    assert_equal 8, grid.neighbours(1,1)
  end

  def test_neighbours_for_border_cells_on_west

    grid = Grid.new
    grid.set_cell(1, 1, true) #east
    grid.set_cell(0, 2, true) #south
    grid.set_cell(0, 0, true) #north
    grid.set_cell(1, 0, true) #ne
    # grid.set_cell(1, 2, true) #se
    assert_equal 4, grid.neighbours(0, 1)
  end

def test_neighbours_for_border_cells_on_north
  grid = Grid.new
  grid.set_cell(2, 1, true) #south
  grid.set_cell(1, 0, true) #west
  grid.set_cell(1, 1, true) #southwest
  # grid.set_cell(3, 1, true) #southeast
  # grid.set_cell(3, 0, true) #east
  assert_equal 3, grid.neighbours(2, 0)
end



    # grid.set_cell(0, 1, true)
    # grid.set_cell(1, 2, true)
    #
    # # when
    # # then
    # assert_equal 1, grid.neighbours(1, 2), 'somewhere in the middle'
    # assert_equal 2, grid.neighbours(0, 1), 'it works at the left border'
    # assert_equal 1, grid.neighbours(0, 0), 'it works in the upper left corner'

end
