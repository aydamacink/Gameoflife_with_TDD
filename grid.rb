class Grid
  # attr_accessor :x, :y
  # attr_accessor :width, :height

  # This method should initialize an instance variable @cells with a two
  # dimensional array of dimensions width and height of the value false.

  # Neighbors_for_Normals =[
  #   [x, (y-1)],
  #   [x, (y+1)],
  #   [(x-1), y],
  #   [(x+1), y],
  #   [(x-1),(y-1)],
  #   [(x+1), (y-1)],
  #   [(x-1), (y+1)],
  #   [(x+1), (y+1)]
  # ]

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

  # iterate over each element of the multidimensional array & modifies
  # it by setting it randomly to true or false
  def randomize
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

  # returns the number
  # of living neighbors that the cell at the given coordinates has.
  def neighbors(x, y)
    @neighbors_count = 0
    # @cells.each do |cell|
      # Check for a neighbor to the north
      if @cells[x][y-1]
        # == cell.x && self.y == cell.y - 1
        @neighbors_count = @neighbors_count + 1
      end
      # Check for a neighbor to the south
      if @cells[x][y+1]
        @neighbors_count = @neighbors_count + 1
      end
      # Check for a neighbor to the east
      if @cells[x-1][y]
        @neighbors_count = @neighbors_count + 1
      end
      # Check for a neighbor to the west
      if @cells[x+1][y]
        @neighbors_count = @neighbors_count + 1
      end
      # Check for a neighbor to the north east
      if @cells[x-1][y-1]
        @neighbors_count = @neighbors_count + 1
      end
      # Check for a neighbor to the north west
      if @cells[x+1][y-1]
        @neighbors_count = @neighbors_count + 1
      end
      # Check for a neighbor to the south east
      if @cells[x-1][y+1]
        @neighbors_count = @neighbors_count + 1
      end
      # Check for a neighbor to the south west
      if @cells[x+1][y+1]
        @neighbors_count = @neighbors_count + 1
      end
      puts @neighbors_count
    end


    # count = 0
    # if @cells[(x-1)][y]
    #   count = count + 1
    #
    # [(x+1)[y]]
    # [(x)[y+1]]


end

grid = Grid.new(4,3)
grid.set_cell(1,1,true)
# grid.set_cell(0,0,true)
# grid.live?(0,0)
# grid.print
# grid.live?(0,1)
# grid.randomize
grid.set_cell(1,0,true)
grid.set_cell(1,2,true)
grid.set_cell(0,1,true)
grid.set_cell(2,1,true)
grid.set_cell(0,0,true)
grid.set_cell(2,0,true)
grid.set_cell(0,2,true)
grid.set_cell(2,2,true)
grid.print
grid.neighbors(1,1)
