module Players



class Computer < Player
@@random_smack_array = []
@@random_smack_array << "Frankly my dear I don't give a damn."
@@random_smack_array << "Elementary my dear Watson."
@@random_smack_array << "I'll get you my pretty. And your little dog, too."
@@random_smack_array << "Play it again, Sam."
@@random_smack_array << "This isn't personal, Kay. This is business."
@@random_smack_array << "What we have here is a failure to communicate."
@@random_smack_array << "I love the smell of napalm in the morning. It smells like victory."
@@random_smack_array << "Gutsiest move I ever saw Mav."      
        def move (board)
        
        #gets an array of indices that are open
        possible_moves = board.available_cells
        #randomly selects among the available cells (whose indices not board position are in the array possible_moves)
        #once it picks one, it adds one to that value to convert it from the index of an empty cell to its corresponding
        #"board move", as if a human saw the menu options and put in a 1 for what is actually the 0 index1

        actual_move = possible_moves[rand(possible_moves.count-1)] + 1

        

        #throws in a bit of smack talk
        puts @@random_smack_array[rand(@@random_smack_array.count-1)]
        actual_move.to_s
        end
end





end

