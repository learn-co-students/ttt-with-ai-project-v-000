module Players
  class Human < Player
    attr_accessor :board
    def move(board)
      gets.strip
    end
  end
end
