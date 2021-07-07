

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
[2,4,6]
]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  if board.turn_count.odd?
  player_2
elsif board.turn_count.even?
  player_1
  end
end

def won?
winning_combination = WIN_COMBINATIONS.select do |array|
    win_index_1 = array[0]
    win_index_2 = array[1]
    win_index_3 = array[2]
    if board.cells[win_index_1] == "X" && board.cells[win_index_2] == "X" && board.cells[win_index_3] == "X"
      array
    elsif board.cells[win_index_1] == "O" && board.cells[win_index_2] == "O" && board.cells[win_index_3] == "O"
      array
    else
      false
    end
  end
  winning_combination[0]
end

def draw?
  if board.cells.none?{|position| position == " "} && !won?
true
  else
  false
  end
end

def over?
  if draw? || won?
    true
  else
    false
  end
end

def winner
  if won?
  board.cells[won?[0]]
  else
  end
end

def turn
  puts "Enter 1-9:"
  input = current_player.move(board)
  if board.valid_move?(input)
    board.update(input, current_player)
    board.display
  else
    turn
  end
end

def play
  while !over?
  turn
end
    if won?
  puts "Congratulations #{winner}!"
    elsif draw?
  puts "Cat's Game!"
    end
end



end
