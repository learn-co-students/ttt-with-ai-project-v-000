require 'require_all'
class Game

WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
  ]

attr_accessor :board, :player_1, :player_2
attr_reader :WIN_COMBINATIONS

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  self.board = board
end

def position_taken?(index)
  self.board.cells[index] != " "
end

def valid_move?(index)
  !position_taken?(index) && index.between?(1,9)
end

def turn_count
 self.board.cells.count{|square| square != " " }
end

def current_player
 turn_count.even? ? self.player_1 : self.player_2
end

def turn
 player = current_player
 input = player.move(self.board).to_i
  if valid_move?(input)
    self.board.update(input, player)
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.any? do |combo|
    if position_taken?(combo[0]) && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
      return combo
    end
  end
end

def full?
  self.board.cells.all?{|spot| spot != " " }
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if combo = won?
    self.board.cells[combo[0]]
  end
end

def play
  turn until over?
  puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
end

end
