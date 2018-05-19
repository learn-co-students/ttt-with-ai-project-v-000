require "pry"

class Game

attr_accessor :board, :player_1, :player_2

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def current_player
  if board.turn_count % 2 == 0
    player_1
  else
    player_2
end
end

def won?
  WIN_COMBINATIONS.find do |combo|
    board.cells[combo[0]] == board.cells[combo[1]] &&
    board.cells[combo[1]] == board.cells[combo[2]] &&
    board.taken?(combo[0] + 1)
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
  if won? || draw?
    true
else
  false
end
end

def winner
  WIN_COMBINATIONS.each do |combo|
    if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
    return "X"
  elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
    return "O"
  end
  end
  return nil
end

def turn
  puts "Please enter 1-9:"
  input = current_player.move(@board)
  new_input = input.to_i
  if board.valid_move?(new_input)
    board.update(new_input, current_player)
    current_player
  else
    turn
  end
  board.display
end

def play
 until over?
   turn
 end
 if winner
   puts "Congratulations #{winner}!"
 else draw?
   puts "Cat's Game!"
 end
end


end
