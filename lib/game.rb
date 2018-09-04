
require_relative "../config/environment.rb"
require 'pry'
class Game
  
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  attr_accessor :board, :player_1, :player_2
  
  def self.win_combos
    WIN_COMBINATIONS
  end
  
  def initialize(p1 = nil, p2 = nil, board = nil)
    p1.nil? ? @player_1 = Players::Human.new("X") : @player_1 = p1
    p2.nil? ? @player_2 = Players::Human.new("O") : @player_2 = p2
    board.nil? ? @board = Board.new : @board = board
  end
  
  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end
  
  def won?
    self.class.win_combos.find { |combo| winner?(combo) }
  end
  
  def draw?
    @board.all_taken? && !won?
  end
  
  def over?
    won? || draw?
  end
  
private

  def winner?(combo)
    @board.all_x?(combo) || @board.all_o?(combo)
  end
  
end

