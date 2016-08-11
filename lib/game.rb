require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row = WIN_COMBINATIONS[0]
    [3, 4, 5], # Middle row = WIN_COMBINATIONS[1]
    [6, 7, 8], # Bottom row = WIN_COMBINATIONS[2]
    [0, 3, 6], # Left column = WIN_COMBINATIONS[3]
    [1, 4, 7], # Middle column = WIN_COMBINATIONS[4]
    [2, 5, 8], # Right column = WIN_COMBINATIONS[5]
    [0, 4, 8], # Left-to-right Diagonal = WIN_COMBINATIONS[6]
    [2, 4, 6] # Right-to-left Diagonal = WIN_COMBINATIONS[7]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    self.board.full? || self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      self.board.taken?((win_combo[0] + 1).to_s) &&
      self.board.cells.values_at(win_combo[0]) == self.board.cells.values_at(win_combo[1]) &&
      self.board.cells.values_at(win_combo[1]) == self.board.cells.values_at(win_combo[2])
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    if self.won?
      WIN_COMBINATIONS.collect do |win_combo|
        self.board.taken?((win_combo[0] + 1).to_s) &&
        self.board.cells.values_at(win_combo[0]) == self.board.cells.values_at(win_combo[1]) &&
        self.board.cells.values_at(win_combo[1]) == self.board.cells.values_at(win_combo[2])
      end
    end
  end

  def turn
  end

  def play
  end





end