require 'pry'

class Game

attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]


def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  if @board.turn_count % 2 == 0
    player_1
  else
    player_2
  end
end

def won?
  #binding.pry
  WIN_COMBINATIONS.detect do |win|
  @board.cells[win[0]] == @board.cells[win[1]] &&
  @board.cells[win[1]] == @board.cells[win[2]] &&
  @board.taken?(win[0]+1)
end
end

def draw?
  @board.full? && !won?
end

def over?
  won? || draw?
end

def winner
  if win_combo = won?
    @winner = @board.cells[win_combo.first]
  end
end

def turn
  #binding.pry
  @board
  player = current_player
  move = player.move(@board)
  if !@board.valid_move?(move)
    turn
  else
    @board.update(move, player)

  #Game turn makes valid moves
#Game turn asks for input again after a failed validation
#Game turn changes to player 2 after the first turn
end
end

def play
    while !over?
      turn
  end
    if won?
      puts "Congratulations #{winner}!"
  else draw?
     puts "Cat's Game!"
   end
  end

end
