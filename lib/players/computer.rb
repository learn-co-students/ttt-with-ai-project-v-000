require_relative '../player.rb'
class Player
	class Computer < Player
		WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
		
		def move(board)
			
			turn = nil
			positions = [0, 1, 2, 3, 4, 5, 6, 7, 8]
			
			#if first move takes position in the center
				if board.turn_count == 0
					 turn = "5"
				elsif board.turn_count > 0 
					#checks if there is any win combo occupied with 2 opponent's tokens
					has_2_of_opponent = WIN_COMBINATIONS.select{|i| i.select{|j| board.cells[j] == self.opponent_token}.length == 2}.flatten
				    #selects a win combo with two Os in it
					a = has_2_of_opponent.detect{|i|board.cells[i] == " "}
					if a != nil
						turn = (a+1).to_s
					else
						previous_turn = board.turns_taken[board.turns_taken.length - 2].to_i - 1 
						board.turns_taken.each_with_index do |i, turn| puts "#{i} - #{turn} - #{turn+1 == previous_turn ? '*' : ' ' }" end
						include_previous_turn = WIN_COMBINATIONS.select{|i| i.include?(previous_turn)}
						has_1_opponent_token = include_previous_turn.select{|i| i.detect{|j|board.cells[j] == self.opponent_token}}
						#include_previous_turn2= include_previous_turn.delete_if{|array| array == has_1_opponent_token.flatten}
						puts "hello prev turn#{previous_turn} has 1 opp token#{has_1_opponent_token} include prev turn#{include_previous_turn}" #del#{include_previous_turn2}"
						#turn = (include_previous_turn.sample + 1).to_s
						
				

						a = positions.select {|i| board.valid_move?((i+1).to_s)}
						turn = (a.sample + 1).to_s





				    end
					
				end
			return turn
				
		end
		
	end
end

