module Players
  class Computer < Player #inherits from Player

    attr_reader :input, :token

    def initialize(token)
      @token = token
    end

    def move(board) #generates a random number for the computer
      if board.turn_count <= 2
        ["2","4","5","6","8"].sample
      else
        rand(1..9).to_s
      end
    end

  end
end
