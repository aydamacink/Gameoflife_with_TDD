class Grid

  attr_accessor :width, :height, :cells

  def initialize(width = 10, height = 10)
    @width = width
    @height = height
    @cells = Array.new(width) { Array.new(height, false) }
  end

  def live?(x, y)
    @cells[x][y]
  end

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

  def neighbours(x, y)
    @neighbours_count = 0

    if @cells[x][y-1]  # north
      @neighbours_count += 1
    end
    if @cells[x][y+1] && (y < (@cells[0].length - 1)) # south
      @neighbours_count += 1
    end
    if @cells[x-1][y] # west
      @neighbours_count += 1
    end
    if @cells[x+1][y] # east
      @neighbours_count += 1
    end
    if @cells[x-1][y-1] # northwest
      @neighbours_count += 1
    end
    if @cells[x+1][y-1] # northeast
      @neighbours_count += 1
    end
    if @cells[x-1][y+1]  && y < (@cells[0].length - 1) #southwest
      @neighbours_count += 1
    end
    if @cells[x+1][y+1]  && y < (@cells[0].length - 1) #southeast
      @neighbours_count += 1
    end
  end

end
