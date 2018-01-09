class Player
    attr_reader :token

    def initialize(token)
      token.nil? ? @token = "X" : @token = token
    end

end 
