require 'pry'
# require_relative "../lib/players/human.rb"
class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new())
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    # binding.pry
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  # def won?
  #   WIN_COMBINATIONS[[5]]
  #   binding.pry
  #
  # end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          win_combination
        end
    end
      false
  end

end
# Or convert it to a string and add the base: $> "0023".to_i(10) # 23 $> "0023.to_i(8) # 8
