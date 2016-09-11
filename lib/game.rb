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
    end
    
    def current_player
        @board.turn_count.even? ? player_1 : player_2
    end
    
    def over?
        if @board.full? || self.won? != []
            true
        else
            false
        end
    end
    
    ## refactor if at all possible
    def won?
        x_wins = WIN_COMBINATIONS.select { |array| @board.cells[array[0]] == "X" && @board.cells[array[1]] == "X" && @board.cells[array[2]] == "X"}
        o_wins = WIN_COMBINATIONS.select { |array| @board.cells[array[0]] == "O" && @board.cells[array[1]] == "O" && @board.cells[array[2]] == "O"}
        if  x_wins != []
            return x_wins
        elsif  o_wins != []
            return o_wins
        else
            return false
        end
    end

end