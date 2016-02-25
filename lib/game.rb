require 'pry'

class Game
    
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
    
    attr_accessor :board, :player_1, :player_2
    
    def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end
    
    def current_player
        board.turn_count.odd? ? player_2 : player_1 
    end
    
    def over?
      won? || draw?
    end
    
    def won?
      WIN_COMBINATIONS.each do |array|
        if array.all? { |item| board.cells[item] == 'X'} || 
          array.all? { |item| board.cells[item] == 'O'}
          return array
        end
      end
     false
    end
    
    def draw?
        board.full? && !won? 
    end
    
    def winner
      board.cells[won?[0]] if won?
    end
    
    def turn
        player = current_player
        player.display
        current_move = player.move(@board)
        if !@board.valid_move?(current_move)
          turn
        else
        @board.update(current_move, player)
        board.display
        end
    end
  
    
    def play
        until over?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        else draw?
          puts "Cats Game!"
        end
    end
end



    