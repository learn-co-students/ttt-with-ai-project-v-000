class Game 
  # extend Players
  include Players
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top-row win
    [3, 4, 5], #mid-row win
    [6, 7, 8], #bot-row win 
    [0, 3, 6], #left-col win 
    [1, 4, 7], #mid-col win
    [2, 5, 8], #right-col win 
    [0, 4, 8], #cross-right win 
    [6, 4, 2] ]#cross-left win 

 def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

 def won? 
    WIN_COMBINATIONS.any? do |combo|
       if combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"} 
         true 
      elsif @board.full?
        false 
      else 
        false
       end
     end
 end

 def win_combo #returns winning combination
   WIN_COMBINATIONS.each do |combo|
      if combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"} 
        return combo 
      end
    end
  end 
   
 def winner  #returns "X" or "O" string
   if over? && @board.turn_count >= 3
     @board.cells[win_combo[0]] == "X" ? "X" : "O"
   else 
     nil
   end
 end

 def draw?
    !self.won? && @board.full? ? true : false
  end

 def over? #over if game is won? or draw?
    if won? || draw?
      true 
    else  
      false
   end
  end

 def self.start #start constructor for CLI Game
   puts "Initializing..."
   sleep 1
     system "clear"
     puts "Welcome to Tic Tac Toe!"
     puts "What kind of game would you like to play?: (0, 1, or 2) Players"
         while player_amount = gets.chomp.to_i
           case player_amount
           when 0
             system "clear"
             computers = self.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
             computers.play
             break if "exit"
           when 1
             system "clear"
             puts "[Player vs. CPU] -- Who should go first?"
             while input = gets.chomp
               if input == "Player" || input == "CPU"
                 if input == "Player"
                   player_1 = Players::Human.new("X")
                   player_2 = Players::Computer.new("O")
                   break
                 elsif input == "CPU"
                   player_1 = Players::Computer.new("X")
                   player_2 = Players::Human.new("O")
                   break
                 end
                else 
                  puts "Please choose [Player] or [CPU] to go first."
                end
              end 
             uno_players = self.new(player_1, player_2, Board.new)            
             uno_players.play
             break if "exit"
           when 2
             system "clear"
             two_players = self.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
             two_players.play
             break if "exit"
         end
       end
  end       

 def turn 
   @board.display
   input = self.current_player.move(@board)
     if @board.valid_move?(input)
       @board.update(input, self.current_player)  
     else 
       puts ""
       puts "That is an invalid move, #{current_player.token} - please try an empty space.\n"
       input = self.current_player.move(@board)
     end
  end #turn engine for game

 def play
     turn until over? #main turn engine, plays until game over
    if won?
       @board.display 
       puts ""
       puts "Congratulations #{self.winner}!" 
       puts "Would you like to play again? [Exit] or [Replay]" 
       input = gets.chomp 
         if input == "replay"
           self.class.start 
         elsif input == "exit"
          end
   elsif draw? 
       @board.display
       puts "\nCat's Game!\n"
       puts "Would you like to play again? [Exit] or [Replay]" 
       input = gets.chomp
       if input == "replay"
         self.class.start 
       elsif input == "exit"
        end
   end
   
 end 

  
end


