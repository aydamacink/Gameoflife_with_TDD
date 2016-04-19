class Grid
  # attr_accessor :width, :height

  # This method should initialize an instance variable @cells with a two
  # dimensional array of dimensions width and height of the value false.
  def initialize(width = 10, height = 10)
    @cells = Array.new(width) { Array.new(height, false) }
    # @cells = Array.new(4) { Array.new(3, false) } for testing irb
  end

  # Sets the state of a given cell (live is a boolean variable) and updates the
  # @cells instance variable (setter method)
  def set_cell(x, y, live)
    @cells[x][y] = live
  end

  # returns if the cell at the given coordinates lives in the current grid.
  # To do this, it checks our @cells instance variable (getter method)
  def live?(x, y)
  puts  @cells[x][y]
  end

  # Add a method to randomize
  def randomize
    # iterate over each element of the multidimensional array & modifies
    # it by setting it randomly to true or false
    @cells.length.times do |x|
      @cells[x].length.times do |y|
        @cells[x][y] = [true, false].sample
      end
    end
  end



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
  # def neighbours(x, y)
  #   number = ' '
  # end
end

grid = Grid.new(4,3)
# grid.set_cell(1,2,true)
# grid.set_cell(0,0,true)
# grid.live?(0,0)
# grid.print
# grid.live?(0,1)
grid.randomize
grid.print
