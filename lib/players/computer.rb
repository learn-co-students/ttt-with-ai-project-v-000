module Players
  class Computer < Player

    def initialize(token)
      @token = token
    end

    def move(board)
      a = Random.new
      input = " "
      until board.valid_move?(input)
        input = "#{a.rand(1..9)}"
      end
      input
    end
  end
end
