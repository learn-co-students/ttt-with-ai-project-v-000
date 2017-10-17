require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :current_player
  def self.win_combo
    WIN_COMBINATIONS
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new )
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end
  def current_player
    (self.board.turn_count % 2 == 0) ? self.player_1 : self.player_2
  end
  def over?
    self.won? || self.draw?
    
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
     self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
     self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
     self.board.cells[combo[0]] != " "
    end    
  end

  def draw?
    self.board.full? && !won?
  end
  def winner
    self.won? ? self.board.cells[self.won?[1]] : nil
  end

  def turn #executes a turn and then changes the player.
  
    
     player_move = self.current_player.move(self.board) 
     if board.valid_move?(player_move)
      # binding.pry
      self.board.update(player_move, current_player) 
     else
      turn   
     end 
        
  end

  def play 
    until self.over?
      self.turn 
      board.display  
      puts "   " 
      puts "   "
    end
    
    if won?
       puts "Congratulations #{self.winner}!" 
    elsif draw?
      puts "Cat's Game!"
    end
  end

end