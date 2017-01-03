class Board
    attr_accessor :cells

    def initialize()
      reset!
    end

    def reset!
        @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ].freeze

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts '-----------'
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts '-----------'
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    # position method
    def position
    end

    # position_taken? method
    def position_taken?(position)
        if @board[position] == 'X' || @board[position] == 'O'
            true
        else
            false
        end
    end

    # define full here - every element on the board contains "X" or "O"
    def full?
        @board.all? do |mark|
            mark == 'X' || mark == 'O'
        end
    end

    # define turn_count here
    def turn_count
      counter = 0
      @cells.each do |occupied_spot|
        counter += 1 if occupied_spot != ' '
      end
      counter
    end

    # define taken?
    def taken?
    end

    # valid_move? method here
    def valid_move?(position)
        position = position.to_i - 1
        if !position_taken?(position) && position.between?(0, 8)
            return true # position on the board && position not taken
        else
            return false # return false or nil here for invalid move
        end
    end

    # define update
    def update
    end
end
