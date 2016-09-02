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

    def initialize(width = 80, height = 60)
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

    # iterate over each element of the multidimensional array & modifies
    # it by setting it randomly to true or false
    def randomize
        @cells.length.times do |x|
            @cells[x].length.times do |y|
                @cells[x][y] = [true, false].sample
            end
        end
    end

    #Compares the self.cells with the other.cells
    def ==(other)
        self.cells == other.cells
    end


    def blank
        self.class.new(width, height)
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
            end
        end
        neighbours_count
    end
end

grid = Grid.new
grid.randomize
grid.print
