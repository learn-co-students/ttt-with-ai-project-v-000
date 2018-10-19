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

    def open_spot(combo)
      combo.find { |spot| !taken?(spot) }
    end

    def possible_win # => winning combo
      Game.win_combos.find { |c|
        could_win = c.select {|spot| board(spot) == token}.count == 2
        spots_free = !c.all? { |spot| taken?(spot) }
        could_win && spots_free
      }
    end

    def possible_opponent_win # => endangering combo
      opponent_token = self.token == "X" ? "O" : "X"
      Game.win_combos.find { |c|
        opp_2_spaces = c.select {|spot| board(spot) == opponent_token}.count == 2
        spots_free = !c.all? { |spot| taken?(spot) }
        opp_2_spaces && spots_free
      }
    end

    def about_to_win # => index for winning spot
      if possible_win
        open_spot(possible_win)
      end
    end

    def about_to_lose # => index for spot to block
      if possible_opponent_win
        open_spot(possible_opponent_win)
      end
    end

    # exec methods
    def move(board) # => 1-indexed board position
      "#{integer_move(board)+1}"
    end # end #move(board)

    def integer_move(board) # => 0-based board index
      @board = board
      if !taken?(MIDDLE)
        MIDDLE
      elsif about_to_win
        about_to_win
      elsif about_to_lose
        about_to_lose
      elsif free_corner
        free_corner
      else
        first_empty_spot
      end # end if
    end # end #integer_move(board)

  end # end class
end # end module
