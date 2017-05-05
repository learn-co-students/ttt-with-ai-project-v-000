require "pry"

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    # Horizontal rows
    [0, 1, 2], # Top
    [3, 4, 5], # Middle
    [6, 7, 8], # Bottom

    # Vertical rows
    [0, 3, 6], # Left
    [1, 4, 7], # Middle
    [2, 5, 8], # Right

    # Diagonal
    [0, 4, 8], # Left to right
    [2, 4, 6] # Right to left
  ].freeze

  def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full?
  end

  def won?
    i = 0
    is_won = false
    while i < WIN_COMBINATIONS.size && is_won != true
      hold = WIN_COMBINATIONS[i].collect { |p| board.cells[p] }
      is_won = hold.uniq.size == 1 && !hold.include?(" ")
      i += 1
    end
    is_won
  end

  def draw?
    over? && !won?
  end

  def winner
    hold = nil
    winner_found = false
    if won?
      i = 0
      while i < WIN_COMBINATIONS.size && !winner_found
        hold = WIN_COMBINATIONS[i].collect { |p| board.cells[p] }
        if hold.all? && !hold.include?(" ")
          hold = hold[0]
          winner_found = true
        end
        i += 1
      end
    end
    hold
  end
end
