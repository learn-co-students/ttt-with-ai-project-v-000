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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    @board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      pos_1 = combo[0]
      pos_2 = combo[1]
      pos_3 = comno[3]
      return true if @board.cells[pos_1] == @board.cells[pos_2] && @board.cells[pos_1] == @board.cells[pos_3]
    end
    false
  end
end
