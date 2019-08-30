class Game

  attr_accessor :board, :player_1, :player_2


WIN_COMBINATIONS =
[
 [0, 1, 2], [3, 4, 5], [6, 7, 8],
 [0, 3, 6], [1, 4, 7], [2, 5, 8],
 [0, 4, 8], [2, 4, 6]
    ]

def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"),  board= Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end


def current_player
  board.turn_count % 2 == 0 ? player_1 : player_2
end

def over?
 draw? || won?
end


def won?
  WIN_COMBINATIONS.any? do |win_combo|
  if board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X" || board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
    return win_combo
  else
   false
 end
 end
 end


def draw?
  self.board.full? && !won?
end


def winner
   if win_combo = won?
 self.board.cells[win_combo[0]]
end
end





def turn
  player = current_player
  board.display
  move = player.move(@board)
  if @board.valid_move?(move)
    @board.update(move, player)
  else
   turn
  end
end

def play
  turn until over?
  puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
end



end
