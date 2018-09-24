module Players
  class Computer < Player

    def initialize(token = "X")
      @token = token
    end

    def token
      @token
    end

    def move(board)
      ran = rand(9)+1

      ran.to_s


    end
  end
end
