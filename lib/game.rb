require 'pry'
class Game 
  attr_accessor :board, :player_1, :player_2, :token
  
  WIN_COMBINATIONS =    [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [6,4,2],
    [8,4,0],
    [0,3,6],
    [1,4,7],
    [2,5,8]
        ] 
        
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
   @player_1 = player_1
   @player_2 = player_2
   @board = board
  end
  
  
   def current_player
      board.turn_count % 2 == 0 ? player_1 : player_2
      #looks at board
      #turn_count = counts how many spaces in array are occupied
   end
   
    def won?
  
      WIN_COMBINATIONS.detect do |win_combination| 
        # binding.pry
        board.cells[win_combination[0]] == board.cells[win_combination[1]] &&
        board.cells[win_combination[1]] == board.cells[win_combination[2]] &&
        board.taken?(win_combination[0]+1)
      end
    end
  

  def draw?
    if !won? && board.full?
      true 
    else
      false 
    end
  end

  def over?
    if draw?
      true 
    elsif won?
      true 
    else 
      false
    end
  end

 
  def winner
      if won?
        if player_1.token == board.cells[won?[0]] 
             player_1.token 
        elsif player_2.token == board.cells[won?[0]] 
             player_2.token
        end
      end 
  end
  
  def turn 
   var = current_player.move(board)

     if !board.valid_move?(var)
      turn 
      else board.valid_move?(var)
      board.update(var, current_player)
      board.display
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