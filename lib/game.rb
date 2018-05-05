class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
attr_accessor :board, :player_1, :player_2

def initialize(player_1 = Players::Human.new("X"), player_2= Players::Human.new("O"), board= Board.new)
@player_1 = player_1
@player_2 = player_2
@board = board
end


def current_player
  if @board.turn_count.even?
    @player_1
  else
    @player_2
  end
end

def won?
WIN_COMBINATIONS.detect do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = @board.cells[win_index_1]
  position_2 = @board.cells[win_index_2]
  position_3 = @board.cells[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    win_combination

  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    win_combination
  else
    false
    end
  end
end

def draw?
self.board.full? && !won?
end

def over?
  draw? || won?
end

def winner
if win_combo = self.won?
  @board.cells[win_combo[0]]
  end

end

def turn
  @board.display
  player = current_player
  input = player.move(@board)
  if @board.valid_move?(input) == false
    puts "Move is invalid. Please select another move"
    turn
  else
    board.update(input, player)
  end
end

def play
  if !over?
  turn
  play
elsif over? && draw?
  @board.display 
  puts "Cat's Game!"
else
  @board.display
  puts "Congratulations #{winner}!"
end

end




end
