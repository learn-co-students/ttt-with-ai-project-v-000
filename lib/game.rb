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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end 
  #state of game methods
   def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo| 
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[0] + 1) 
    end
  end 
  
  def draw?
    !won?  && @board.full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won? == nil
      nil
    elsif board.cells[won?[0]] == "O"
      "O"
    elsif board.cells[won?[0]] == "X"
      "X"
    end 
  end 
  
  #managing game methods 
  def start 
    input = ""
    puts "Welcome to Tic Tac Toe!"

    until input == "0" || input == "1" || input == "2"
      puts "How many players will there be, 0, 1 or 2?"
      input = gets.strip
    end

    if input == "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      
    elsif input == "1"
      input_2 = ""
      until input_2 == "1" || input_2 == "2"
        puts "Enter 1 or 2 to decide if you want to go first or second."
        input_2 = gets.strip
      end 
      if input_2 == "1"
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Computer.new("O")
        p
      else 
        @player_2 = Players::Human.new("O")
        @player_1 = Players::Computer.new("X")
        
      end
    elsif input == "2"  
      puts "Player 1 will be 'X'."
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    end
    self.play 
    answer = ""
    until answer = "no" || answer == "yes"
      puts "Would you like to play again? Yes or No?"
      answer = gets.strip 
      if answer == "yes"
        game.start 
      else 
      end 
    end 
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
  
  def turn 
   puts "Please enter 1-9:"
   board.display
   player = current_player
   p_input = player.move(board)
   if board.valid_move?(p_input)
     board.update(p_input, player)
   else
     turn 
   end
    puts "Current Board:"
  end

end 
