require 'pry'

class Game

attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


def current_player
  self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
end

def won?
  winning_combo = nil
  WIN_COMBINATIONS.each do |combo|
    this_combo = []
    combo.each do |space|
      this_combo << board.cells[space]
    if this_combo == ["X","X","X"] || this_combo == ["O","O","O"]
      winning_combo = combo
    end
  end
end
  winning_combo
end

def over?
  self.draw? || self.won?
end

def draw?
  @board.full? && self.won? == nil ? true : false
end

def winner
  self.won? ? @board.cells[won?[0]] : nil
end

def turn
player = self.current_player
input = player.send :gets
until @board.valid_move?(input)
  input = player.send :gets
end
  @board.update(input, player)
end


def play
  #while self.won? == false || @board.full? == false
until self.over?
    self.turn
  end

  if self.won?
    puts "Congratulations #{self.winner}!"
  else
    puts "Cat's Game!"
  end
end


end
