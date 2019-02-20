require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  
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
  
   
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    # condition ? reutrn value if true : return value if false
     @board.turn_count.even? ? @player_1 : @player_2 
     #modulo 
  end
  
  def over?
     won? || draw?
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_indices|
      # win_indices = [6,7,8] 
      @board.taken?(win_indices[0]+1) && 
      @board.cells[win_indices[0]] == @board.cells[win_indices[1]] &&
      @board.cells[win_indices[0]] == @board.cells[win_indices[2]]
    end
  end
  
  def turn 
    @board.display
    puts "Choose a place to go"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn 
    end
  end 
  
  def play 
    while !over? 
      turn
    end
    if !draw?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
  def draw?
    # not a win && all cells are filled 
    !won? && @board.full?
  end
  
  def winner
    if won? 
      @board.cells[won?[0]]
    end
  end 
  
  
end