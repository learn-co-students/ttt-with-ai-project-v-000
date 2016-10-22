module Players
	class Players::Computer < Player

    def winnable(board,token)
    	cells = board.cells
      win_combo = Game::WIN_COMBINATIONS.find {|combo| combo.count(token) == 2 && combo.count(" ") == 1}
      win_combo ? { truth: true, move: win_combo.find(" ") }
    end

		def move(board)
      win_hash = winnable(board,self.token)
      if win_hash[:truth]
      	win_hash[:move]
      else
      	block_hash = winnable(board, self.token == "X" ? "O" : "X")
      	if block_hash[:truth]
      		block_hash[:move]
      	end
      end
		end

	end
end