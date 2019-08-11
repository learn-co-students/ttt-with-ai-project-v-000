module Players
  class Computer < Player

    WIN_COMBINATIONS = [
	  [0,1,2], [3,4,5], [6,7,8],
	  [0,3,6], [1,4,7], [2,5,8],
	  [0,4,8], [2,4,6]
	    ]

    def turn_count
	    turn_count = 0
	    @board.cells.each do |data|
	      if data == "X" || data == "O"
	        turn_count += 1
	      end
	    end
	   	turn_count
		 end

		def open_spot(board)
		  open = []
			board.cells.each_with_index do |cell, index|
		      if cell == " "
		        open << (index + 1)
		      end
		    end
		  open
		end


		def move(board)
			if win_or_block(board)
				next_move = win_or_block(board)
			else
				next_move = open_spot(board).sample.to_s
			end
			next_move
		end

		def win_or_block(board)
			next_move = nil
			WIN_COMBINATIONS.each do |combo|
		      pos_1=combo[0]
		      pos_2=combo[1]
		      pos_3=combo[2]

		      pos_1_val=board.cells[pos_1]
		      pos_2_val=board.cells[pos_2]
		      pos_3_val=board.cells[pos_3]
		      puts pos_1
		      puts pos_2
		      puts pos_3

		      if token == "X"
			      if [pos_1_val,pos_2_val,pos_3_val].count("X") == 2 && [pos_1_val,pos_2_val,pos_3_val].count("O") == 0
			      	if pos_1_val == " "
                     	next_move = (pos_1 + 1).to_s
			      	elsif pos_2_val == " "
			      		next_move = (pos_2 + 1).to_s
			      	elsif pos_3_val == " "
			      		next_move = (pos_3 + 1).to_s
			      	end
			      end
			      if [pos_1_val, pos_2_val, pos_3_val].count("O") == 2 && [pos_1_val,pos_2_val,pos_3_val].count("X") == 0
			      	if pos_1_val == " "
			      		next_move = (pos_1 + 1).to_s
			      	elsif pos_2_val == " "
			      		next_move = (pos_2 + 1).to_s
			      	elsif pos_3_val == " "
			      		next_move = (pos_3 + 1).to_s
			      	end
			      end
			  elsif token == "O"
			  	  if [pos_1_val, pos_2_val, pos_3_val].count("O") == 2 && [pos_1_val,pos_2_val,pos_3_val].count("X") == 0
			  	  	if pos_1_val == " "
			      		next_move = (pos_1 + 1).to_s
			      	elsif pos_2_val == " "
			      		next_move = (pos_2 + 1).to_s
			      	elsif pos_3_val == " "
			      		next_move = (pos_3 + 1).to_s
			      	end
			      end
			      if [pos_1_val, pos_2_val, pos_3_val].count("X") == 2 && [pos_1_val, pos_2_val, pos_3_val].count("O") == 0
			      	if pos_1_val == " "
			      		next_move = (pos_1 + 1).to_s
			      	elsif pos_2_val == " "
			      		next_move = (pos_2 + 1).to_s
			      	elsif pos_3_val == " "
			      		next_move = (pos_3 + 1).to_s
			      	end
			      end
			  end
			end
  		next_move
  		end

  end
end
