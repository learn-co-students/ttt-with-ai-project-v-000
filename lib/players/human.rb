module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)
      #binding.pry
      #board.display
      #puts "Please enter 1-9:"
      move = gets.strip
      #binding.pry
      if move.downcase == "exit"
        exit!
      end
      move
    end
  end

end
