class Game
  attr_accessor :board, :player_1, :player_2

  Game::WIN_COMBINATIONS = [
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
    board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    won? || draw?
  end

  def won?
    Game::WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
      @board.taken?(win_combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

  def turn
    puts "#{self.current_player.token}'s move:"
    player_turn = self.current_player.move(board)
    until self.board.valid_move?(player_turn)
      puts "This move is not valid."
      player_turn = self.current_player.move(board)
    end
    self.board.update(player_turn, current_player)
  end

  def winner
   if winning_combo = won?
     @winner = @board.cells[winning_combo.first]
   end
 end
end
