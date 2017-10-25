module Players
    class Human < Player
        def move board
            board.display
            puts "Current player is #{self.token}"
            puts "Please enter 1-9 to select your move as shown below:"
            puts ""
            display_row 0
            puts "-----------"
            display_row 3
            puts "-----------"
            display_row 6
            puts ""
            #only needs to get input to pass the test
            gets.chomp
        end

        def display_row num
            puts " #{num + 1} | #{num + 2} | #{num + 3} "
        end
    end
end
