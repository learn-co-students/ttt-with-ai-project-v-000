require 'pry'
module Players
    class Computer < Player
        def move(board)
            valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            valid_moves.detect {|index| board.valid_move?(index)}
            # WIN_COMBINATIONS.detect {|wincomb| wincomb.map {|index| board.valid_move?(index)}}
        end
    end
end
