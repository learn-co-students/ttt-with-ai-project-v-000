module Players
  class Human < Player
    def move(board = nil)
      input = gets.chomp
      input
    end
  end

  class Computer < Player
    def move(board = nil)
      (1..9).to_a.sample.to_s
    end
  end
end
