class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [3, 4, 5],
    [6, 7, 8],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      @board.cells[array[0]] == @board.cells[array[1]] &&
      @board.cells[array[1]] == @board.cells[array[2]] &&
      @board.taken?(array[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if current_player_combinations = won?
      @winner = @board.cells[current_player_combinations.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.display
      puts "Your turn #{player}!"
      @board.update(current_move, player)
      @board.display
    end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
    end

  end

end
