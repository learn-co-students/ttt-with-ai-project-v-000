module Players

  class Human < Player
    
    def move(board)
      # until board.cells[@user_input.to_i-1] != "X" || board.cells[@user_input.to_i-1] != "O"
      #   # puts "That space is already taken.  Please enter a valid number."
      @user_input = gets.chomp
      if position_taken?(board,@user_input) == false && valid_move?(board,@user_input) == true
        @user_input
      else
        "Fuck you."
      end
    end
    
    def position_taken?(board,user_input)
      if board.cells[user_input.to_i] == "X" || board.cells[user_input.to_i] == "O"
        true
      else
        false
      end
    end

    def valid_move?(board,user_input)
      if position_taken?(board,user_input.to_i) == false && user_input.to_i.between?(0,8) == true
        true
      else
        false
      end
    end

  end

end