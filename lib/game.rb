class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
 end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.cells[combo[0]] != " "
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
      @board.cells[winning_combo.first]
    end
  end

  def turn
    @board.display
    puts "It is now #{current_player.token}'s turn."
    current_move = current_player.move(board)

    if @board.valid_move?(current_move)
      puts "#{current_player.token} moves to #{current_move}."
      @board.update(current_move, current_player)
    else
      puts "Invalid move. Please enter a valid board position."
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      @board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      @board.display
      puts "Cats Game!"
    end
  end

end
