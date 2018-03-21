

class Players

    class Computer < Player


        attr_accessor :places_of_tokens

        def move(board, win_combos)
            puts "AI is thinking....."
            sleep 3
            if board.turn_count >= 4
                quickest_win_combo(board, win_combos)
             else
                rand(1..9).to_s
            end
        end

        def quickest_win_combo(board, win_combos)
            places_of_tokens = board.cells.each_index.select do|i|
                board.cells[i] == self.token
            end
            @places_of_tokens = places_of_tokens

            places_available = board.cells.each_index.select do |i|
                    board.cells[i] == " "
            end
            @places_available = places_available
            binding.pry

                    combos_available = win_combos.find_all do |combos|
                        @places_of_tokens.any? do |elements|
                            elements == combos[0] || elements == combos[1] || elements == combos[2]
                        end
                    end
                    final_combo = combos_available.detect do |b|
                    			if b.include?(@places_of_tokens[0]) &&  b.include?(@places_of_tokens[1]) ||  b.include?(@places_of_tokens[1]) &&  b.include?(@places_of_tokens[0])
                    	 			 b
                    	 		end
                    	end

                    if final_combo == nil
                    	second_best_option = combos_available.detect do |b|
                    	 b.include?(@places_of_tokens[0]) ||  b.include?(@places_of_tokens[1])
                    	 end
                    	 second_best_option[0] + 1
                    else
                    best_option = final_combo.reject do |i|
                        @places_of_tokens.include?(i)
                      end
                    best_option + 1
                    end
		       binding.pry
    end


        # def winning_square(board, win_combos)
        #     winning_place = quickest_win_combo(board, win_combos)
        #     binding.pry
        #         val = winning_place.reject do |i|
        #             #binding.pry
        #             !@places_of_tokens.include?(i)
        #             #binding.pry
        #         end
        #         binding.pry
        #     w_i_n = val[0] + 1
        #     w_i_n.to_s
        # end
    end
end
