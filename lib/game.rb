require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :token

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
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    
  end
  

 def valid_move?(position)
    position = position.to_i - 1 
  
  if   !position.between?(0, 8)  
   false
  elsif @board[position] == " "
    true
 
  
  end 
end
  
  
  

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  
  
  def turn
   input = current_player.move(board).to_i
  
   if @board.valid_move?(input) 
       @board.update(input, current_player)
        @board.display
   
     else
      self.turn
     
   end 
  end

  
  def full?
  @board.cells.all? {|cell| cell == "X" || cell == "O"}
  end
   
  
  def draw?
   full? && !won?
    
  end

 def over?
  won? || draw?
    
   
  end
   
   def won?
     WIN_COMBINATIONS.detect do |win_combination|
  
       win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
  
        position_1 = self.board.cells[win_index_1]
        position_2 = self.board.cells[win_index_2]
        position_3 = self.board.cells[win_index_3]
  
        position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 =="O"
      end
    end
  def winner
    
  if won?
  WIN_COMBINATIONS.detect do |win_combination|

if @board.cells[win_combination[0]] == "X" && @board.cells[win_combination[1]] == "X" && @board.cells[win_combination[2]] == "X"
  return "X"
 elsif
  @board.cells[win_combination[0]] == "O" && @board.cells[win_combination[1]] == "O" && @board.cells[win_combination[2]] == "O"
  return "O"
    
    else
      nil
    
    end
  end
  end
  end
 
   
   def play
  
   until over?
   turn
   end

  if winner == "X"
    puts "Congratulations X!"
 elsif winner == "O"
    puts "Congratulations O!"
  else 
    puts "Cats Game!"
   end
  end
 
 
  
   
 
end