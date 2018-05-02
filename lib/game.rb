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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
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
      @winner = @board.cells[combo.first]
    end
  end
  
  def turn
    token = current_player
    move = token.move(@board)
    if @board.valid_move?(move)
      @board.update(move, token)
    else
      turn
    end
    @board.display
  end
  
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  
end