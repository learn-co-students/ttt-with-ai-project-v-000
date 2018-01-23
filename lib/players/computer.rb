module Players
    class Computer < Player

        def move(board)
            ai = rand(1-9)
            if board.valid_move?(ai) then ai.to_s
            end
        end

        def block
            #WIN_COMBINATIONS.collect do {
                #|combo| if combo[0] && combo[1] 
            #}
            #if two spaces out of three are human/other, move to third
        end

        def win
            #if two spaces out of three are computer, move to the third
        end
    end
end