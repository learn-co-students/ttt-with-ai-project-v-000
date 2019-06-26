class Game
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
    
  def current_player
    if @board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end
    
  def won?
    WIN_COMBINATIONS.each do |win|
      if (@board.cells[win[0]] == "X" && @board.cells[win[1]] == "X" && @board.cells[win[2]] == "X") || (@board.cells[win[0]] == "O" && @board.cells[win[1]] =="O" && @board.cells[win[2]] == "O")
        return win
      end
    end
    false 
  end
  
  def draw?
    if !won? && @board.full?
      true
    end
  end
  
  def over?
    if won? || draw? || @board.full?
      true
    end
  end
  
  def winner
    if won?
      win_combo = won?
      return @board.cells[win_combo[0]]
    end
  end
  
  def turn
    player = current_player
    pos = player.move(@board)
    if @board.valid_move?(pos)
      @board.update(pos, player)
      @board.display
    else
      turn
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