class Game
    include Matchable
    
   attr_accessor :board, :player_1, :player_2
   
   WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
   
   
    def initialize(p1=Players::Human.new("X"), p2=Players::Human.new("O"), board=Board.new())
        self.board = board
        self.player_1 = p1
        self.player_2 = p2
    end
    
    
    def current_player
        board.turn_count % 2 == 0 ? player_1 : player_2
    end
    
    def over?
        draw? || won?
    end
    
    
    def won?
        winner = false
        
        WIN_COMBINATIONS.detect {|combo|
            winner = combo if match_two(combo[0], combo[1]) && match_two(combo[1], combo[2]) && board.cells[combo[0]] != " "
        }
        winner
    end
    
    
    def draw?
        board.full? && !won?
    end
    
    def winner
       won?.class == Array ? board.cells[won?[0]] : nil
    end
    
    
    def turn
        board.display
        input = current_player.move(board)
        board.valid_move?(input) ? board.update(input, current_player) : turn
    end
    
    
    def play
        turn until over?
        board.display
        puts "Cat's Game!" if draw?
        puts "Congratulations #{winner}!" if won?

        ##wargames
        draw? ? "cats" : winner
    end
    
end