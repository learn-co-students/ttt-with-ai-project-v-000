module Players
  class Human < Player
    def move(user_input, board = nil)
      gets.chomp
    end
  end
end
