class Grid

  # This method should initialize an instance variable @cells with a two
  # dimensional array of dimensions width and height of the value false.
  def initialize(width = 10, height = 10)
    @cells = Array.new(width) { Array.new(height, false) }
  end

  # Sets the state of a given cell (live is a boolean variable) and updates the
  # @cells instance variable (setter method)
  def set_cell(x, y, live)
    @cells[x][y] = live
  end

  # returns if the cell at the given coordinates lives in the current grid.
  # To do this, it checks our @cells instance variable (getter method)
  def live?(x, y)
    @cells[x][y]
  end

  # Add a method to randomize

  # prints the current grid to the console
  def print
  #  puts print_as_string
    puts @cells.inspect
  end

  # def neighbours(x, y)
  # number = 0

  #   result = ' '
  #   HEIGHT.times do |y|
  #     WIDTH.times do |x|
  #       if live?(x, y)
  #         result << 'X'
  #       else
  #         result << ' '
  #       end
  #     end
  #   end
  #     result << "\n"
  # end

  # returns the number
  # of living neighbours that the cell at the given coordinates has.
  def neighbours(x, y)
    number = ' '
  end
end
