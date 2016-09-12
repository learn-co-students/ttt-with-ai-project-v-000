require 'pry'

class Game
    WIN_COMBINATIONS = [
        [0,1,2], # top row
        [3,4,5], # middle row
        [6,7,8], # bottom row
        [0,3,6], # first column
        [1,4,7], # second column
        [2,5,8], # third column
        [0,4,8], # top left to bottom right diagonal
        [2,4,6]  # top right to bottom left diagonal
    ]
  
    attr_accessor:board, :player_1, :player_2
  
    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
        @player_1.game = self
        @player_2.game = self
    end
    
    def current_player
        @board.turn_count.even? ? player_1 : player_2
    end
    
    def not_current_player
        @board.turn_count.even? ? player_2 : player_1
    end
    
    def over?
        !self.draw? && !self.won? ? false : true
    end
    
    
    def won?
        x_wins = WIN_COMBINATIONS.select { |array| @board.cells[array[0]] == "X" && @board.cells[array[1]] == "X" && @board.cells[array[2]] == "X"}
        o_wins = WIN_COMBINATIONS.select { |array| @board.cells[array[0]] == "O" && @board.cells[array[1]] == "O" && @board.cells[array[2]] == "O"}
        
        if x_wins != []
            x_wins.flatten
        elsif o_wins != []
            o_wins.flatten
        else
            false
        end
    end
    
    def draw?
        @board.full? && !self.won? ? true : false
    end
    
    def winner
        if won?
            @board.cells[self.won?[0]]
        end
    end
            
    def turn
        move = self.current_player.move(@board)
        current_player.add_move(move)
        @board.update(move, self.current_player)
    end
    
    def play
        while !self.over?
            @board.display
            puts ""
            self.turn
        end
        if self.won?
            @board.display
            puts "Congratulations #{winner}!"
            return self.winner
        else
            @board.display
            puts "Cats Game!"
            return self.winner
        end
    end
end