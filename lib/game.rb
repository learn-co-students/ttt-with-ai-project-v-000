class Game


  def over?
    won? || draw? || board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? {|cell| board[cell] == "player_1.token"} || combo.all? {|cell| board[cell] == "player_2.token"}
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    player_1.token == won?[0] ? player_1 : player_2 if won?
  end

  def turn
    puts "Please enter 1-9:"
    index = current_player.move
    if board.valid_move?(index)
      board.update(index, current_player)
      board.display
    else
      turn
    end
  end

end
