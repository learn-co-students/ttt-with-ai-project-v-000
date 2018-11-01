require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]] && board.taken?(combo[0] + 1)
        return combo
      end
    end
    return false
  end

  def draw?
    !won? && board.full? ? true : false
  end

  def over?
    won? || draw? || board.full? ? true : false
  end

  def winner
    if !won?
      return nil
    else
      if board.cells[won?[0]].include?(player_1.token)
        return player_1.token
      else
        return player_2.token
      end
    end
  end

  def turn
    puts "Enter a number (1-9):"
    input = gets.strip
  end
end

#LOSE               WIN
#["X", "O", "X"]    ["X", "O", "X"]
#["O", "X", "X"]    ["O", "O", "X"]
#["O", "X", "O"]    ["O", "X", "X"]
