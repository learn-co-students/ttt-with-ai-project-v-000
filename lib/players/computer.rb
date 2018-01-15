module Players
	class Computer < Player

		WIN_THREATS = [
			[0,1,2],
			[1,2,0],
			[3,4,5],
			[4,5,3],
			[6,7,8],
			[7,8,6],
			[0,3,6],
			[3,6,0],
			[1,4,7],
			[4,7,1],
			[2,5,8],
			[5,8,2],
			[0,4,8],
			[4,8,0],
			[2,4,6],
			[4,6,2],
			[0,2,1],
			[3,5,4],
			[6,8,7],
			[0,8,4],
			[2,6,4]
		]

		def move(board = nil)
			puts "#{board.cells}"

			case board.turn_count

			when 0 # i am X
				"5"
			when 1 # i am O
				puts "i must move to an even numbered index"
				if board.cells[4] != "X"
					"5"
				else
					o_m = [0,2,6,8]
					m = o_m[rand(o_m.length)].to_s
				end
			when 2 # i am X
				closed_indices = []
				closed_cells = board.cells.each_with_index { |item, index|
 					if item == "X" || item == "O"
    					closed_indices << index
					end
				}
				available_cells = [0,1,2,3,4,5,6,7,8]
				available_cells.delete_if {|i| closed_indices.include?(i)}

				#isolate the first O index and remove from available_cells the index which the O currently blocks
				closed_indices.delete(4)
				currently_blocked_index = 8 - closed_indices[0]
				puts "currently blocked index is #{currently_blocked_index}"
				available_cells.delete(currently_blocked_index)
				puts available_cells
				move = available_cells[rand(available_cells.length)] + 1
			when 3 # i am O
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board[combo[0]]
			    	pos_2 = board[combo[1]]

			    	if pos_1 == "X" && pos_2 == "X"
			    		win_threat = combo
			    		break
			    	elsif pos_1 == "O" && pos_2 == "O"
			    		win_threat = combo
			    		break
			    	end
            	end

		    	puts "The win threat is:#{win_threat}"
		    	puts "To block the threat fill index #{win_threat[2]}"
		    	m = win_threat[2] + 1

			when 4 # i am X
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]

			    	if pos_1 == "X" && pos_2 == "X"
			    		win_threat = combo
			    		break
			    	elsif pos_1 == "O" && pos_2 == "O"
			    		win_threat = combo
			    		break
			    	end
            	end

		    	puts "The win threat is:#{win_threat}"
		    	puts "To block the threat fill index #{win_threat[2]}"
		    	m = win_threat[2] + 1

			when 5 # i am O
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]

			    	if pos_1 == "X" && pos_2 == "X"
			    		win_threat = combo
			    		break
			    	elsif pos_1 == "O" && pos_2 == "O"
			    		win_threat = combo
			    		break
			    	end
            	end

		    	puts "The win threat is:#{win_threat}"
		    	puts "To block the threat fill index #{win_threat[2]}"
		    	m = win_threat[2] + 1

		    when 6
				remaining_cells = []
				board.cells.each_with_index { |item, index|
 					if item == " "
    					remaining_cells << index
					end
				}
				m = remaining_cells[rand(remaining_cells.length)] + 1
			when 7
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]

			    	if pos_1 == "X" && pos_2 == "X"
			    		win_threat = combo
			    		break
			    	elsif pos_1 == "O" && pos_2 == "O"
			    		win_threat = combo
			    		break
			    	end
            	end

		    	puts "The win threat is:#{win_threat}"
		    	puts "To block the threat fill index #{win_threat[2]}"
		    	m = win_threat[2] + 1
		    when 8
		    	remaining_cell = nil
				board.cells.each_with_index { |item, index|
 					if item == " "
    					remaining_cell = index
					end
				}
				m = remaining_cell + 1
			end
		end
	end
end

