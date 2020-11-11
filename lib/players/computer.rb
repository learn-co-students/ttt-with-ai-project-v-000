class Players::Computer < Player

    def move(board)
	    move = nil
			if !board.taken?("5")
				move = "5"
			elsif board.turn_count == 1
				move = "3"
			elsif board.turn_count == 2
				move = [1,3,7,9].detect {|open| board.taken?(open) == false }.to_s
			else
				move = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect {|open| board.taken?(open) == false }.to_s
			end
	    move
		end

end
