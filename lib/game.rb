require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end
  
  def over?
    draw? || won?
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
      combination.all?{|i| board.cells[i] == "X"} || combination.all?{|i| board.cells[i] == "O"}
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def winner
    board.cells[won?[0]] if won?
  end
  
  def turn
    self.board.display 
    puts "************"
    puts "Make Your Move"
    puts "************"
    input = self.current_player.move(self.board)
    
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
    else
      "invalid"
      turn
    end
    
  end
  
  def play
    until over?
      turn
    end
    
    if won?
      if winner == "X" 
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    else
        puts "Cats Game!"
    end
   
  end
  
end