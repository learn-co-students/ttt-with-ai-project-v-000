module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)
      board.display
      puts "Please enter 1-9:"

      move = gets.strip
      if move.downcase == "exit"
        exit!
      end
      move
    end
  end

end
