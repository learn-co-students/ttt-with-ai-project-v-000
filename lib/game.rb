class Game
  attr_accessor :board, :player_1, :player_2



WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  board.turn_count.even? ? player_1 : player_2
end

def won?
  WIN_COMBINATIONS.find do |win_combos|
    board.cells[win_combos[0]] == board.cells[win_combos[1]] && board.cells[win_combos[1]] == board.cells[win_combos[2]] && board.taken?(win_combos[0] + 1) ? true : false
  end
end

def draw?
  board.full? && !won?
end


def over?
  draw? || won?
end

def winner
    win_combos = won?
    win_combos ? board.cells[win_combos[0]] : nil
end

def turn
  puts "Please enter a number between 1-9"
  input = current_player.move(board)
  if board.valid_move?(input)
    board.update(input, current_player)
    board.display
  else
turn
  end
end

def play
 turn until over?
  if won?
    puts "Congratulations #{winner}!" 
  elsif 
    draw?
    puts "Cat\'s Game!"
  end
  end
end