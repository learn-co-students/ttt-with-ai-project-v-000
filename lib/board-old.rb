class Board
<<<<<<< HEAD

    attr_accessor :cells, :cell_num
=======
  
    attr_accessor :cells
>>>>>>> 39d58095c14df3b2a2c51956675407c3d69fd8c2

    def initialize
      @cells = cells
      reset!
<<<<<<< HEAD

=======
>>>>>>> 39d58095c14df3b2a2c51956675407c3d69fd8c2
    end

    def reset!
      @cells = Array.new(9, " ")
    end

    def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(cell_num)
<<<<<<< HEAD
      @cells[cell_num.to_i - 1]
    end

    def full?
      @cells.all?{|cell| cell != " "}
    end

    def update(cell_num, player)
      @cells[cell_num.to_i - 1] = player.token
      display
    end

    def turn_count
      @cells.count{|token| token == "X" || token == "O"}
    end

    def taken?(cell_num)
      position(cell_num) != " "
    end

    def valid_move?(cell_num)
    cell_num.to_i.between?(1, 9) && !taken?(cell_num)
    end
=======
      index = cell_num.to_i - 1
      @cells[index]
    end

    def full? 
      cells.all?{|cell| cell ==}

>>>>>>> 39d58095c14df3b2a2c51956675407c3d69fd8c2

end
