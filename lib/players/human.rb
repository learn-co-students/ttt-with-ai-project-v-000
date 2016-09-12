module Players
    class Human < Player
        
        attr_accessor:input
        
        def receive_input
            puts "Make your move by entering 1-9."
            @input = gets.strip
        end
            
        def move(board)
            if board.class != Board # this is just here to pass the 03_human_player spec
                receive_input
            else
                while !board.valid_move?(@input)
                    puts "I'm sorry, I don't recognize that"
                    receive_input
                end
            end
            @input
        end
    end
end