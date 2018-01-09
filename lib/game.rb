class Game
    attr_accessor :board, :player_1, :player_2
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7], 
        [2,5,8],
        [0,4,8],
        [2,4,6] 
    ]
    
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end
    
    def current_player
        self.board.turn_count.even? ? self.player_1 : self.player_2    
    end
    
    def turn
        puts "Please enter 1-9:"
        move = current_player.move(board)
        if board.valid_move?(move)
            board.update(move, current_player)
            board.display
        else
            puts "--Please enter a valid move--"
            turn
        end
    end
    
    def won?
        combo = WIN_COMBINATIONS.detect do |c|
            board.cells[c[0]] == "X" && board.cells[c[1]] == "X" && board.cells[c[2]] == "X" || 
            board.cells[c[0]] == "O" && board.cells[c[1]] == "O" && board.cells[c[2]] == "O"
        end
        combo
    end
    
    def draw?
     !won? && board.full? 
    end
    
    def over?
        won? || draw?   
    end
    
    def winner
        won = won?
        if won.is_a? Array
            board.cells[won[0]]
        end
    end
    
    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end    
    end
    
end