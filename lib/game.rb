class Game 
  
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

 def current_player  #returns player object depending on turn_count
    @board.turn_count.even? ? player_1 : player_2
  end 

 def won?  #returns true/false
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

 def draw? #returns true/false
    !self.won? && @board.full? ? true : false
  end     

 def over? #over if game is won? or draw?
    if won? || draw?
      true 
    else  
      false
   end
  end

 def self.start #start custom constructor boots up CLI + game 
   puts "Initializing..."
   sleep 1
     system "clear"
     puts "Welcome to Tic Tac Toe!"
     puts "What kind of game would you like to play?: (0, 1, or 2) Players ...or... (4): Wargames"
         while player_amount = gets.chomp.to_i
          if player_amount.between?(0, 4)
              case player_amount
              when 0
                 system "clear"
                 computers = self.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
                 computers.play
                 break
               when 1
                 system "clear"
                 puts "[Player vs. CPU] -- Who should go first?"
                 while input = gets.chomp.downcase
                   if input == "player" || input == "cpu"
                     if input == "player"
                       player_1 = Players::Human.new("X")
                       player_2 = Players::Computer.new("O")
                       break
                     elsif input == "cpu"
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
                 break
               when 2
                 system "clear"
                 two_players = self.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
                 two_players.play
                 break
               when 4   #Wargames selected
                 wargame_count = 0 
                 x_win_count = 0
                 o_win_count = 0
                 until wargame_count == 100
                   system "clear"
                   this_is_war = self.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
                   this_is_war.wargames
                     if this_is_war.draw?
                        x_win_count += 0
                     elsif this_is_war.winner == "X"
                       x_win_count +=1
                     elsif this_is_war.winner == "O"
                       o_win_count +=1
                     end
                   wargame_count +=1
                 end
                   puts "\nNumber of games: #{wargame_count}"
                   puts "X won #{x_win_count} times."
                   puts "O won #{o_win_count} times."
                   puts ""
                   puts "Press enter to continue."
                   gets.chomp 
                   system "clear"
                   puts "..."
                   sleep 1
                   system "clear"
                   sleep 1
                   puts "A strange game. The only winning move is not to play."
                   puts ""
                   puts "[exit]"
                   break
                 end
           else 
             puts "Invalid Selection. Please choose (0, 1, 2) Players, or (4): Wargames."
          end 
       end
  end       

 def turn #turn engine for game
   @board.display
   input = self.current_player.move(@board)
     if @board.valid_move?(input)
       @board.update(input, self.current_player)  
     else 
       puts ""
       puts "That is an invalid move, #{current_player.token} - please try an empty space.\n"
       input = self.current_player.move(@board)
     end
  end 

 def play  #main turn engine, plays until game over, prompts for replay
    turn until over? 
    if won?
       @board.display 
       puts ""
       puts "Congratulations #{self.winner}!" 
       puts "Would you like to play again? [Exit] or [Replay]" 
       while input = gets.chomp.downcase
         if input == "replay" || input =="exit"
           if input == "replay"
             self.class.start 
           elsif input == "exit"
             break
            end
         else 
           puts "Invalid input. Type [Exit] or [Replay]."
         end
       end
   elsif draw? 
       @board.display
       puts "\nCat's Game!\n"
       puts "Would you like to play again? [Exit] or [Replay]" 
       while input = gets.chomp.downcase
        if input == "replay" || input =="exit"
           if input == "replay"
             self.class.start 
           elsif input == "exit"
             break
            end
        else 
          puts "Invalid input. Type [Exit] or [Replay]."
        end
      end 
   end
   
 end  

 def wargames #custom wargames play method. plays 100 CPU games!
       turn until over? 
         if won?
           @board.display 
           puts ""
           puts "Congratulations #{self.winner}!" 
         elsif draw? 
           @board.display
           puts "\nCat's Game!\n"
       end
     end 


   
end



   


