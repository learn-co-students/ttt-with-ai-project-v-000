class Computer < Player
    def move(board)
        return rand(1..9).to_s
    end
end
