require 'pry'
class Board

    attr_accessor :cells, :board

    def initialize
      @board = Array.new(9, " ")
    end

    def cells
      @cells = []
    end

    def reset!
    end

    def display
    end

    def position(board_choice)
      choice = @cells[board_choice.to_i - 1]
      choice
    end

    def full?
    end

    def turn_count
    end

    def taken?
    end

    def valid_move?
    end

    def update
    end

end
