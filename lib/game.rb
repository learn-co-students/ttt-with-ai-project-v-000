class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = 
  [ [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]
  
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  #basics
  
  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
  
  def won?
     WIN_COMBINATIONS.find do |win|
       
       @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] && @board.taken?(win[0]+1)
     end
       
  end
  
  def draw?
    
    board.full? && !won?
    
  end
  
  def over?
    
    draw? || won?
    
  end
  
  def winner
    
    @board.cells[won?[0]] if won?
    
  end
  
  #game management
  
  def turn
    
    current_move = current_player.move(@board)
    
    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
    else
      @board.display
      turn
    end
    @board.display

  end
  
  def play
    
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      draw?
      puts "Cat's Game!"
    end
    
  end
  
  
end