class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS  = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
     if @board.cells.select {|space| space != nil}.size.even?
       player_2
     else
       player_1
     end
  end

  def over?
    true unless board.cells.detect {|space| space == " "}
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      position_1  = board.cells[combination[0]]
      position_2  = board.cells[combination[1]]
      position_3  = board.cells[combination[2]]

      position_1 == position_2 && position_2 == position_3 && position_1 != " " && position_2 != " " && position_3 != " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    x_num = board.cells.select{|space| space == "X"}.size
    o_num = board.cells.select{|space| space == "O"}.size
    if won? && x_num > o_num
      "X"
    elsif won? && o_num > x_num
      "O"
    else
      nil
    end
  end

  def turn
    input = current_player.move(board)
  end
end
