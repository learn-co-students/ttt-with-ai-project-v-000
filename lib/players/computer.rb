
require 'pry'


module Players

  class Computer < Player


    # 0-indexed arrays
    CORNERS = [0,2,6,8]
    MIDDLE = 4


    # helper variables
    attr_reader :board

    # helper methods
    def token_at(num)
      @board.cells[num]
    end

    def taken?(num)
      @board.taken?(num+1)
    end

    def first_empty_spot # in the whole board
      (0..8).find {|i| !taken?(i)}
    end

    def free_corner
      CORNERS.find { |corner| !taken?(corner) }
    end

    def open_spot(combo)
      combo.find { |spot| !taken?(spot) }
    end

    # NOTE: This works, BUT it doesn't prioritize winning over blocking, or vice versa. It finds the FIRST combo in the list that could lose or could win, and goes there.
    # So this could be somehow rewritten/expanded to find the first winning combo, and if not, find the first losing combo.
    # That would, of course, /almost/ get us back where we started with separate could_win and could_lose methods (see method archive at bottom of file).

    def possible_any_win # => winning combo
      opponent_token = self.token == "X" ? "O" : "X"
      Game.win_combos.find { |combo|
        tokens = combo.map {|spot| token_at(spot)}
        (tokens.count{|s| s=="X" }==2 || tokens.count{|s| s=="O"}==2) &&
        open_spot(combo)
        }
    end

    # exec methods
    def move(board) # => 1-indexed board position
      "#{integer_move(board)+1}"
    end # end #move(board)


    def integer_move(board) # => 0-based board index
      @board = board

      !taken?(MIDDLE) ? MIDDLE :
        possible_any_win ? open_spot(possible_any_win) :
        free_corner ? free_corner :
        first_empty_spot

    end # end #integer_move(board)

  end # end class
end # end module


