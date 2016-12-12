class Player::Computer < Player

	attr_accessor :board


	def move(*board)
		#asks the computer for input and return it
		binding.pry
		if board.turn_count.even?
			x_turn
		elsif board.turn_count.odd?
			o_turn
		end
	end



		def x_turn
			if board.turn_count == 0 then
				input = "5"
			elsif board.turn_count == 2
				then prng = Random.new
				input = prng.rand(1..9).to_s
			elsif board.turn_count == 4 ||  board.turn_count == 6 || board.turn_count == 8
				block_o
			end
		end

		def o_turn
			if board.turn_count == 1 
				if !board.taken?("5") then
					input = "5"
				else prng = Random.new
					input = prng.rand(1..9).to_s 
				end
			elsif board.turn_count == 3 || board.turn_count == 5 || board.turn_count ==7
				then block_x
			end
		end

		def block_o
			#123
			if board.position(1) == "O" && board.position(2) == "O" then
				input = "3"
			elsif board.positon(2) == "O" && board.position(3) == "O" then
				input = "1"
			elsif board.position(1) == "O" && board.position(3) == "O" then
				input = "2"
			#369
			elsif board.position(3) == "O" && board.position(6) == "O" then
				input = "9"
			elsif board.positon(3) == "O" && board.position(9) == "O" then
				input = "6"
			elsif board.position(6) == "O" && board.position(9) == "O" then
				input = "3"
			#789
			elsif board.position(7) == "O" && board.position(8) == "O" then
				input = "9"
			elsif board.positon(8) == "O" && board.position(9) == "O" then
				input = "7"
			elsif board.position(7) == "O" && board.position(9) == "O" then
				input = "8"
			#147
			elsif board.position(1) == "O" && board.position(4) == "O" then
				input = "7"
			elsif board.positon(1) == "O" && board.position(7) == "O" then
				input = "4"
			elsif board.position(4) == "O" && board.position(7) == "O" then
				input = "1"
			#158
			elsif board.position(1) == "O" && board.position(5) == "O" then
				input = "8"
			elsif board.positon(5) == "O" && board.position(8) == "O" then
				input = "1"
			elsif board.position(1) == "O" && board.position(8) == "O" then
				input = "5"
			#357
			elsif board.position(3) == "O" && board.position(5) == "O" then
				input = "7"
			elsif board.positon(3) == "O" && board.position(7) == "O" then
				input = "5"
			elsif board.position(5) == "O" && board.position(7) == "O" then
				input = "3"
			else prng = Random.new
					input = prng.rand(1..9).to_s 
			end	
	end

	def block_x
			#123
			if board.position(1) == "X" && board.position(2) == "X" then
				input = "3"
			elsif board.positon(2) == "X" && board.position(3) == "X" then
				input = "1"
			elsif board.position(1) == "X" && board.position(3) == "X" then
				input = "2"
			#369
			elsif board.position(3) == "X" && board.position(6) == "X" then
				input = "9"
			elsif board.positon(3) == "X" && board.position(9) == "X" then
				input = "6"
			elsif board.position(6) == "X" && board.position(9) == "X" then
				input = "3"
			#789
			elsif board.position(7) == "X" && board.position(8) == "X" then
				input = "9"
			elsif board.positon(8) == "X" && board.position(9) == "X" then
				input = "7"
			elsif board.position(7) == "X" && board.position(9) == "X" then
				input = "8"
			#147
			elsif board.position(1) == "X" && board.position(4) == "X" then
				input = "7"
			elsif board.positon(1) == "X" && board.position(7) == "X" then
				input = "4"
			elsif board.position(4) == "X" && board.position(7) == "X" then
				input = "1"
			#158
			elsif board.position(1) == "X" && board.position(5) == "X" then
				input = "8"
			elsif board.positon(5) == "X" && board.position(8) == "X" then
				input = "1"
			elsif board.position(1) == "X" && board.position(8) == "X" then
				input = "5"
			#357
			elsif board.position(3) == "X" && board.position(5) == "X" then
				input = "7"
			elsif board.positon(3) == "X" && board.position(7) == "X" then
				input = "5"
			elsif board.position(5) == "X" && board.position(7) == "X" then
				input = "3"
			else prng = Random.new
				input = prng.rand(1..9).to_s 
			end	
	end

end