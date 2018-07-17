class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
      #X gets odd moves
      #O gets even moves

      self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[1]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[0]] != " "
    end
  end

  def draw?

  end

  def winner
  end

  def start
  end

  def play
  end

  def turn
  end


end
