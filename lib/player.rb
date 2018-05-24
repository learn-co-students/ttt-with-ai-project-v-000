class Player

    attr_reader :token

    def initialize(token = "X")
      @token = token
    end

    def move
      input = gets.strip
    end


end
