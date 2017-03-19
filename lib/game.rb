class Game

  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left Column
    [1,4,7],  # Middle Column
    [2,5,8],  # Right Column
    [0,4,8],  # Diagnoal L to R
    [2,4,6]  # Diagnoal R to L
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
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
      @board.cells[combo[0]] ==  @board.cells[combo[1]] &&
      @board.cells[combo[1]] ==  @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if combo = won?
      @board.cells[combo.first]
    end
  end

  def turn
    player = current_player
    board = @board
    current_move = player.move(board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
    end
  end

  def play
    while !over?
       turn
    end

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end

end
