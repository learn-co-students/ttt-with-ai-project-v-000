class Game
  include Players
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]



  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |winning_combo|
      place_1 = board.cells[winning_combo[0]]
      place_2 = board.cells[winning_combo[1]]
      place_3 = board.cells[winning_combo[2]]

      if place_1 != " " && place_1 == place_2 && place_2 == place_3
        return winning_combo
      end
    end
  end

end
