require "pry"
require_relative "../config/environment.rb"

class Game

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # First Column
    [1,4,7], # Second Column
    [2,5,8], # Third Column
    [0,4,8], # First Diagonal
    [6,4,2] #Second Diagonal
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def turn_count
    count = 0
    @board.cells.each {|position| count += 1 if position == "X" || position == "O"}
    count
  end

  def current_player
    counter = turn_count
    counter % 2 == 0 ? player_1 : player_2
  end

  def full?
    @board.cells.all? {|check| check != " "}
  end

  def won?
    if @board.cells.all? {|e| e==" " || e == ""}
      false
    else
      WIN_COMBINATIONS.detect do |win_combo|
        win_combo.all? {|e| (@board.cells[e] == "X")} || win_combo.all? {|e| (@board.cells[e] == "O")}
      end
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won? || full?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    puts "Please enter 1 - 9"
    location = gets.strip
    if @board.valid_move?(location)
      @board.update(location, current_player)
    else
      turn
    end
    @board.display
  end

end
