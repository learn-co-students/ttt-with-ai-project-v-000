module Players
  class Human < Player
    def move(board)
      gets.strip.downcase
    end
  end
end
