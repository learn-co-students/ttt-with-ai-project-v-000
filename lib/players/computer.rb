require_relative "../../config/environment.rb"

module Players
	class Computer < Player

		def move(board)

			winning_chance_array = Game::WIN_COMBINATIONS

			if !board.taken?("5")
				"5"
			elsif !board.taken?("1")
				"1"
			elsif !board.taken?("3")
				"3"
			elsif !board.taken?("7")
				"7"
			elsif !board.taken?("9")
				"9"
			elsif !board.taken?("2")
				"2"
			elsif !board.taken?("4")
				"4"
			elsif !board.taken?("6")
				"6"
			elsif !board.taken?("8")
				"8"
			end

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
	# 		Check for possibkle WIN COMBOS
	# 			if a possible WIN COMBO is found with 1 move away from completing COMBO
	# 				Move in " " space to complete COMBO to win
	# 			if

	# 			Move_Priority
	# 			unless Corner move can NOT result player with a WIN COMBO
	# 				Center, then corners, then in-betweens
	# 			end
	# *********************************************************************

			# 	# set = []
			# 	#All of opponent's positions (index format)
			# 	opponent_indices_array = board.cells.collect.with_index {|token, index| index if token != " " && token != game.current_player.token}.delete_if{|element| element == nil}

			# 	#[0,1]
			# 	opponent_indices_array.each {|e|
			# 		set[e] = winning_chance_array.collect {|combo|
			# 			combo.collect {|element|

			# 					if e == element
			# 						element = game.current_player.token
			# 					else
			# 						element
			# 					end
			# 			}
			# 		}
			# 	}


			# 		opponent_indices_array.each { |e|
			# 			winning_chance_array.collect.with_index { |combo, index|
			# 				token_layout_array[e][index] = combo.collect { |element|

			# 					if e == element
			# 						element = game.current_player.token
			# 					else
			# 						element
			# 					end
			# 				}
			# 			}
			# 		}


			# 	# Game::WIN_COMBINATIONS.each{|combo| combo.collect.with_index{|position_index, index| combo[index] = if position_index == opponent_indices_array.each {|c| c }}}

			# 	#All available positions (in index format) with " " on the board
			# 	unfilled_indices_array = board.cells.collect.with_index {|token, index| index if token == " "}.delete_if{|element| element == nil}

			# # end

			# 	#All current player's positions (index format)
			# 	currentplayer_indices_array = board.cells.collect.with_index {|token, index| index if token == game.current_player.token}.delete_if{|element| element == nil}

			# 	#UNIFINISHED - Mark all index elements of WIN_COMBINATIONS that current player has on the board.
			# 	currentplayer_indices_array.each {|position_index| position_index}










		# #Remember to convert index-mode back to string-mode
