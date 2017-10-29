module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)
      move = gets.strip
      if move.downcase == "exit"
        exit!
      end
      move
    end
  end

end
