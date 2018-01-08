class Game
    
    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], #Top
        [0, 3, 6], [1, 4, 7], [2, 5, 8], #vertical - array 1
        [0, 4, 8], [2, 4, 6], #diagonal - array 2
    ]
    
    attr_accessor :player_1, :player_2, :board
    
    def initialize(player_1 = Players::Human.new("X"), player_2 =  @player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end 
    
    def current_player
        board.turn_count % 2 == 0 ? player_1 : player_2
    end
    
    def over?
        won? || draw?
    end   
    
    def won?
      WIN_COMBINATIONS.detect do |c|
          board.cells[c[0]] == board.cells[c[1]] && board.cells[c[1]] == board.cells[c[2]] && board.cells[c[0]] != " "
        end 
    end 
    
    def draw?
        board.full? && !won?
    end 
    
    def winner
        if winner = won? then board.cells[winner[0]] end
    end 
    
    def turn
        move = current_player.move(board)
        board.valid_move?(move) ? board.update(move, current_player) : turn
    end 
    
    def play 
        board.display
        while !over?
            turn
            board.display
        end 
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
    end
    
    
        
    
end 