require "pry"
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
  
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def turn_count
  counter = 0
  board.cells.each do |cells_var|
    if cells_var == "X" || cells_var == "O"
    counter += 1
  end
  end
  counter
end
  
  def current_player
  if turn_count % 2 == 0 
    return @player_1
  else 
    return @player_2
  end
end

# def won?
#   WIN_COMBINATIONS.detect do |win|
#   (board.cells[win[0]] == board.cells[win[1]] && board.cells[win[2]] == board.cells[win[0]] && board.cells[win[2]] == board.cells[win[1]]) && board.taken?(win[0]) 
#   end
# end

  def won?
    WIN_COMBINATIONS.each {|win_combo|
      position_1 = @board.cells[win_combo[0]]
      position_2 = @board.cells[win_combo[1]]
      position_3 = @board.cells[win_combo[2]]
       return win_combo if ((position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O"))
    }
    return false
  end



 def draw?
    !won? && @board.full? 
  end

def over?
    draw? || won?
end
  
# def winner
#   won = won?
#   if won == nil 
#     return nil
#   end
  
#   position = won[0]
#   #binding.pry
#     if board.cells[position] == "X"
#       return "X"
#     elsif board.cells[position] == "O"
#       return "O"
#   end 
# end

  def winner
    index = won?
    if index && @board.cells[index[0]] == "X"
      return "X"
    elsif index && @board.cells[index[0]] == "O"
      return "O"
    else
      return nil
    end
  end


def turn
    puts "Player #{current_player.token}'s turn!"
    puts "Where would you like to move? (1-9): "
    board.display

    user_input = current_player.move(board)

    if board.valid_move?(user_input)
      board.update(user_input, current_player)
    else
      puts "That number is invalid."
      turn
    end
  end
   
  def play
    until over? 
      turn
    end
      if draw?
        puts "Cat's Game!"
    elsif won?
        puts "Congratulations #{winner}!"
    end
  end

end