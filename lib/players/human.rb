module Players
  class Human < Player
    # your code here

    # def move(index, var)
    #   @board[index] = var.to_s
    # end

    def move(index)
      puts "Please select a position:"
      user_input = gets.strip
      user_input
    end

  end
end
