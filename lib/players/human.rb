module Players
  class Human < Player
    def move(user_input, board = nil)
      user_input = gets.chomp
    end
  end
end
