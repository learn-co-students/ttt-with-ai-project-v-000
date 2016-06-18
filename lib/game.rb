
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    #horizontal wins
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #vertial wins
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #diagonal wins
    [2,4,6],
    [0,4,8]
  ]

  def initialize(player_1 = Human.new(token = "X"), player_2 = Human.new(token = "O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    if board.full? || won?
      true
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      self.board[win[0]] == self.board[win[1]] && self.board[win[1]] == self.board[win[2]] && self.board.taken?(win[0]) ? true : false
    end
  end
end
