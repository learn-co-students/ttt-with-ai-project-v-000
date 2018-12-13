module Players

  class Human < Player
    
    def move(board)
      @user_input = gets.chomp
      if board.cells[@user_input.to_i-1] === "X" or board.cells[@user_input.to_i-1] === "O"
        puts "That space is already taken.  Please enter a valid number."
        @user_input = gets.chomp!
      end
      @user_input
    end
    
  end
  
end