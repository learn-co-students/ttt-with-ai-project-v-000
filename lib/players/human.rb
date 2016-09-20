module Players
    class Human < Player
   
   ### This version passes tests, but the user input is still 
   ### in the Players::Human class, not the CLI class
   ### which was the goal of refactoring
        
        # def move(board)
        #     input = ""
        #     if board.class != Board # this is just here to pass the 03_human_player spec
        #         CLI.get_move
        #         input = gets.strip
        #     else
        #         CLI.get_move
        #         input = gets.strip
        #         while !board.valid_move?(input)
        #             puts "Invalid move!"
        #             CLI.get_move
        #             input = gets.strip
        #         end
        #     end
        #     input
        # end
    
    ### This version works during game play, but the test suite freaks out
        
        def move(board)
            CLI.get_move(board)
        end
    end
end