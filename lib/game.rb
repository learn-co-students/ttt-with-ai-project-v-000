require 'pry'
class Game
  WIN_COMBINATIONS  = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    winner = nil
    # step through win combinations
    WIN_COMBINATIONS.each_with_index do |x, i|

      if board.cells[x[0]] == "X" && board.cells[x[1]] == "X" && board.cells[x[2]] == "X"
        winner = x.join(",")
      elsif board.cells[x[0]] == "O" && board.cells[x[1]] == "O" && board.cells[x[2]] == "O"
        winner = x.join(",")
      else
        if i == WIN_COMBINATIONS.size
          winner = false
        end
      end
    end
    winner
  end

end
