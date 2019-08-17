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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def won?
      WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0]+1)
    end
  end

  def draw?
    if @board.full? && !won?
      true
    end
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board.cells[won?.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
      @board.display
      puts "\n\n"
    end
  end

  def play
    while !over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    end
    if won?
      puts "Congratulations #{winner}!"
    end
  end
end
