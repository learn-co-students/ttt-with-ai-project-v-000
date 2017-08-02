module Players
  class Human < Player

    def move(board) #board is being passed in as an array
      user_input = gets.strip
      if board[user_input.to_i-1] == " "
        board[user_input.to_i-1] == self.token
      end
      user_input
    end
  end
end
