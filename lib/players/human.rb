module Players

  class Players::Human < Player
    def move(board)
      gets.strip
    end
  end
end
