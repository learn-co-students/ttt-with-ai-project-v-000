class Game
  
  attr_accessor :board, :player_1, :player_2, :winner

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0 
      @player_1 
    else
      @player_2
    end
  end
  
  def won?
    #previous code used .each to enumerate, but we really needed to use . detect so that it would stop the firts time the code finds that example
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
      @board.taken?(win_combo[0]+1)
      end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
     won? || draw?
  end
  
  def winner
    if winning = won?
      @winner = @board.cells[winning[0]]
    end
  end
  
  def turn
    
    player = self.current_player #returns player_1 or player_2 object instance 
    
    cell_choice = player.move("")#return the cell # the player is choosing
    
    if @board.valid_move?(cell_choice) == false
      
      while @board.valid_move?(cell_choice) == false
        puts "try again"
        cell_choice = player.move("")
      end
    end
    @board.update(cell_choice, player)
    @board.display
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
 
   


