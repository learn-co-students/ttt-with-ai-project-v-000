require 'pry'

class Game
    attr_accessor :player_1, :player_2, :board

    WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left Column
    [1,4,7], # Central column
    [2,5,8], # Right Column
    [0,4,8], # Diagonal 1
    [2,4,6] # Diagonal 2
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        self.board = board
        self.player_1 = player_1
        self.player_2 = player_2
    end

    # TODO see if this is readable later
    def current_player

        move_counts = {:X => 0, :O => 0}

        board.cells.each do |cell|
            if cell == "X"
                move_counts[:X] += 1
            elsif cell == "O"
                move_counts[:O] += 1
            end
        end
        
        move_counts[:X] > move_counts[:O] ? self.player_2 : self.player_1
    end

    # confirms that there are all X or Os in win combo spots
    def won?
        WIN_COMBINATIONS.detect do |combo|
            self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
            self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
            # board.taken? expects string input from user
            board.taken?((combo[0] + 1).to_s)
        end
    end

    def draw?
        !won? && self.board.full?
    end

    def over?
        won? || draw?
    end

    def winner
        if winning_combo = won?
            return self.board.cells[winning_combo.first]
        end
    end

    def turn
        move = current_player.move(board)
        if self.board.valid_move?(move) 
            board.update(move, current_player)
        else
            turn
        end
    end
end