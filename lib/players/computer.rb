

class Players

    class Computer < Player


        attr_accessor :places_of_tokens

        def move(board, win_combos)
            puts "AI is thinking....."
            sleep 3
             if board.turn_count >= 4
                 winning_square(board, win_combos) ##can't make turn for some reason
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

                #reactor that on the first turn each player chooses the either corners
                #I think it's recognizing both tokens qui
                # it freezes, It has no where to go. add else
                #could be in winning_square statment that takes next closest
                #keeps printing "O"
            combos_most_tokens = win_combo_match.find do |best_combo|
                best_combo.include?(places_of_tokens[0] && places_of_tokens[1])
                # var = best_combo - (@places_of_tokens[0]..@places_of_tokens[1]).to_a
                # var
            end
            combos_most_tokens
            #binding.pry
        end

        def winning_square(board, win_combos)
            winning_place = quickest_win_combo(board, win_combos)

                val = winning_place.reject do |i|
                    #binding.pry
                    @places_of_tokens.include?(i)
                    #binding.pry
                end
            w_i_n = val[0] + 1
            w_i_n.to_s
        end

    end

end
