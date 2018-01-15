module Players
	class Computer < Player

		WIN_THREATS = [
			[0,1,2],
			[1,2,0],
			[0,2,1],
			[3,4,5],
			[4,5,3],
			[3,5,4],
			[6,7,8],
			[7,8,6],
			[6,8,7],
			[0,3,6],
			[3,6,0],
			[0,6,3],
			[1,4,7],
			[4,7,1],
			[1,7,4],
			[2,5,8],
			[5,8,2],
			[2,8,5],
			[0,4,8],
			[4,8,0],
			[0,8,4],
			[2,4,6],
			[4,6,2],
			[2,6,4]
		]

		def move(board = nil)
			puts "#{board.cells}"

			case board.turn_count

			when 0 # i am X
				puts "board turn count is:#{board.turn_count}"
				"5"

			when 1 # i am O
				puts "board turn count is:#{board.turn_count}"
				puts "i must move to an even numbered index, preferrably 4"
				if board.cells[4] != "X"
					"5"
				else
					options = [0,2,6,8]
					m = options[rand(options.length)] + 1
					m.to_s
				end

			when 2 # i am X
				puts "board turn count is:#{board.turn_count}"
				closed_indices = []
				board.cells.each_with_index { |item, index|
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
				m = available_cells[rand(available_cells.length)] + 1
				m.to_s

			when 3 # i am O
				puts "board turn count is:#{board.turn_count}"
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]
			    	pos_3 = board.cells[combo[2]]

			    	if pos_1 == "X" && pos_2 == "X" && pos_3 == " "
			    		win_threat = combo
			    	end
            	end

            	if win_threat != nil
					puts "The win threat is:#{win_threat}"
			    	puts "To block the threat fill index #{win_threat[2]}"
			    	m = win_threat[2] + 1
			    	m.to_s
			    else
					remaining_cells = []
					board.cells.each_with_index { |item, index|
 						if item == " "
    						remaining_cells << index
						end
					}
					m = remaining_cells[rand(remaining_cells.length)] + 1
					m.to_s
		    	end

			when 4 # i am X
				puts "board turn count is:#{board.turn_count}"
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]
			    	pos_3 = board.cells[combo[2]]

			    	if pos_1 == "O" && pos_2 == "O" && pos_3 == " "
			    		win_threat = combo
			    	end
            	end

            	if win_threat != nil
					puts "The win threat is:#{win_threat}"
			    	puts "To block the threat fill index #{win_threat[2]}"
			    	m = win_threat[2] + 1
			    	m.to_s
			    else
					remaining_cells = []
					board.cells.each_with_index { |item, index|
 						if item == " "
    						remaining_cells << index
						end
					}
					m = remaining_cells[rand(remaining_cells.length)] + 1
					m.to_s
		    	end

			when 5 # i am O
				puts "board turn count is:#{board.turn_count}"
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]
			    	pos_3 = board.cells[combo[2]]

			    	if pos_1 == "X" && pos_2 == "X" && pos_3 == " "
			    		win_threat = combo
			    	end
            	end

            	if win_threat != nil
					puts "The win threat is:#{win_threat}"
			    	puts "To block the threat fill index #{win_threat[2]}"
			    	m = win_threat[2] + 1
			    	m.to_s
			    else
					remaining_cells = []
					board.cells.each_with_index { |item, index|
 						if item == " "
    						remaining_cells << index
						end
					}
					m = remaining_cells[rand(remaining_cells.length)] + 1
					m.to_s
		    	end

		    when 6 # i am X
				puts "board turn count is:#{board.turn_count}"
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]
			    	pos_3 = board.cells[combo[2]]

			    	if pos_1 == "O" && pos_2 == "O" && pos_3 == " "
			    		win_threat = combo
			    	end
            	end

            	if win_threat != nil
					puts "The win threat is:#{win_threat}"
			    	puts "To block the threat fill index #{win_threat[2]}"
			    	m = win_threat[2] + 1
			    	m.to_s
			    else
					remaining_cells = []
					board.cells.each_with_index { |item, index|
 						if item == " "
    						remaining_cells << index
						end
					}
					m = remaining_cells[rand(remaining_cells.length)] + 1
					m.to_s
		    	end

			when 7 # i am O
				puts "board turn count is:#{board.turn_count}"
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]
			    	pos_3 = board.cells[combo[2]]

			    	if pos_1 == "X" && pos_2 == "X" && pos_3 == " "
			    		win_threat = combo
			    	end
            	end

            	if win_threat != nil
					puts "The win threat is:#{win_threat}"
			    	puts "To block the threat fill index #{win_threat[2]}"
			    	m = win_threat[2] + 1
			    	m.to_s
			    else
					remaining_cells = []
					board.cells.each_with_index { |item, index|
 						if item == " "
    						remaining_cells << index
						end
					}
					m = remaining_cells[rand(remaining_cells.length)] + 1
					m.to_s
		    	end

		    when 8 #i am X
				puts "board turn count is:#{board.turn_count}"
				win_threat = nil

			    WIN_THREATS.each do |combo|
			    	pos_1 = board.cells[combo[0]]
			    	pos_2 = board.cells[combo[1]]
			    	pos_3 = board.cells[combo[2]]

			    	if pos_1 == "O" && pos_2 == "O" && pos_3 == " "
			    		win_threat = combo
			    	end
            	end

            	if win_threat != nil
					puts "The win threat is:#{win_threat}"
			    	puts "To block the threat fill index #{win_threat[2]}"
			    	m = win_threat[2] + 1
			    	m.to_s
			    else
					remaining_cells = []
					board.cells.each_with_index { |item, index|
 						if item == " "
    						remaining_cells << index
						end
					}
					m = remaining_cells[rand(remaining_cells.length)] + 1
					m.to_s
				end
			end
		end
	end
end

