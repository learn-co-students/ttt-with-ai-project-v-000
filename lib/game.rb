class Game
  attr_accessor :board, :player_1, :player_2, :input

  # @board = []

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
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def board
  @board
end

def current_player
  @board.turn_count % 2 == 0 ? player_1 : player_2
end

def won?
    WIN_COMBINATIONS.detect do |winner|
   @board.cells[winner[0]] == "X" && @board.cells[winner[1]] == "X" && @board.cells[winner[2]] == "X" ||
   @board.cells[winner[0]] == "O" && @board.cells[winner[1]] == "O" && @board.cells[winner[2]] == "O"
  end
end


def draw?
  @board.full? && !won?
end

def over?
  won? || draw?
end

def winner
  if  won?
  winner = @board.cells[won?[0]]
  end
end

def turn
player = current_player
current_move = player.move(board)
  if board.valid_move?(current_move)
    board.update(current_move, player)
  else
     player.move(board)
  end
end

def play
  until  over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
  end

end
