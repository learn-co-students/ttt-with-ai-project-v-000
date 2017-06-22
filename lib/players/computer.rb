module Players
	class Computer < Player 
		attr_accessor :game

		def move(board)
			if self_almost_won?.class == Array
				win_self + 1
			elsif other_almost_won?.class == Array
				block_opponent + 1	
			elsif @game.board.valid_move?(5) 
				"5"	
			elsif @game.board.valid_move?(1) 
				"1"	
			elsif @game.board.valid_move?(3) 
				"3"	
			elsif @game.board.valid_move?(7) 
				"7"
			elsif @game.board.valid_move?(9) 
				"9"		
			else
				@game.board.cells.index(@game.board.cells.detect{|i| i == " "}) + 1
			end							
		end

		def other_token
			if self.token == @game.player_2.token
				@game.player_1.token
			else
				@game.player_2.token
			end
		end

		def self_almost_won?
  			@game.win_indexes.detect{|index| index == ["#{self.token}","#{self.token}"," "] || index == ["#{self.token}"," ","#{self.token}"] || index == [" ","#{self.token}","#{self.token}"]} 
  		end

  		 def other_almost_won?
  			@game.win_indexes.detect{|index| index == ["#{other_token}","#{other_token}"," "] || index == ["#{other_token}"," ","#{other_token}"] || index == [" ","#{other_token}","#{other_token}"]}  
  		end

  		def win_self
  			self_index = @game.win_indexes.index{|index| index == ["#{self.token}","#{self.token}"," "] || index == ["#{self.token}"," ","#{self.token}"] || index == [" ","#{self.token}","#{self.token}"]} 
  			self_index_index = self_almost_won?.index(" ")
  			Game.win_combinations[self_index][self_index_index]
  		end

  		def block_opponent
  			opponent_index = @game.win_indexes.index{|index| index == ["#{other_token}","#{other_token}"," "] || index == ["#{other_token}"," ","#{other_token}"] || index == [" ","#{other_token}","#{other_token}"]} 
  			opponent_index_index = other_almost_won?.index(" ")
  			Game.win_combinations[opponent_index][opponent_index_index]
  		end

	end
end