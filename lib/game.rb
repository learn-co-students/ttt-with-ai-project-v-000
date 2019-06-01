class Game
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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] && @board.cells[win_combo[0]] == @board.cells[win_combo[2]] && @board.taken?(win_combo[0]+1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      @board.cells[win_combo[0]]
    end
  end

  def turn
    player = current_player
    move = player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, player)
      @board.display
      puts ""
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
end
