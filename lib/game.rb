require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :cells
  include Players  
  
  @board = []
  
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
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
   @player_1 = player_1
   @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2 
  end 
  
  def over?
    @board.full? or won? or draw?
  end 
  
  def won?
    WIN_COMBINATIONS.find do |wc|
    if @board.cells[wc[0]] == "X" && 
       @board.cells[wc[1]] == "X" && 
       @board.cells[wc[2]] == "X"
      wc
    elsif @board.cells[wc[0]] == "O" && 
          @board.cells[wc[1]] == "O" && 
          @board.cells[wc[2]] == "O"
      wc
    else 
      false 
    end
    end
  end 
  
  def draw?
    !won? and @board.full?
  end
  
  def winner
    @board.cells[won?[0]] if won?
  end 
  
  def turn
    move = current_player.move(@board)
    if @board.valid_move?(move)
      move
    else
      current_player.move(@board) 
    end 
    @board.update(move, current_player)
    @board.display

  end 
  
  def play
    @board.display
    turn until over?
    puts "Congratulations #{winner}!" if won? 
    puts "Cat's Game!" if draw? 
    
  end 
  
  def start
    puts "Welcome to TTT"
    puts "Select number of players:" 
    input = gets.strip
  end 
  
end