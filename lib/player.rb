class Player
    
    attr_reader :token
    
    def initialize(token)
        @token = token
    end
    
    def move(board)
    end
    
    def display
        puts "It's #{@token}'s turn."
    end
end