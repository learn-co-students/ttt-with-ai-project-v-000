
class Game

  attr_accessor :player_1, :player_2, :board, :token

  def initialize(player_1 = Players::Human.new(player_1), player_2 = Players::Human.new(player_2), board = Array.new(9, " "))

    @board = board
    @player_1 = player_1
    @player_2 = player_2
    binding.pry
    # @player_1.token = "X"
    # @player_2.token = "O"
  end

  WIN_COMBINATIONS =
    [[0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]

end
