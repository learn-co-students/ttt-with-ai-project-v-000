class Player::Computer < Player

    def move(board)
        if board.turn_count == 0 || board.turn_count == 1
            if board.valid_move?("5")
                return "5"
            elsif [1, 3, 7, 9].select {|num| board.valid_move?("#{num}")}.length > 0
                [1, 3, 7, 9].select {|num| board.valid_move?("#{num}")}.sample.to_s
            end
        else
            rand(9).to_s
        end
    end
end
