require 'pry'
class Game

    
  attr_accessor :board, :player_1, :player_2
  attr_reader :token, :human, :computer
  
  WIN_COMBINATIONS = 
    [
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
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def turn_count
      counter = 0
      self.board.cells.each do |count|
        if count == "O" || count == "X"
          counter +=1
        end
      end
      counter
    end

    def current_player
      turn_count % 2 == 0 ? self.player_1 : self.player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |win_combos|
        win_index_1 = win_combos[0]
        win_index_2 = win_combos[1]
        win_index_3 = win_combos[2]

        position_1 = self.board.cells[win_index_1]
        position_2 = self.board.cells[win_index_2]
        position_3 = self.board.cells[win_index_3]

        position_1 == "X" && position_2 == "X" && position_3 == "X" ||
        position_1 == "O" && position_2 == "O" && position_3 == "O"
      end
    end
    
    def draw?
      self.board.full? && !won?
    end

    
    def over?
      if draw? || won?        
        true
      end       
    end

    def winner
      if won? 
       winner = self.board.cells[won?[0]] 
      end
     winner 
    end

    def turn
      current_move = current_player.move(self.board)
      if self.board.valid_move?(current_move) == true
        self.board.update(current_move, current_player)
      else self.board.valid_move?(current_move) == false
        turn
      end            
    end
      
    def play
      while over? != true
        turn
      end
      if won? 
        puts "Congratulations #{winner}!"
      end
      if draw?
        puts "Cat's Game!"
      end
    end

end