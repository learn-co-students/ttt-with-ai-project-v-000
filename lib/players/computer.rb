require "pry"
module Players

  class Computer < Player

    # 0-indexed arrays
    CORNERS = [0,2,6,8]
    MIDDLE = 4

    # helper variables
    attr_reader :board

    #helper methods
    def board(num)
      @board.cells[num]
    end

    def taken?(num)
      @board.taken?(num+1)
    end

    def first_empty_spot
      (0..8).find {|i| !taken?(i)} # take the first empty spot
    end

    def free_corner
      CORNERS.find { |corner| !taken?(corner) }
    end

    def can_win # => index for winning spot

    end

    def about_to_lose # => index for spot to block

      opponent_token = "O" # NOTE: figure out how to get opponent token
      if losing_combo = Game.win_combos.find { |combo|
        combo.select {|spot| board(spot) == opponent_token}.count == 2 # if opponent has two of this combo
      }
        puts "about to lose at #{losing_combo}"
      end
      # binding.pry
    end

    # exec methods
    def move(board) # => 1-indexed board position
      "#{integer_move(board)+1}"
    end # end #move(board)

    def integer_move(board) # => 0-based board index

      @board = board

      if !taken?(MIDDLE) # move in the middle if middle is free
        MIDDLE
      elsif free_corner
        free_corner
      elsif can_win
        can_win
      elsif about_to_lose
        about_to_lose
      else
        first_empty_spot
      end # end if
    end # end #integer_move(board)

  end # end class
end # end module
