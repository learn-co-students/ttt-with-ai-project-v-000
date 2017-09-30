require 'pry'
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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    if self.board.cells.include?(" ")
      false
    else
      true
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination| self.board.cells[combination[0]] ==  self.board.cells[combination[1]] && self.board.cells[combination[1]] == self.board.cells[combination[2]] && self.board.cells[combination[1]] != " "
    end
  end

  def draw?
    self.over? == true && self.won? == nil
  end

  def winner
    if self.won?
      self.board.cells[self.won?[1]]
    else
      nil
    end
  end

  def turn
    # binding.pry
    # puts Dir.pwd
    puts "#{self.board.current_player}, make a move."
    input = gets.strip
    self.board.valid_move?("input") && self.board.update(input, self.current_player)
    self.board.current_player
  end
end
