class Game
  
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
  
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 
  
  def current_player
    if board.turn_count.even?  #technically turncount + 1 bc its next move 
      player_1
    else board.turn_count.odd?
      player_2
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.each{|combo| return combo if combo.all?{|cell| @board.cells[cell] == "X"} || combo.all?{|cell| @board.cells[cell] == "O"}}
    return false 
  end 
  
  def draw?
   return true if @board.full? && !won?
  end 
  
  def over?
    draw? || won?
  end 
  
  def winner
    #if won?
    #  WIN_COMBINATIONS.each do |combo| 
    #    combo.all?{|cell| return @board.cells[cell[0]] if @board.cells[cell] #=="X" || @board.cells[cell] == "O"}
    #  end 
    #else 
    #  return nil 
    #end
    return @board.cells[won?[0]] if won?
     
   end  
 
  def turn 
    input = current_player.move(@board) 
      if @board.valid_move?(input)
    #current_player.move(@board)
    @board.update(input, current_player)
      else 
       turn
      end 
  end 
  
  def play 
    until over? do 
      turn
    end 
      if draw?
        puts "Cat's Game!"
      elsif won? && winner == "O"
        puts "Congratulations O!"
      else won? && winner == "X"
        puts "Congratulations X!"
      end 
  end 
  
end 