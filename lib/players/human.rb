module Players
  class Human < Player

    def initialize(token)
      @token = token
    end

    def move(board)
      board.display
      puts "Please enter 1-9:"
      input = " "
      until board.valid_move?(input)
        input = gets.strip
      end
      input
    end
  end
end
