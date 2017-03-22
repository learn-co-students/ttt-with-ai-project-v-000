require_relative "../../config/environment.rb"

module Players
	class Computer < Player

		def move(board)

			winning_chance_array = Game::WIN_COMBINATIONS
			# WIN_COMBINATIONS = [[0,1,2],
			# 										[3,4,5],
			# 										[6,7,8],
			# 										[0,3,6],
			# 										[1,4,7],
			# 										[2,5,8],
			# 										[0,4,8],
			# 										[6,4,2]]

			move_order_array = [5, 1, 3, 7, 9, 2, 4, 6, 8]

			# All of opponent's positions in index format
			opponent_indices_array = board.cells.collect.with_index {|t, index| index if t != " " && t != token}.delete_if{|element| element == nil}

			# All of current player's positions in index format
			current_indices_array = board.cells.collect.with_index {|t, index| index if t != " " && t == token}.delete_if{|element| element == nil}

			#Discover Opponent's Positions
			set_opponent = winning_chance_array
			opponent_indices_array.each { |e|
				# New set_opponent will show opponent's
				set_opponent	=	set_opponent.collect.with_index { |combo, index|
					combo.collect { |element|
						if e == element
							element = "A"
						else
							element
						end
					}
				}
		  }

			#Discover Current Player's Positions
			set_current = winning_chance_array
			current_indices_array.each { |e|
				# New set_current will show current player's
				set_current	=	set_current.collect.with_index { |combo, index|
					combo.collect { |element|
						if e == element
							element = "A"
						else
							element
						end
					}
				}
		  }

			# Returns the index of set_opponent (winning_chance_array) where the opponent is 1 move away from winning
			opponent_indexOfWinComboArray = set_opponent.collect {|combo| combo.count("A")}.find_index(2)
			if opponent_indexOfWinComboArray != nil
				move_to_index = set_opponent[opponent_indexOfWinComboArray].find{|x| x != "A"}
				move_to_index += 1
				move_to_index = move_to_index.to_s
			end

			# Returns the index of set_current (winning_chance_array) where the current player is 1 move away from winning
		  current_indexOfWinComboArray = set_current.collect {|combo| combo.count("A")}.find_index(2)
			if current_indexOfWinComboArray != nil
				attack_move_to_index = set_current[current_indexOfWinComboArray].find{|x| x != "A"}
				attack_move_to_index += 1
				attack_move_to_index = move_to_index.to_s
			end

			# Blocker
			if opponent_indexOfWinComboArray != nil && board.valid_move?(move_to_index)
						"#{move_to_index}"


			# Attacker
			else
				if current_indexOfWinComboArray != nil && board.valid_move?(attack_move_to_index)
					"#{attack_move_to_index}"
				else
					move_to_index = move_order_array.detect {|p| board.valid_move?(p.to_s)}
					"#{move_to_index}"
				end
			end
# binding.pry
		end
	end
end

	# *********************************************************************
	# Blocker
	# 	Collect all opponent's current positions
	# 		Check for possible WIN COMBOS
	# 			if a possible WIN COMBO is found wth 1 move away from completing COMBO
	# 				Move in " " space to block WIN COMBO
	# Attacker
	# 	Collect all current player's positions
	# 		Check for possible WIN COMBOS
	# 			if a possible WIN COMBO is found with 1 move away from completing COMBO
	# 				Move in " " space to complete COMBO to win
	# 			if

	# 			Move_Priority
	# 			unless Corner move can NOT result player with a WIN COMBO
	# 				Center, then corners, then in-betweens
	# 			end
	# *********************************************************************



# 			# Unintelligent AI
# 			if !board.taken?("5")
# 				"5"
# 			elsif !board.taken?("1")
# 				"1"
# 			elsif !board.taken?("3")
# 				"3"
# 			elsif !board.taken?("7")
# 				"7"
# 			elsif !board.taken?("9")
# 				"9"
# 			elsif !board.taken?("2")
# 				"2"
# 			elsif !board.taken?("4")
# 				"4"
# 			elsif !board.taken?("6")
# 				"6"
# 			elsif !board.taken?("8")
# 				"8"
# 			end
# end
# end
# end


#Testing
# game.current_player.token
# opponent_indices_array = [5]
# board.cells = [" ", " ", " ", " ", "O", " ", " ", " ", " "]
