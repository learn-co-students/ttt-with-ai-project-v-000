class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],

    [0,3,6], #verticals
    [1,4,7],
    [2,5,8],

    [0,4,8], #diagonals
    [6,4,2]
    ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0] + 1) #@board.taken?(combo[0] + 1) to make sure it == "X" or "O" and not empty spaces, +1 for offsetting to user input
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    !won? || draw? ? nil : @board.cells[won?.first]
  end

  def turn
    player = current_player
    current_move = player.move(@board)

    if !@board.valid_move?(current_move)
      turn #recurse
    else
      puts "#{player.token} moved #{current_move}"
      @board.update(current_move, player)
      @board.display
      puts "\n"
    end
  end

  def play
    @board.display
    puts "\n"
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end