module Players
  class Computer < Player
    
    #FUTURE PLANS: To built a loop that loops through win combinations and cuts out the need for all the
    #repetitve code

    def move(board)
        #Game logic:
        #Try to pick corners and fill in the space between the pieces
        #unless the other player gets close to winning, then the computer
        #will block instead



        if board.valid_move?("7")
            "7"
        elsif block(board)
            block(board) 
        elsif board.valid_move?("1")
            "1"
        elsif board.position("7") == self.token && board.position("1") == self.token && board.valid_move?("4")
            "4"
           
        elsif board.valid_move?("9")
            "9"
            
        elsif board.position("7") == self.token && board.position("9") == self.token && board.valid_move?("8")
            "8"
            
        elsif board.position("1") == self.token && board.position("9") == self.token && board.valid_move?("5")
            "5"
               
        elsif board.valid_move?("3")
            "3"
        elsif board.valid_move?("4")
            "4"
        elsif board.valid_move?("8")
            "8"
        elsif board.valid_move?("6")
            "6"
        elsif board.valid_move?("2")
            "2"
        elsif board.valid_move?("5")
            "5"
        else
            move_options(board) 
        end
            
    end

    def block(board)
        #FUTURE PLANS: To built a loop that loops through win combinations and cuts out the need for all the
        #repetitve code


        ##### across
        if board.position("1") == self.opponent_token && board.position("3") == self.opponent_token && board.valid_move?("2")
            "2"
        elsif board.position("4") == self.opponent_token && board.position("6") == self.opponent_token && board.valid_move?("5")
            "5"
        elsif board.position("7") == self.opponent_token && board.position("9") == self.opponent_token && board.valid_move?("8")
            "8"
        elsif board.position("1") == self.opponent_token && board.position("2") == self.opponent_token && board.valid_move?("3")
            "3"
        elsif board.position("4") == self.opponent_token && board.position("5") == self.opponent_token && board.valid_move?("6")
            "6"
        elsif board.position("7") == self.opponent_token && board.position("8") == self.opponent_token && board.valid_move?("9")
            "9"   
        elsif board.position("2") == self.opponent_token && board.position("3") == self.opponent_token && board.valid_move?("1")
            "1" 
        elsif board.position("5") == self.opponent_token && board.position("6") == self.opponent_token && board.valid_move?("4")
            "4"
        elsif board.position("8") == self.opponent_token && board.position("9") == self.opponent_token && board.valid_move?("7")
            "7"

            ##### down
        elsif board.position("1") == self.opponent_token && board.position("4") == self.opponent_token && board.valid_move?("7")
            "7"
        elsif board.position("1") == self.opponent_token && board.position("7") == self.opponent_token && board.valid_move?("4")
            "4"
        elsif board.position("4") == self.opponent_token && board.position("7") == self.opponent_token && board.valid_move?("1")
            "1"
        elsif board.position("2") == self.opponent_token && board.position("5") == self.opponent_token && board.valid_move?("8")
            "8"
        elsif board.position("5") == self.opponent_token && board.position("8") == self.opponent_token && board.valid_move?("2")
            "2"
        elsif board.position("2") == self.opponent_token && board.position("8") == self.opponent_token && board.valid_move?("5")
            "5"
        elsif board.position("3") == self.opponent_token && board.position("9") == self.opponent_token && board.valid_move?("6")
            "6"
        elsif board.position("3") == self.opponent_token && board.position("6") == self.opponent_token && board.valid_move?("9")
            "9"
        elsif board.position("6") == self.opponent_token && board.position("9") == self.opponent_token && board.valid_move?("3")
            "3"

            ##### diagonal
        elsif board.position("1") == self.opponent_token && board.position("9") == self.opponent_token && board.valid_move?("5")
            "5"
        elsif board.position("1") == self.opponent_token && board.position("5") == self.opponent_token && board.valid_move?("9")
            "9"
        elsif board.position("5") == self.opponent_token && board.position("9") == self.opponent_token && board.valid_move?("1")
            "1"
        elsif board.position("3") == self.opponent_token && board.position("7") == self.opponent_token && board.valid_move?("5")
            "5"
        elsif board.position("3") == self.opponent_token && board.position("5") == self.opponent_token && board.valid_move?("7")
            "7"
        elsif board.position("5") == self.opponent_token && board.position("7") == self.opponent_token && board.valid_move?("3")
            "3"
        end
                
    end

    # Keeps track of the opponent's token
    def opponent_token
        self.token == "X" ? "O" : "X"
    end

    def move_options(board)
        moves = ["7", "1", "9", "3", "4", "8", "6", "2", "5"]
        move_to = moves.find {|place| !board.taken?(place)}
        move_to
    end

end
end