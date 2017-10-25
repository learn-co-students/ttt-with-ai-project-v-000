module Players
    class Computer < Player
        WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
        ]

        CORNERS = [0,2,6,8]
        ALL_CELLS = [0,1,2,3,4,5,6,7,8]

        def move board
            #check to see if possible to win
            if winnable? board
                (winnable?(board) + 1).to_s
            #next, see if you need to defend against the opponent's two in a row
            #the potential winning player will be blocked, preventing their win
            elsif blockable? board
                (blockable?(board) + 1).to_s
            #see if can secure the center of the board
            #the computer will take the center cell if not already occupied
            elsif board.cells[4] == ' '
                #need to add 1 to 4 to get 5--checks middle cell
                "5"
            #if can't secure the center, secure a corner
            #the computer moves to the corners before taking any side cells unless it is to win or to block opponent's win
            elsif cornerable? board
                (cornerable?(board).sample + 1).to_s

            #if all else fails, randomly select any empty cell
            else
                blank_space = ALL_CELLS.select {|i| board.cells[i] == ' '}
                (blank_space.sample + 1).to_s
            end
        end

        #checking functions--return possible moves
        #sees if possible to win on next move
        def winnable? board
            win_pos = nil
            WIN_COMBINATIONS.each do |win_combo|
                #creates array from board positions in win_combo
                mapped_cells = win_combo.map {|i| board.cells[i]}
                if mapped_cells.count(self.token) == 2 && mapped_cells.count(' ') == 1
                    #finds the index of the winning position
                    win_pos = win_combo[mapped_cells.index(' ')]
                end
            end
            win_pos
        end

        #see if possible to block opponent's win
        def blockable? board
            win_pos = nil
            WIN_COMBINATIONS.each do |win_combo|
                mapped_cells = win_combo.map{|i| board.cells[i]}
                if mapped_cells.count(opposite_token) == 2 && mapped_cells.count(' ') == 1
					win_pos = win_combo[mapped_cells.index(' ')]
				end
			end
			win_pos
		end

        #helper function for blockable?
        def opposite_token
            token == "X" ? "O" : "X"
        end

        #sees if corners taken
        def cornerable? board
            corners_avail = CORNERS.select{|a| board.cells[a] == ' '}
            if corners_avail.empty?
                nil
            else
                corners_avail
            end

        end
    end
end
