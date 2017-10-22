class Player

    attr_accessor :board
    attr_reader :token
  
    def initialize(token)

        @token = token

    end

    def token
        @token

    end
end