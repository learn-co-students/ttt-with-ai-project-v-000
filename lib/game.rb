class Game < Board
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

  def initialize (player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || @player_1 = Players::Human.new("X")
    @player_2 = player_2 || @player_2 = Players::Human.new("O")
    @board = board || @board = Board.new
  end
  
  def current_player
    if @board.turn_count.even?
      @player_1
    else 
      @player_2
   end 
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |win| 
      @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[0]] == @board.cells[win[2]] && (@board.cells[win[0]] == "X" || @board.cells[win[0]] == "O")
    end
  end
  
  def draw?
    !won? && @board.full?
  end
  
  def over?
     won? || draw?
  end
  
  def winner 
    if won? == nil
      nil
    else
      @board.cells[won?[0]]
    end
  end
  
  def turn 
    num = current_player.move(board)
      if @board.valid_move?(num)
        @board.update(num, current_player)
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
    
  def start 
    puts "Welcome to Tic-Tac-Toe!!!"
    puts "Please select your game type:"
    puts "Input C to play against computer."
    puts "Input H to play against another human."
    puts "Input CC to watch computers play."
    
    input = gets.chomp
    
    if input == "C"
      computer_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      computer_game.play 
    
  elsif input == "H" 
    human_game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
      human_game.play
      
  elsif input == "CC" 
      ai_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      ai_game.play
  
  else 
    start 
  end
end
    
    
    
    
  
        
end