module Players
  class Human < Player
    def move(_)
      gets.chomp
    end
  end
end