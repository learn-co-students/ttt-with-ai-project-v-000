

class Players

    class Computer < Player

        attr_accessor :places_of_tokens, :places_available, :combos_available, :final_combo, :challenger_places

        def move(board, win_combos)
            puts "AI is thinking....."
            sleep 3
            if board.turn_count >= 2
                find_tokens(board)
                places_taken_by_challenger(board)
                find_available_places(board)
                all_combos_available(win_combos)
                final_combos
                quickest_win_combo(board, win_combos)
             else
                rand(1..9).to_s
            end
        end

        def find_tokens(board)
            places_of_tokens = board.cells.each_index.select do|i|
                board.cells[i] == self.token
            end
            @places_of_tokens = places_of_tokens
       end

       def places_taken_by_challenger(board)
           challenger_places = board.cells.each_index.select do|i|
               board.cells[i] != self.token && board.cells[i] != " "
           end
           @challenger_places = challenger_places
       end

        def find_available_places(board)
            places_available = board.cells.each_index.select do |i|
                    board.cells[i] == " "
            end
            @places_available = places_available
        end

        def all_combos_available(win_combos)
            combos_available = win_combos.find_all do |combos|
                @places_of_tokens.any? do |elements|
                    elements == combos[0] || elements == combos[1] || elements == combos[2]
                end
            end
            @combos_available = combos_available

        end

        def final_combos
            final_combo = @combos_available.detect do |b|
                        if b.include?(@places_of_tokens[0]) &&  b.include?(@places_of_tokens[1]) ||  b.include?(@places_of_tokens[1]) &&  b.include?(@places_of_tokens[0])
                             b
                        end
                end
                @final_combo = final_combo
        end

        def quickest_win_combo(board, win_combos)
                    if @final_combo == nil
                    	second_best_option = @combos_available.detect do |b|
                    	  b.include?(@places_of_tokens[0]) || !b.all?{|e| @challenger_places.include?(e)}


                    	 end

                    	 next_move = second_best_option[0] + 1
                         next_move.to_s
                    else
                        best_option = final_combo.reject do |i|
                            @places_of_tokens.include?(i)
                        end

                      final_place = best_option[0] + 1
                      final_place.to_s
                    end

        end

    end
end
