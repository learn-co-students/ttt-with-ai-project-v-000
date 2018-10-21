require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left row
  [1,4,7], # vertical middle row
  [2,5,8], # right row
  [0,4,8], # top left diag
  [2,4,6]  # top right diag
  ]

  def self.win_combos
    WIN_COMBINATIONS
  end

  def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.find { |combo| winner = combo.map {|cell| board.cells[cell]}.uniq
    # are all 3 cells in the combo identical?
      winner.count == 1 && winner[0] != " "
    }
      # and is their [identical] value not blank?
    #find returns the combo, and if we don't find a combo, #find returns nil, as does our function
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    puts "Please enter move with 1-9"
    input = current_player.move(@board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
      board.display
  end

  def play
    until over?
    turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
