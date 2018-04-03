class Board

    attr_accessor :cells, :cell_num

    def initialize
      @cells = cells
      reset!

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

end
