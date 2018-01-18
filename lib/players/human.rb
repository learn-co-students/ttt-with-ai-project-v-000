module Players
  class Human < Player

    attr_accessor:input

    def user_input
        puts "Make your move by entering 1-9."
        @input = gets.strip
    end

    def move(board)
        if board.class != Board
            user_input
        else
            user_input
            while !board.valid_move?(@input)
                puts "Invalid move!"
                user_input
            end
        end
        @input
    end
 end
end
