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
   [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[0]] == @board.cells[winner[2]] &&
      @board.cells[winner[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    desiredMove = player.move(@board)
    if !@board.valid_move?(desiredMove)
      turn
    else
      @board.update(desiredMove, player)
    end
    @board.display
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
