class Game
  attr_accessor :board, :player_1, :player_2
WIN_COMBINATIONS =  
[
  [0,1,2],
  [3,4,5],  
[6,7,8], 
[2,4,6],
[0,3,6],
[1,4,7],
[2,5,8],
[0,8,4]]
def initialize(player_1= Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
  @board= board
  @player_1=player_1
  @player_2=player_2
end 
def current_player
  if board.turn_count.even?
    return player_1
  else return player_2
end
end
def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end
  def draw?
    board.full? && !won?
  end
  def over?
    won? || draw?
  end
  def winner
    board.cells[won?[0]] if won?
  end
  

def turn
input=current_player.move(board).to_i
if board.valid_move?(input)

board.update(input, current_player)
board.display
else turn
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


  