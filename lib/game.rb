class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [[0,1,2] , [3,4,5] , [6,7,8] , [0,3,6] , [1,4,7] , [2,5,8] , [0,4,8] , [6,4,2]]

def initialize(player_1 = Players::Human.new("X") , player_2 =Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  if (board.cells.count("X") + board.cells.count("O")).even?
    player_1
  else
    player_2
  end
end

def won?
  WIN_COMBINATIONS.detect do |win|
  # @cells = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
  board.cells[win[0]] == board.cells[win[1]] && board.cells[win[1]] == board.cells[win[2]] && board.taken?(win[0] + 1)
end
end

def draw?
if board.full? && !won?
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
  combo = won?
  if !combo
    nil
  else
    board.cells[combo[0]]
  end
end


def turn
  binding.pry
  desired_move = current_player.move(board)
  if board.valid_move?(desired_move)
    board.update(desired_move,current_player)
    board.display
  else
    turn
  end
end

def play
  until over?
    turn
  end
  puts "Congratulations #{winner}!"
  if draw?
    puts "Cat's Game!"
  else
  end
end


end
