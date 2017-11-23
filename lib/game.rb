class Game
  attr_accessor :board
  attr_accessor :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  CORNERS = [0,2,6,8]
  CENTER = 4

  def initialize(player1=nil, player2=nil, board=nil)
    @player_1 = (player1 ||= Players::Human.new)
    @player_2 = (player2 ||= Players::Human.new)
    @board = board
  end

end
