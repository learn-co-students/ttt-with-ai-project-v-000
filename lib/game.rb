 require 'pry'
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
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board 
  end 
  
  def current_player
    if board.turn_count.even?
      @player_1
    else 
      @player_2
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      win1 = combo[0]
      win2 = combo[1]
      win3 = combo[2]
      
      if board.cells[win1] == "X" && board.cells[win2] == "X" && board.cells[win3] == "X"
        combo 
      elsif board.cells[win1] == "O" && board.cells[win2] == "O" && board.cells[win3] == "O"
        combo
      else 
        false 
      end 
    end 
  end
  
  def draw?
    if !won? && board.full?
      true 
    end 
  end 
  
  def over?
    if draw? || won?
      true 
    end 
  end 
  
  def winner
    if won? 
      board.cells[won?.first]
    end 
  end 
  
  def turn 
    input = current_player.move(board)
    if board.valid_move?(input.to_i)
      board.update(input, current_player)
      board.display
    elsif
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