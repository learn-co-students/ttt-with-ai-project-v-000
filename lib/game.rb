class Game
  # class constant
  WIN_COMBINATIONS = [
    [0,1,2],  # top row
    [3,4,5],  # middle row
    [6,7,8],  # bottom row
    [0,3,6],  # left column
    [1,4,7],  # middle column
    [2,5,8],  # bottom column
    [0,4,8],  # left diagonal \
    [2,4,6]   # right diagonal /
  ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    count = 0
    @board.cells.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    if count.odd?
      @player_2
    else
      @player_1
    end
  end

  def draw?
    if @board.full? && !won?
      true
    else
      false
    end
  end

  def over?

  end

  def play

  end

  def turn

  end

  def winner

  end

  def won?
    result = WIN_COMBINATIONS.detect do |combo|
      pos_1 = combo[0]
      pos_2 = combo[1]
      pos_3 = combo[2]
      board = @board.cells

      if board[pos_1] == "X" && board[pos_2] == "X" && board[pos_3] == "X"
        true
      elsif board[pos_1] == "O" && board[pos_2] == "O" && board[pos_3] == "O"
        true
      else
        false
      end
    end

    if result == nil
      nil
    else
      result
    end
  end
end
