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

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"}
        combo
      end
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      @board.cells[combo.first]
    end
  end

  def turn
    puts "#{current_player}'s turn"
    input = current_player.move(board)
    if !@board.valid_move?(input)
      turn
    else
      @board.update(input,current_player)
      @board.display
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
