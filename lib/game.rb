require 'pry'
class Game
    
    attr_accessor :board, :player_1, :player_2
    
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
        @player_1 = p1
        @player_2 = p2
        @board = board
    end
    
    def current_player
        self.board.turn_count.even? || self.board.turn_count == 0 ? self.player_1 : self.player_2
    end
    
    def over?
        self.won? != false || self.draw? == true
    end
    
    def won?
        WIN_COMBINATIONS.each do |win_combination|
            if self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" &&      self.board.cells[win_combination[2]] == "X" || self.board.cells[win_combination[0]] == "O" &&      self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O"
            return win_combination
            end
        end
        return false
    end
    
    def draw?
        self.won? == false && self.board.full? == true
    end
    
    def winner
        self.won? != false ? self.board.cells[self.won?[0]] : nil
    end
    
    def turn
        input = self.current_player.move(input = nil)
        if self.board.valid_move?(input) == false
            turn
        end
        if self.board.valid_move?(input) == true
            self.board.update(input, self.current_player)
        end
    end
    
    def play
        until self.over? == true
            self.turn
        end
        puts "Congratulations #{self.winner}!" if self.won? != false
        puts "Cat's Game!" if self.draw? == true
    end
    
end