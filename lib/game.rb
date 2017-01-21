class Game
  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[0]] == @board.cells[win_combo[2]] &&
      @board.taken?(win_combo[0] +1)
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won = won?
      @board.cells[won.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)

    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}"
      @board.display
      puts "\n"
      @board.update(current_move, player)
      puts "#{player.token} moved to position #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  def play
    while !over?
      turn
    end

    if self.won?
      puts "Congratulations #{self.winner}!\n"
    elsif self.draw?
      puts "Cat's Game!\n"
    end
  end
end

#player2 = Players::Computer('O').new
#player1 = Players::Human('X').new
#board = Board.new

#game = Game.new(player1, player2, board)
