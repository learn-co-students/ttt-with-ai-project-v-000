module Players
  class Human < Player
    def move(position = nil)
      position = gets.chomp
      position
    end
  end
end
