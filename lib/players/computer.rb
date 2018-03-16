

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
        ##find_quickest_win checks win combinataions and current board to find the first match with the most taken spaces
        # 1. Get the current board cells and WIN_COMBINATIONS from Game instance


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
            winning_place = quickest_win_combo(board, win_combos)

                #binding.pry
                #@places_of_tokens is an array of 2 and `int` is array of 3
                #unless int.include?(@places_of_tokens)
                    val = winning_place.select do |i|
                        !@places_of_tokens.include?(i)
                        #binding.pry
            end

            #binding.pry
            w_i_n = val[0] + 1
            w_i_n.to_s
        end

    end

end
