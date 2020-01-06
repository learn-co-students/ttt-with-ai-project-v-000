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

  def current_player
    if @board.turn_count % 2 == 0
         player_1
       else
         player_2
       end
  end

  def over?
      won? || @board.full? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
       if @board.cells[combo[0]] == "X"  &&  @board.cells[combo[1]] == "X" &&  @board.cells[combo[2]] == "X"
         return combo
       elsif @board.cells[combo[0]] == "O"  && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
         return combo
       end
     end
     false
  end

  def draw?
     !won? && @board.full?
  end

  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end

  def turn
    user_input = current_player.move(@board)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
    else 
      turn
    end
  end

  def play
    turn until over?
       if won?
         puts "Congratulations #{winner}!"
       elsif draw?
         puts "Cat's Game!"
       end
  end
end
