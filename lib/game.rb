class Game < Board 
  
  attr_accessor :board, :player_1, :player_2

  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
  end 
  
  def current_player 
   @board.turn_count % 2 ==0 ? player_1 : player_2
 end
  
  def over?
    won? || draw?
  end 

  def draw?
    @board.full? && !won?
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
      @board.cells[winning_combo[0]] == @board.cells[winning_combo[1]] &&
      @board.cells[winning_combo[0]] == @board.cells[winning_combo[2]] &&
     (@board.cells[winning_combo[2]] == "X" || @board.cells[winning_combo[2]] == "O")
    end 
  end 
    
    
  def winner
    if won? != nil
   @winner =  @board.cells[won?[0]]

  end 
    
  end 
  
  def turn 
    input = current_player.move(@board)
   if @board.valid_move?(input)
    @board.update(input, current_player)
    @board.display
    else 
    puts "Invalid"
    turn 
   end
  end 
  
  def play 
    until over?
      turn 
    end 
    
 if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
  
  end 
  
  def start
      puts "Welcome to Tic Tac Toe!"
      puts "Select the type of game you'd like to play:"
      puts "CC - Computer vs Computer"
      puts "HC - Human vs Computer"
      puts "HH - Human vs Human"
      
      input = gets.strip 
          
      
      if input == "CC"
         a_i_game = Game.new(player_1 = Players::Computer.new("X"),
         player_2 = Players::Computer.new("O"), 
         board = Board.new)
         a_i_game.play
         
      elsif input == "HC"
        h_c_game = Game.new(player_1 = Players::Human.new("X"),
         player_2 = Players::Computer.new("O"), 
         board = Board.new)
         h_c_game.play 
         
       else input == "HH"
         h_h_game = Game.new(player_1 = Players::Human.new("X"),
         player_2 = Players::Human.new("O"), 
         board = Board.new)
         h_h_game.play 
       end 
      end

end
