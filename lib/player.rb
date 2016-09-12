class Player
    attr_reader:token
    attr_accessor:moves, :game
    
    def initialize(token)
        @token = token
        @moves = []
    end
    
    def add_move(input)
        @moves << input
    end
        
end