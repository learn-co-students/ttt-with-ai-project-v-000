module Players
	class Players::Computer < Player

    # winnable returns a hash. If the game is winnable on this move, return { truth: true, move: N }, where N is the winning move. Otherwise return { truth: false, move: nil }
    def winnable(board,token)
    	cells = board.cells
      win_combo = Game::WIN_COMBINATIONS.find do |combo|
      	[ cells[combo[0]], cells[combo[1]], cells[combo[2]] ].sort.join == " #{token}#{token}"
      end
      if win_combo
      	{ truth: true, move: (win_combo.find {|cell| cells[cell] == " "} + 1).to_s }
      else
      	{ truth: false, move: nil }
      end
    end

    # The computer tries to (1) win, (2) block the opponent's imminent win, (3) move into an empty space.
		def move(board)
			puts "\nPlayer #{self.token} moves."
      win_hash = winnable(board,self.token)
      if win_hash[:truth]
      	win_hash[:move]
      else
      	block_hash = winnable(board, self.token == "X" ? "O" : "X")
      	if block_hash[:truth]
      		block_hash[:move]
      	else
      		(board.cells.find_index {|cell| cell == " "} + 1).to_s
      	end
      end
		end

	end
end