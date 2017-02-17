class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    
    attr_accessor :board, :player_1, :player_2
    
    def initialize(
        player_1 = Players::Human.new("X"),
        player_2 = Players::Human.new("O"),
        board = Board.new)
        
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end
    
    def current_player
        # whose turn is it?
        # odd turns = "X" or player_1
        # even turns = "O" or player_2
        board.turn_count % 2 == 0 ? player_2 : player_1
    end
    
    def over?
        
    end
    def won?
        
    end
    
    def draw?
    end
    
    def winner
    end
    
    def turn
    end
end