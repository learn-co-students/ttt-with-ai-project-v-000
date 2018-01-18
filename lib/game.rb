class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  top_row_win = [0, 1, 2],
  middle_row_win = [3, 4, 5],
  bottoom_row_win = [6, 7, 8],
  first_vertical_win = [0, 3, 6],
  second_vertical_win = [1, 4, 7],
  third_vertical_win = [2, 5, 8],
  top_right_win = [0, 4, 8],
  top_left_win = [2, 4, 6 ]
  ]

  def self.WIN_COMBINATIONS
    WIN_COMBINATIONS
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect { |combo|
      (@board.cells[combo[0]] == @board.cells[combo[1]] &&
       @board.cells[combo[1]] == @board.cells[combo[2]] &&
       @board.taken?(combo[0] + 1)) }
  end




  def draw?
    !won? && @board.full?
  end

  def winner
    if winning_combo = won?
      board.cells[winning_combo.first]
    end
  end

  def turn
    position = current_player.move(board)
    if @board.valid_move?(position)
      @board.update(position, current_player)
      @board.display
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
      puts "Cats Game!"
    end
  end



end
