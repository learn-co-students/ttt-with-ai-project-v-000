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

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end


  def play
    @board.display
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def over?
    won? || draw? 
  end

  def draw?
    @board.full? && !won?
  end

  def turn
    current_move = current_player.move(board)
    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
      @board.display
    elsif
      turn
    end
  end

  def winner
    if winning_combo = won?
    @board.cells[winning_combo.first]
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == "X"  && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X" || @board.cells[win_combo[0]] == "O"  && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O"
    end
  end


end
