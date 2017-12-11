module Players
  class Human < Player

    def move(board)
      puts "Enter move"
      user_input = gets.chomp
      if !(user_input.to_i >= 1 && user_input.to_i <= 9)
        self.move(board)
      end
      user_input
    end
  end
end
