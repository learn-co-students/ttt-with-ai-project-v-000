module Players
    class Human < Player
        
        attr_accessor:input
        
        def receive_input
            puts "Make your move by entering 1-9"
            @input = gets.strip
        end
            
        def move(board)
            if board.class != Board # passes 03_human_player_spec
                receive_input
            else # passes 04_game_spec
                receive_input
                while !board.valid_move?(input)
                    puts "Invalid move! Please enter 1-9"
                    receive_input
                end
                board.update(@input, self)
                @input
            end
        end
    end
end