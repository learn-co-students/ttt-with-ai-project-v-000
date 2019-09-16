module Players
	class Computer < Player

		WIN_COMBINATIONS = [["1","2","3"],["1","4","7"],["1","5","9"],["3","6","9"],["2","5","8"],["3","5","7"],["4","5","6"],["7","8","9"]]
		
		def move(board)
			valid_move = [1,2,3,4,5,6,7,8,9]

			WIN_COMBINATIONS.each do |combo|
				
				possible_win = combo.collect do |num| 
					if board.valid_move?(num)  
						num 
					else
						i = num.to_i
					 board.cells[i-1]
					end
				end
				# binding.pry

				if possible_win.select{|num| num == "X" || num == "O"}.size == 3
					"nothing"
				else
					if possible_win.select{|i| i == "X"}.size == 2
						return possible_win.select{|num| num != "X"}[0]
					elsif possible_win.select{|i| i == "O"}.size == 2
						return possible_win.select{|num| num != "O"}[0]
					end
				end
			end

			valid_move.collect do |num|
				if board.valid_move?(num.to_s)
					return num
				end
			end

		end
	end
end