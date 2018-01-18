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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if combo = won?
      @winner = @board.cells[combo[0]]
    end
  end

  def turn
    puts "\n"
    board.display
    puts "\n"
    player = current_player
    current_move = player.move(board)
    if !board.valid_move?(current_move)
      puts "\n"
      puts "INVALID MOVE"
      puts "\n"
      turn
    else
      board.update(current_move, player)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "\n"
      board.display
      puts "\n"
      puts "Congratulations #{self.winner}!"
      puts "\n"
    elsif draw?
      puts "\n"
      board.display
      puts "\n"
      puts "Cat's Game!"
      puts "\n"
    end
  end

end
