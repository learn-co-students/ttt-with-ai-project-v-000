class Game

attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


def current_player
  @board.turn_count % 2 == 0 ? player_1 : player_2
end

def won?
 WIN_COMBINATIONS.detect do |win|
   @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] &&
   (@board.cells[win[0]] == "X" || @board.cells[win[0]] == "O")
 end
end

def over?
  @board.full?
end

def draw?
  @board.full? && !won?
end

def winner
  if win_combo = won?
   @board.cells[win_combo[0]]
  end
end


def turn
  player = current_player
  current = player.move(@board)
  @board.valid_move?(current) ? @board.update(current, player) : turn
end

def play
while !won? && !draw? && !over?
  turn
end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end



end
