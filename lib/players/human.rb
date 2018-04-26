

module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)
      board.display

      puts "Please select a cell (1 though 9)."
      rtn = gets.strip

      rtn
    end

    def token
      super
    end
  end
end
