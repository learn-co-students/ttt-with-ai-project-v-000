require "pry"

class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[2,5,8], [1,4,7],[0,4,8],[6,4,2]]

  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    if self.board.turn_count.even? == true 
      @player_1
    else 
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.any? do |array|
      cell_one = self.board.cells[array[0]]
      cell_two = self.board.cells[array[1]]
      cell_three = self.board.cells[array[2]]
      if cell_one == "X" && cell_two == "X" && cell_three == "X"
       return array
      elsif cell_one == "O" && cell_two == "O" && cell_three == "O"
       return array
     else 
       false
     end
    end
  end

def draw?
  if self.won? != false
    false 
  elsif self.board.full? == false 
    return false 
  else 
    true 
  end
end
  
  def over?
    if self.draw? == true || self.won? != false 
      true 
    else 
      false
  end
end

def winner
  WIN_COMBINATIONS.detect do |array|
    winner = self.board.cells[array[0]]
    if won? == array && winner == "X" 
      return "X"
    elsif  won? == array && winner == "O" 
      return "O"
    elsif won? == false 
      return nil
    end
end
end

def turn 
  input = self.current_player.move(board)
  if self.board.valid_move?(input) 
     self.board.update(input, current_player)
  elsif !self.board.valid_move?(input)
    self.current_player.move(board)
  end
end

def play 
  until self.over?
  self.turn 
  end
  if self.winner
  puts "Congratulations #{winner}!"
  elsif self.draw?
  puts "Cat's Game!"
end
end


end
