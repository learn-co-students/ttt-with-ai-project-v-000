require 'pry'

module Players
    class Computer < Player


        def set_opponent
            @token == "X" ? @opponent = "O" : @opponent = "X"        
        end

        def move(board)
            set_opponent
            valid_moves = [*1..9].select { |i|
                board.valid_move?(i)
                }

            # valid_moves.sample.to_s #pick a random valid move

            # let's make this thing smarter
            possible_win_combinations = Game::WIN_COMBINATIONS.select { |wc|
                wc.any? { |space| board.cells[space] == @token    }
                }

            possible_lose_combinations = Game::WIN_COMBINATIONS.select { |wc|
                wc.any? { |space| board.cells[space] == @opponent    }
                }

            if possible_win_combinations == []
                valid_moves = [1,3,5,7,9].select { |i| valid_moves.include?(i)}
                valid_moves.sample.to_s
            else
                possible_moves = possible_win_combinations.flatten.uniq.select { 
                    |i| valid_moves.include?(i) && possible_lose_combinations.flatten.uniq.include?(i)
                    }

                #binding.pry
                possible_moves.sample.to_s
            end
        end
    end
end