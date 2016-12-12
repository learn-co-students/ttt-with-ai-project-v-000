module Players
    class Human < Player
   
        def move(board)
            puts "Make your move by entering 1-9."
            gets.strip
        end
    end
end