class Game
  attr_accessor :board, :player_1, :player_2
   WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
   ]
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
   end
   def current_player
    board.turn_count.even? ? player_1 : player_2
   end
   def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && (@board.cells[combo[1]] == "X" || @board.cells[combo[1]] == "O")
    end
   end
   def draw?
    true if !won? && board.full?
   end
   def over?
    true if won? || draw? || board.full?
   end
   
   def winner
      return board.cells[won?[0]]
   end
  
   
   def turn
    board.display
    move = current_player.move(self)
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      turn
    end
  end
  def play
    turn 
     if won?
      board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      board.display
      puts "Cat's Game!"
    else 
      turn 
    end
  end
end