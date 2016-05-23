class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left col
  [1,4,7], # Middle col
  [2,5,8], # Right col
  [0,4,8], # Left diag
  [6,4,2] # Right diag
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw? || full?
  end

  def full?
    @board.full?
  end

  def draw?
    !won? && full?
  end

  def won?
    WIN_COMBINATIONS.detect do |winners|
      winners.all? {|numbers| board.cells[numbers] == "X"} || winners.all? {|numbers| board.cells[numbers] == "O"}
    end
  end

  def winner
    winning_combo = won?
    if winning_combo
      @winner = board.cell_value(winning_combo[0])
    end
  end

  def turn
    player = self.current_player
    move = player.move(board)
    if !board.valid_move?(move)
      move = player.move(board)
    end
    board.update(move,player)
  end

  def play
    while !over?
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end
