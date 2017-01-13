module Players
  class Human < Player

    def move(board)
      puts "Please enter a number 1-9:"
      user_input = gets.strip
#      if board.valid_move?(user_input)
#        board.update(user_input, self.token)
#      else
#        puts "Please select a valid move:"
#      end
    end

  end
end
