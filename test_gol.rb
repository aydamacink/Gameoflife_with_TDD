require 'minitest/autorun'
require_relative 'gol'

class TestGrid  < Minitest::Unit::TestCase

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
        grid.set_cell(0, 1, true) # west
        grid.set_cell(2, 1, true) # east
        grid.set_cell(1, 2, true) # south
        grid.set_cell(1, 0, true) # north
        grid.set_cell(0, 2, true) #southwest
        grid.set_cell(0, 0, true) # northwest
        grid.set_cell(2, 2, true) #southeast
        grid.set_cell(2, 0, true) #northeast

        assert_equal 8, grid.neighbours(1, 1)
    end

    def test_neighbours_for_border_cells_on_west

        grid = Grid.new
        grid.set_cell(1, 4, true) # east
        grid.set_cell(0, 5, true) # south
        grid.set_cell(0, 3, true) # north
        grid.set_cell(1, 3, true) # northeast
        grid.set_cell(1, 5, true) # southeast

        assert_equal 5, grid.neighbours(0, 4)
    end

    def test_neighbours_for_border_cells_on_east
        grid = Grid.new
        grid.set_cell(9, 3, true) # north
        grid.set_cell(9, 5, true) # south
        grid.set_cell(8, 4, true) # west

        assert_equal 3, grid.neighbours(9,4)
    end

    def test_neighbours_for_border_cells_on_north
        grid = Grid.new
        grid.set_cell(4, 1, true) # south
        grid.set_cell(3, 0, true) # west
        grid.set_cell(3, 1, true) # southwest
        grid.set_cell(5, 1, true) # southeast

        assert_equal 4, grid.neighbours(4, 0)
    end

    def test_neighbours_for_border_cells_on_south
        grid = Grid.new
        grid.set_cell(4, 8, true) # south
        grid.set_cell(5, 9, true) # east

        assert_equal 2, grid.neighbours(4, 9)
    end

    def test_corner_case_on_south_east
        grid = Grid.new
        grid.set_cell(8, 9, true) # west
        grid.set_cell(9, 8, true) # north
        grid.set_cell(8, 8, true) # northwest

        assert_equal 3, grid.neighbours(9, 9)
    end

    def test_corner_case_on_north_west
        grid = Grid.new
        grid.set_cell(1, 0, true) # east
        grid.set_cell(0, 1, true) #south
        grid.set_cell(1, 1, true) # southeast

        assert_equal 3, grid.neighbours(0,0)
    end

    def test_corner_case_on_south_west
        grid = Grid.new
        grid.set_cell(1, 9, true) # east
        grid.set_cell(0, 8, true) #south
        grid.set_cell(1, 8, true) # northwest

        assert_equal 3, grid.neighbours(0,9)
    end

    def test_corner_case_on_north_east
        grid = Grid.new
        grid.set_cell(8, 0, true) # west
        grid.set_cell(9, 1, true) #south
        grid.set_cell(8, 1, true) # southeast

        assert_equal 3, grid.neighbours(9,0)
    end

    # make a test for a wrong input like (11,30) way out of range
    def test_for_cell_out_of_range
        grid = Grid.new
        grid.set_cell(0,1, true)

        assert_equal 0, grid.neighbours(11,30) #How to raise an exception?

    end
    # Tests : define two equal boards and compare them : in the first one the comparison should be true, in the second one
    #it should be false (two different grids).  First grid could compare two dead/empty grids to make it easier. Define
    #two empty grids and compare them -> it should be  true .
    # around 5 different cases all dead , all alive and one with some alive e

    def test_for_equality_of_two_dead_grids
        grid1 = Grid.new
        grid2 = Grid.new
        assert_equal grid1, grid2
    end

    def test_for_equality_of_two_equal_alive_grids
        grid1 = Grid.new
        grid1.set_cell(0,0, true)
        grid1.set_cell(0,1, true)
        grid1.set_cell(0,2, true)
        grid1.set_cell(1,0, true)
        grid2 = Grid.new
        grid2.set_cell(0,0, true)
        grid2.set_cell(0,1, true)
        grid2.set_cell(0,2, true)
        grid2.set_cell(1,0, true)
        assert_equal grid1, grid2
    end

    def test_for_equality_of_two_unequal_grids_one_alive_one_dead
        grid1 = Grid.new
        grid2 = Grid.new
        grid2.set_cell(0,0, true)
        grid2.set_cell(0,1, true)
        grid2.set_cell(0,2, true)
        grid2.set_cell(1,0, true)
        refute_equal grid1, grid2
    end

    def test_for_equality_of_two_unequal_grids_with_some_alive_cells_each
        grid1 = Grid.new
        grid1.set_cell(0,0, true)
        grid1.set_cell(0,1, true)
        grid1.set_cell(0,2, true)
        grid1.set_cell(1,0, true)
        grid2 = Grid.new
        grid2.set_cell(0,0, true)
        grid2.set_cell(1,0, true)
        grid2.set_cell(2,0, true)
        grid2.set_cell(0,1, true)
        refute_equal grid1, grid2
    end
end
