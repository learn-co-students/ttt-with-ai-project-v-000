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
  [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even? then
      @player_1
    else
      @player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
  WIN_COMBINATIONS.detect do |win|
      @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] ==  @board.cells[win[2]] && @board.taken?(win[0] + 1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
     if won?
      @board.cells[won?[0]]
    end
  end
  def play
   until over? do
      turn
   end
   if won?
    puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cats Game!"
   end
  end
  def turn
    player = current_player
    move = player.move(board)
    if @board.valid_move?(move) then
      @board.update(move,player)
    else
      puts "Invalid move, try again"
      turn
    end
  end
end
