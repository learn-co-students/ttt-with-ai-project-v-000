class Game 
  
  attr_accessor :board, :player_1, :player_2, :combo
  
  def play 
    if draw? 
      puts "Cat's Game!"
    end 
    if over? 
      puts "Congratulations #{winner}!"
    else 
      turn 
      play 
    end 
  end 
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new) 
     @player_1 = player_1 
     @player_2 = player_2 
     @board = board 
     
  end 
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      a = combo[0]
      b = combo[1]
      c = combo[2]
      if @board.cells[a] == @board.cells[b] && @board.cells[b] == @board.cells[c] && @board.cells[a] != " "
        return combo 
      end
    end
    false
  end
 
  def draw? 
    if won? == false && @board.cells[0] != " " && @board.cells[1] != " " && @board.cells[2] != " " && @board.cells[3] != " " && @board.cells[4] != " " && @board.cells[5] != " " && @board.cells[6] != " " && @board.cells[7] != " " && @board.cells[8] != " "
        true 
    else
      false 
    end 
    
  end 
  
  def over? 
    if won? or draw? 
      true 
    else 
      false 
    end 
  end 
  
  def winner 
      
    if self.won? 
      x = self.won?[0]
      y = @board.cells[x]
    end 
    
    if y == "X"
      return "X" 
    elsif y == "O"
      return "O" 
    end 
  end 
  
  def turn 
    puts "Player 1, please select a space."
    input = current_player.move(board)
    if board.valid_move?(input) 
      board.update(input, current_player)
    else 
      turn 
    end 
  end 
  
  
  
  def current_player
  a = 0 
  b = 0 
  
  @board.cells.each do |cell|
    if cell == "X"
      a += 1 
    elsif cell == "O"
      b += 1 
    end 
  end 
 
  if a == b 
    z = @player_1
  else 
    z = @player_2
  end
  z 
end 
  
  
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]
  
  
end 