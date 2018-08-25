module Players
  class Human < Player # inherits from player
    def move(board)
      gets.chomp
    end
  end
end
