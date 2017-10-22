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
    [6,4,2]
  ]

  def initialize(player_1 = nil, player_2=nil, board=nil)
    #binding.pry
    self.player_1 = (!player_1) ? Human.new("X") : player_1
    #if(!player_1)
    #self.player_1 = Human.new("X")
    #else
    #  self.player_1 = player_1
    #end
    if(!player_2)
      self.player_2 = Human.new("O")
    else
      self.player_2 = player_2
    end
    if (!board)
      self.board = Board.new
    else
      self.board = board
    end
  end


end
