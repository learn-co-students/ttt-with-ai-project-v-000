require 'pry'
module Players
  class Computer < Player

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

    def move(board)
    	square = ""
    	winning_square = self.two_in_combo?(board)
    	if winning_square
    		square = winning_square
    	elsif board.cells[4] == " "
    		square = "5"
    	else
    		until board.valid_move?(square)
      			square = (1..9).to_a.sample
      		end
      	end
      	square.to_s
    end

    def two_in_combo?(board)
    	square = ""
    	winning_combo = WIN_COMBINATIONS.find do |combo|
    		tokens = combo.map { |space| board.cells[space] }
    		tokens.count { |token| token == self.token } == 2
    	end
      	if winning_combo
      		square = winning_combo.find do |space|
    			  board.cells[space] == " "
    	  	end
    	square + 1
      end
    end

  end

end

# AI analyzes each winning combo to find two-in-a-row
# first for it's own tokens
# then opponents
# AI picks empty square in the row
