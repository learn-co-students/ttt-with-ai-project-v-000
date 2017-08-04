module Players
  class Computer < Player
    attr_reader :token

    def initialize(token = "X")
      @token = token
    end

    def move(input)

    end

  end

end
