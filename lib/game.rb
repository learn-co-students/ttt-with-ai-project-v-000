class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,4,8], # Top-Left, Middle, Bottom-right
  [2,4,6], # Top-Right, Middle, Bottom-left
  [0,3,6], # Left Row
  [1,4,7], # Middle Row
  [2,5,8] # Right Row
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |wins|
      @board.cells[wins[0]] == @board.cells[wins[1]] && @board.cells[wins[1]] == @board.cells[wins[2]] && @board.taken?(wins[0]+1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    @board.cells[self.won?.first] if won?
  end

  def turn
    player = current_player
    current_move = player.move(@board)

    if @board.valid_move?(current_move)
      @board.update(current_move, player)
      @board.display
    else
      turn
    end
  end

  def play
    while !over? do
      turn
    end

    if over?
      puts "Congratulations #{winner}!" if won?
      puts "Cats Game!" if draw?
    end

  end

end
