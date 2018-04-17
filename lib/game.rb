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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def over?
    won? || draw?
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      (@board.cells[combo[2]] == "X" || @board.cells[combo[2]] == "O")
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won? != nil
    @winner = @board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    moving = player.move(@board)
    if !@board.valid_move?(moving)
      turn
    else
      @board.display
      @board.update(moving, player)
      @board.display
    end
  end

  def play
   until over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end
end
