require 'pry'

module Players
  class Computer < Player

    WIN_COMBINATIONS =
    [
      [0,1,2], # top row
      [3,4,5], # middle row
      [6,7,8], # bottom row
      [0,3,6], # left column
      [1,4,7], # middle column
      [2,5,8], # right columnlib
      [0,4,8], # left diagonal
      [2,4,6]  # right diagonal
    ]

    def move(board)
      @return = nil
      @b = board.cells
  		@w = WIN_COMBINATIONS
      if board.valid_move?("5")
        @return = "5"
      else
        @return_hold = nil
        @return = nil
        @w.each do |s|
          if (@return_hold != nil && @return_hold != 0) && (@return == nil || @return == 0)
             @return = @return_hold
          end
          @return_hold = 0
          if @b[s[0]] == " " && ((@b[s[1]] != " " && @b[s[1]] != self.token) && (@b[s[2]] != " " && @b[s[2]] != self.token))
            @return_hold = s[0]+1
          elsif @b[s[1]] == " " && ((@b[s[0]] != " " && @b[s[0]] != self.token) && (@b[s[2]] != " " && @b[s[2]] != self.token))
              @return_hold = s[1]+1
          elsif @b[s[2]] == " " && ((@b[s[0]] != " " && @b[s[0]] != self.token) && (@b[s[1]] != " " && @b[s[1]] != self.token))
              @return_hold = s[2]+1
          end
        end
        if (@return_hold != nil && @return_hold != 0) && (@return == nil || @return == 0)
           @return = @return_hold
        end
        if @return == nil || @return == 0
          # choose randomly between 1 and 9
          @return = rand 1..9
      		until board.valid_move?(@return.to_s) do
      		  @return = rand 1..9
      		end
        end
      end
      @return.to_s
    end
  end
end
