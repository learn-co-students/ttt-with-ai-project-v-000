# require_relative "../board.rb"
# require_relative "../player.rb"
# require_relative "../players/human.rb"
# require_relative "../game.rb"
# require 'pry'


class Computer < Player
	WIN_COMBINATIONS = [
	  [0,1,2],
	  [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2] ]

	def move(board)
		if winning_move(board)
			winning_move(board)
		elsif blocking_move(board)
			blocking_move(board)
		elsif board.cells[4] == " "
			"5"
		elsif board.cells[0] == " "
			"1"
		elsif board.cells[2] == " "
			"3"
		elsif board.cells[6] == " "
			"7"
		elsif board.cells[8] == " "
			"9"
		else	
			rand(1..9).to_s
		end		
	end

	def winning_move(board)
		winning_move = nil
		WIN_COMBINATIONS.each do |combination|
    		combo = []
    		combo << board.cells[combination[0]]
    		combo << board.cells[combination[1]]
    		combo << board.cells[combination[2]]

    		count = combo.select {|item| item == token}.count 
    		if count == 2
    			i = combo.index(" ")
    			unless i.nil?
    				winning_move = (combination[i] + 1).to_s
    			end
    		end
    	end
    	winning_move
    end

    def blocking_move(board)
    	blocking_move = nil

    	if token == "X"
    		opponent_token = "O"
    	elsif token == "O"
    		opponent_token = "X"
    	end
    			
		WIN_COMBINATIONS.each do |combination|
    		combo = []
    		combo << board.cells[combination[0]]
    		combo << board.cells[combination[1]]
    		combo << board.cells[combination[2]]


    		count = combo.select {|item| item == opponent_token}.count
    		if count == 2
    			i = combo.index(" ")
    			unless i.nil?
    				blocking_move = (combination[i] + 1).to_s
    			end
    		end
    	end
    	blocking_move
    end
end
