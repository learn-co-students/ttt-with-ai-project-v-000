module Players
  class Human < Player

    def move(board)
      "Where would you like to move?"
      answer = gets.chomp
      answer.to_s
    end

  end
end
