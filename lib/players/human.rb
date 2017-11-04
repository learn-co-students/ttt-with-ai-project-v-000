module Players

  class Human < Player

    def move(position)
      input = gets.chomp
      puts input
      return input
    end
  end
end
