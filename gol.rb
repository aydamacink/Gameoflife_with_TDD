class Grid

  attr_accessor :width, :height, :cells

  Possible_Neighbours =[
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1]
  ]



  def initialize(width = 10, height = 10)
    @width = width
    @height = height
    @cells = Array.new(width) { Array.new(height, false) }
  end

  def live?(x, y)
    @cells[x][y]
  end
  #primitive obsession: do not check with a boolean, or a primitive data type, think about
  #rendering ->  I will have to say if its nil don't do anything, if its true do this, if its false (which is close to nil -> danger) do this
  #dojo: implement in different ways to improve abilities - note to self: do it with a cell object

  def set_cell(x, y, live)
    @cells[x][y] = live
  end

  def print
    puts print_as_string
  end

  def print_as_string
    result = ''

    @height.times do |y|
      @width.times do |x|
        if live?(x, y)
          result << 'X'
        else
          result << ' '
        end
      end
      result << "\n"
    end

    result
  end

# current_cell refers to the current cell being examined to see if it is a neighbour or not.

  def neighbours(x, y)
    neighbours_count = 0

    Possible_Neighbours.each do |array|
      current_cell= (@cells[x + array[0]] || [])[y + array[1]] # this trick is called nil guard: here we do it for x
      # and here we ensure that the y is not equal to nil
      if (current_cell != nil && current_cell)  #&& (x != nil && y != nil)
        neighbours_count += 1
      # else
        # neighbours_count = neighbours_count
      end

    end

    neighbours_count

  end

end

grid = Grid.new
# grid.set_cell(0, 0, true)
# grid.set_cell(0, 1, true)
# grid.set_cell(1, 2, true)
# puts grid.live_cells_at(0, 0)
# puts grid.live_cells_at(1, 2)
# puts grid.live_cells_at(11, 1)
# puts grid.neighbours(1, 1)
# puts grid.neighbours(0, 2)
grid.set_cell(9, 3, true) # north
grid.set_cell(9, 5, true) # south
grid.set_cell(8, 4, true)
puts grid.neighbours(11, 30)
