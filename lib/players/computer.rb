require "pry"
module Players

  class Computer < Player

    # 0-indexed arrays
    CORNERS = [0,2,6,8]
    MIDDLE = 4

    # helper variables
    attr_reader :board

    #helper methods
    def token_at(num)
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

    # NOTE: Could refactor following 2 methods into one.

    def possible_win # => winning combo
      Game.win_combos.find { |c|
        could_win = c.select {|spot| token_at(spot) == token}.count == 2
        spots_free = !c.all? { |spot| taken?(spot) }
        could_win && spots_free
      }
    end

    def possible_opponent_win # => endangering combo
      opponent_token = self.token == "X" ? "O" : "X"
      Game.win_combos.find { |c|
        opp_2_spaces = c.select {|spot| token_at(spot) == opponent_token}.count == 2
        spots_free = !c.all? { |spot| taken?(spot) }
        opp_2_spaces && spots_free
      }
    end

    # NOTE: There's something wrong either with this method, which, when all done correctly, should be able to replace the about_to_win and about_to_lose methods (and their implementations).
    # The problem is that it currently returns true not just for ["X","X"," "] but also for [" ", " ", " "].
    # Should be a very easy fix, but I've left my wife by her lonesome for long enough.
    def possible_any_win
      Game.win_combos.find { |combo|
        combo.map {|spot| token_at(spot)}.uniq.count == 2 # one almost-winner, and one blank
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

=begin (this is the way to do multi-line comments in ruby. =begin and =end CANNOT BE INDENTED)
    NOTE: I'm pretty damn sure these can all be refactored using ternary operator.
    Something like return !taken?(MIDDLE) ? MIDDLE : possible_any_win : free_corner : first_empty_spot
    Okay, actually, I'm pretty sure that doesn't work and that it would have to be more like:
    !taken?(MIDDLE) ? MIDDLE :
      possible_any_win ? possible_any_win :
      free_corner ? free_corner :
      first_empty_spot
    So maybe it's not all that great.
=end

    def integer_move(board) # => 0-based board index
      @board = board
      if !taken?(MIDDLE)
        MIDDLE
      # elsif possible_any_win
      #   open_spot(possible_any_win)
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
