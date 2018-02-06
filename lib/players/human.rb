module Players
  class Human < Player

    def input_to_index(user_input)
      user_input.to_i - 1
      index = input_to_index(user_input)
    end

    def move(board)
      puts "Please enter 1-9:"
      user_input = gets.strip
    end
  end
end
