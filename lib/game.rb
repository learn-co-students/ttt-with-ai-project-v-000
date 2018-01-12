class Game
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    attr_accessor :player_1, :player_2, :board
    
    def initialize(player_1 = Players::Human('X'), player_2 = Players::Human('O'), board = Board.new)
    end

    def current_player
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

    def play
    end

    def start
    end

end