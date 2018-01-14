
require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS =[ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
 
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count == 0 || @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end
  
  def over?
    @board.full? || self.won?
  end
  
  def won?
  WIN_COMBINATIONS.detect do |number|
    win_index = number
     (@board.cells[win_index[0]] == "X"  && @board.cells[win_index[1]] == "X"  && @board.cells[win_index[2]] == "X") ||  (@board.cells[win_index[0]] == "O"  && @board.cells[win_index[1]] == "O"  && @board.cells[win_index[2]] == "O") 
     end
   end
   
   def draw?
     @board.full? && !self.won?
   end
   
   def winner
     if self.won?
     @board.cells[self.won?[0]]
     end
   end
   
   def turn
     input = self.current_player.move(@board)
     if @board.valid_move?(input)
     @board.cells[input.strip.to_i - 1] = self.current_player.token
     @board.display
   else 
     self.turn
    end
  end
  
  def play
    while !self.over? && !self.draw?
    self.turn
    end
    if self.over? && !self.draw?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
  def start
    game_started = false
    puts "Welcome to the pinnacle of human achievement!"
    puts "How many players?"
    input = gets.strip.chomp
    if input == "1"
      puts "Okay! You're gonna play the computer. Who goes first: you or the computer?"
      input_2 = gets.strip.chomp
      if input_2 == "human" || input_2 == "me"
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Computer.new("O")
        game_started = true
      elsif input_2 == "computer"
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Human.new("O")
        game_started = true
      elsif input_2 == "you"
      puts "No, I'm not playing. START OVER."
      self.start
    else 
      puts "Sorry, I didn't recognize that. START OVER."
        self.start
      end
    elsif input == "0"
    puts "Okay! You're gonna watch two computers play. Type enter to begin."
    input = gets
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      game_started = true
    elsif input == "2"
      puts "Okay! Player 1, you go first."
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      game_started = true
    elsif game_started == false
      puts "Sorry, I didn't recognize that. START OVER."
      self.start
    end
    puts "Let's get started!"
    self.play
  end
end

#if @board.valid_move?(input)
  #    @board.cells[input.strip.to_i - 1] = self.current_player.token
   #  input=gets
  # else
  #   input = gets
  #  end


#def won?
  #WIN_COMBINATIONS.detect do |number|
   # win_index = number
    # (@board[win_index[0]] == "X"  && @board[win_index[1]] == "X"  && @board[win_index[2]] == "X") ||  (@board[win_index[0]] == "O"  && @board[win_index[1]] == "O"  && @board[win_index[2]] == "O") 
   #  end
  # end
   
  #  WIN_COMBINATIONS =[ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]