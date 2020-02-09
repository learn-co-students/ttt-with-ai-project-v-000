module Players
	class Computer < Player 
		attr_accessor :game

		def move(board)
			optimal_moves = [5,1,7,3,9, @game.board.cells.index(" ") + 1]	
			if almost_won != nil
				block_or_win + 1
			else
				optimal_moves.detect{|move| @game.board.valid_move?(move)}
			end							
		end

		def other_token
			if self.token == @game.player_2.token
				@game.player_1.token
			else
				@game.player_2.token
			end
		end

		def almost_won
  			@game.win_indexes.index{|index| index == ["#{self.token}","#{self.token}"," "] || index == ["#{self.token}"," ","#{self.token}"] || index == [" ","#{self.token}","#{self.token}"]} || @game.win_indexes.index{|index| index == ["#{other_token}","#{other_token}"," "] || index == ["#{other_token}"," ","#{other_token}"] || index == [" ","#{other_token}","#{other_token}"]}  
  		end

  		def block_or_win
  			winning_cell = @game.win_indexes[almost_won].index(" ")
  			Game.win_combinations[almost_won][winning_cell]
  		end

	end
end