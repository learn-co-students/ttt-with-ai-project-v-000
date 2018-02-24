require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    self.player_1.game = self if player_1.class == Players::Computer
    @player_2 = player_2
    self.player_2.game = self if player_2.class == Players::Computer
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 :  self.player_2
  end

  def won?
    x = self.board.cells.collect.with_index {|t,i| i if  t == "X"}.delete_if{|el| el == nil}
    o = self.board.cells.collect.with_index {|t,i| i if  t == "O"}.delete_if{|el| el == nil}
    x_win = WIN_COMBINATIONS.detect do |win_arr|
      win_arr.all?{|num| x.include?(num)}
    end
    o_win = WIN_COMBINATIONS.detect do |win_arr|
      win_arr.all?{|num| o.include?(num)}
    end
    x_win || o_win
  end

  def draw?
    self.board.full? && self.won? == nil
  end

  def winner
    won? ? won?.collect{|num| self.board.cells[num]}.uniq.join : nil
  end

  def start

  end

  def play
    until over? do
      turn
    end

    if won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def turn
    input = self.current_player.move
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
    else
      turn
    end
  end

  def over?
    won? || draw?
  end



end
