require 'pry'
class Game
  include Players
  attr_accessor :board, :player_1, :player_2
  ::WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count.odd?
      self.player_2
    else
      self.player_1
    end
  end

  def won?
      winning_combination = ::WIN_COMBINATIONS.find do |combination|
                              self.board.position(combination[0]+1) == self.board.position(combination[1]+1) and
                              self.board.position(combination[0]+1) == self.board.position(combination[2]+1) and
                              self.board.position(combination[0]+1) != " "
                             end

      winning_combination if winning_combination != nil
  end

  def draw?
    true if self.board.full? == true and self.won? == nil
  end

  def over?
    true if self.draw? == true or self.won? != nil
  end

  def winner
    self.board.cells[self.won?[0]] if self.won? != nil
  end

  def turn
    pos_num = self.current_player.move(self.board)
    until self.board.valid_move?(pos_num) == true
      pos_num = self.current_player.move(self.board)
    end
    self.board.update(pos_num, self.current_player)
  end

  def play
    if self.over? == false
      self.turn
    end
    until self.over? == true
      self.turn
    end

    puts "Congratulations #{self.winner}!" if self.won? != nil
    puts "Cat's Game!" if self.draw? == true
  end

end
