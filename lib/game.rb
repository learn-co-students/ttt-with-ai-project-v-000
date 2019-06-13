class Game
  attr_accessor :game, :board, :player_1, :player_2
  
    WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [2,4,6],  # Diagonal 
  [0,4,8],  # Diagonal
]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if board.turn_count.odd?
      player_2
    else 
      player_1
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
      return combo
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
      return combo
      end
    end
      false
  end 
  
  def draw?
    @board.full? && !won? 
  end
  
  def over?
    won? || draw?
  end

  def winner
    combo = won?
  if combo
    @board.cells[combo[0]]
  end
  end 

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
  if  @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
  else 
      turn
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