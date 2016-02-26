class Game
  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]]
  def initialize(player_1=nil, player_2=nil, board=nil)
    @board = board || Board.new()
    @player_1 = player_1 || Player.new("X")
    @player_2 = player_1 || Player.new("X")
  end

  def current_player
    return @board.collect{|spot| (spot=="X") || (spot=="O")}.length%2 == 0 ? "X" : "O"
  end

  def over?
    if self.won?
      return true
    elsif self.draw?
      return true
    else
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |triplet|
      result = triplet.all?{|s| @board[s]=="X"} || tripllet.all?{|s| @board[s]=="O"}
      if result
        return true
      end
    end
    return false
  end

  def draw?
  end

  def winner
  end

  def turn
  end

  def play
  end

end
