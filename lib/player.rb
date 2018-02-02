class Player
    attr_reader :token
    #cannot be changed once assigned
    
    def initialize(token)
        @token = token
    end
    #accepts a token to assign
end
