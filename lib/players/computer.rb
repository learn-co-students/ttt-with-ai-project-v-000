

class Players

    class Computer < Player


        attr_accessor :places_of_tokens

        def move(board, win_combos)
            puts "AI is thinking....."
            sleep 3                                     #put valid move to stop method rerunning
             if board.turn_count >= 4
                 winning_square(board, win_combos)
             else
                rand(1..9).to_s
            end

        end

        def quickest_win_combo(board, win_combos)
            places_of_tokens = board.cells.each_index.select do|i|
                board.cells[i] == self.token
            end

            @places_of_tokens = places_of_tokens

            win_combo_match = win_combos.find_all do |combos|
                places_of_tokens.any? do |elements|
                    elements == combos[0] || elements == combos[1] || elements == combos[2]
                end
            end

            combos_most_tokens = win_combo_match.find do |best_combo|
                best_combo.include?(places_of_tokens[0] && places_of_tokens[1])
            end
            combos_most_tokens
        end

        def winning_square(board, win_combos)
            winning_place = quickest_win_combo(board, win_combo)
                val = winning_place.select do |i|
                    !@places_of_tokens.include?(i)
                end
            w_i_n = val[0] + 1
            w_i_n.to_s
        end

    end

end
