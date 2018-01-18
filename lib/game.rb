require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=Player::Human.new("X"),player_2=Player::Human.new("O"),board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count.even?
      return player_1
      else
      return player_2
    end
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      bla = combination.select {|x| self.board.cells[x] == "X"}.count
      return true if bla == 3
    end
    WIN_COMBINATIONS.each do |combination|
      bla = combination.select {|x| self.board.cells[x] == "O"}.count
      return true if bla == 3
    end
    return false
  end

  def draw?
    return true if !self.won? && self.board.full?
    return false
  end

  def winner
    WIN_COMBINATIONS.each do |combination|
      bla = combination.select {|x| self.board.cells[x] == "X"}.count
      return "X" if bla == 3
    end
    WIN_COMBINATIONS.each do |combination|
      bla = combination.select {|x| self.board.cells[x] == "O"}.count
      return "O" if bla == 3
    end
    return nil
  end

  def turn
    self.board.display
    puts "your move, #{self.current_player.token}:"
    bla = self.current_player.move(self.board)
    if self.board.valid_move?(bla)
      self.board.update(bla, current_player)
    end
    ##move = gets.chomp
  end

  def play
    self.turn until self.over?
    self.board.display
    puts "Congratulations #{self.winner}!" if self.winner
    puts "Cats Game!" if self.draw?
  end

end