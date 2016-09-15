class CLI

  def start_game
   puts "Welcome to Tic Tac Toe!"
   puts "What kind of game would you like to play?"
   puts "Enter how many players: 0, 1, or 2:"
     game_type = gets.chomp

     while !["0","1","2"].include?(game_type)
       puts "Please enter a valid number of players, 0, 1, or 2:"
       game_type = gets.chomp
  end

   case game_type

     when "0"
       game = Game.new(player_1 = Players::Computer.new("X"), player_= Players::Computer.new("O"))

     when "1"
       puts "Who is X and going first?  Enter 1 for Computer and 2 for Human."
       go_first = gets.chomp
       while !["1","2"].include?(go_first)
         puts "Please make a valid entry: 1 for Computer and 2 for Human."
         go_first = gets.chomp
       end

         case go_first
           when "1"
             game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
           when "2"
             game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
         end

       when "2"
         game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     end

     game.play
     if game.over?
       puts "Do you want to play again? (Y/N)"
       play_again = gets.chomp
       if play_again == "Y" || play_again == "y"
         start_game
       else
        puts "Goodbye! Please come again!"
       end
     end

   end
 end
