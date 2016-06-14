class Player
    attr_reader :token, :opp_token
    
    def initialize(token)
       @token = token 
       @token == "X" ? @opp_token = "O" : @opp_token = "X"
    end
end