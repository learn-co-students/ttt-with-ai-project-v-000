require 'pry'

module Players
    class Computer < Player
        def move(board)
           valid_moves = [*1..9].select { |i|
               board.valid_move?(i)
               }
            
#            valid_moves.sample.to_s #pick a random valid move
            
            # let's make this thing smarter
            possible_win_combinations = WIN_COMBINATIONS.collect { |wc|
                wc.any? { |space| space == @token    }
                }
                binding.pry
        end
    end
end