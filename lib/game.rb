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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  # this method is a predicate!! why the fuck doesn't it return a fucking boolean?!! >.<
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      position1 = @board.cells[win_combo[0]]
      position2 = @board.cells[win_combo[1]]
      position3 = @board.cells[win_combo[2]]

      if position1 != " " && position1 == position2 && position2 == position3
        return win_combo
      end
    end
  end

  def full?
    !@board.cells.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if win_combo = won?
      board.cells[win_combo[0]]
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move? input
      board.turn_count
      board.update(input, current_player)
    else
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end #class Game
