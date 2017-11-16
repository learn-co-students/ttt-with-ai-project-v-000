class Board
  attr_accessor :cells


    def initialize
      reset!
    end

    def reset!
      @cells = Array.new(9, " ")
    end

    def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(index)
      index = index.to_i - 1
      position = cells[index]
    end

    def full?
      cells.all? do |token|
        token == "X" || token =="O"
      end
    end

    def turn_count
      cells.count{|token| token == "O" || token == "X"}
    end

    def taken?(index)
      !(position(index) == " " || position(index) == "")
    end

    def valid_move?(index)
      index.to_i.between?(1,9) && !taken?(index)
    end

    def update(index, player)
      index = index.to_i - 1
      cells[index] = player.token
    end


end
