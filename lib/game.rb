require 'pry'
class Game 
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1 
     @player_2 = player_2 
   end
   
   def current_player 
     @board.turn_count%2 == 0 ? @player_1 : @player_2
   end
   
   def draw?
     !won? && @board.full?
   end
   
   def over?
     won? || draw? 
   end
   
   def won? 
     WIN_COMBINATIONS.detect do |win|
      @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] && (@board.cells[win[0]] == "X" || @board.cells[win[0]] == "O")
     end
   end
   
   def winner
    if winning_combo = won? 
      @board.cells[winning_combo[0]]
    else
      nil
    end
   end
   
   def turn
    player = self.current_player
    @board.display
    input = player.move(board)
      if @board.valid_move?(input)
        @board.update(input, player)
        @board.display
      else turn
      end
   end
   
   def play
    while !self.over?
      turn
    end
      if won?
      puts "Congratulations #{winner}!"
      else 
      puts "Cat's Game!"
      end
   end
   
   def start
    puts "Welcome to Tic Tac Toe!
    What kind of game will you like to play? Please choose player mode:
 
   0 : Computer VS Computer
   1 : You VS Computer
   2 : You VS a friend"
 
   player_mode = gets.strip

    if player_mode == "0"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    elsif player_mode == "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
    elsif player_mode == 1
        puts "Do you want to go first? [y/ n]"
       user_answer = gets.strip
        if user_answer == "y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
        else   Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
        end
    end
    puts "Would like to play again? [y/ n]"
    input = gets.strip
    if input == "n"
      puts "Thank you for playing."
    else 
       start
    end
  end
end