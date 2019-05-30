module Players
  class Human < Player
    def move(board)
      gets.chomp
    end
  end
end