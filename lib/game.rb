class Game
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ]

    attr_accessor :board, :player_1, :player_2

    def initialize(
        player_1 = Players::Human.new("X"), 
        player_2 = Players::Human.new("O"), 
        board = Board.new
    )
        self.player_1 = player_1
        self.player_2 = player_2
        self.board = board
    end

    def current_player
        0 == board.turn_count % 2 ? player_1 : player_2
    end

    def over?
        self.draw? || self.won?
    end

    def won?
        cells = board.cells
        WIN_COMBINATIONS.detect do |win_combo|
            (cells[win_combo[0]] == "X" || cells[win_combo[0]] == "O") &&
            cells[win_combo[0]] == cells[win_combo[1]] &&
            cells[win_combo[1]] == cells[win_combo[2]]
        end
    end

    def draw?
        board.full? ? !self.won? : false
    end

    def winner
        win_combo = self.won?
        board.cells[win_combo[0]] if win_combo
    end

    def turn
        player_move = current_player.move(board)
        while (!board.valid_move?(player_move))
            player_move = current_player.move(board)
        end
        board.update(player_move, current_player)
    end

    def play
        while(!self.over?)
            self.turn
        end
        
        if (self.won?)
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat's Game!"
        end
    end
end