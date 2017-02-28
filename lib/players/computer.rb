module Players
  class Computer < Player #inherits from Player

    attr_reader :input, :token

    def initialize(token)
      @token = token
    end

    def move(board) #generates a random number for the computer
      rand(1..9).to_s
    end

  end
end
