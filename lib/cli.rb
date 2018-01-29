class CLI
 
   def start
     puts "Welcome to Tic Tac Toe!"
     puts " "
     puts "MENU"
     puts "- - - - - - - - - - -"
     menu
   end

   def menu
     puts "Select from the following options"
     puts "0 player - to watch the computer play itself"
     puts "1 player - to play against the computer"
     puts "2 player - play against a friend, or your own brain!"
     puts "- - - - - - - - - - -"
     puts "Make your selection to begin the game."
     puts "Enter 'q' to quit."
     selection = gets.strip

     case(selection)
     when '0'
       computer_only_game
     when '1'
       one_player_game
     when '2'
       two_player_game
     when 'q'
       puts "Come back and play again!"
       exit
     else
       puts "Please select a valid otion."
       menu

     end
   end


   def computer_only_game
     game = Game.new
     puts "Watch the computer play itself VERY fast"
     Game.new(Players::Computer.new('X'), Players::Computer.new('O')).play
     new_game?
   end

   def one_player_game
     game = nil
     puts "This is exactly like any other Tic Tac Toe"
     puts "Object of the game is to get 3 in a row"
     puts "You must select an open box in order to be valid"
     puts "Let's be smart now and follow the rules."
     puts "Don't make this program work harder than it needs to"
     puts "- - - - - - - - - - -"
     puts "Do you want to go first as X?"
     puts "Select 'y' or 'n'"
     selection = gets.strip
     if selection == 'y'
       game = Game.new(Players::Human.new('X'), Players::Computer.new('O'))
     elsif selection == 'n'
       game = Game.new(Players::Computer.new('X'), Players::Human.new('O'))
     else
       puts "Please make a valid selection"
       selection = gets.strip
     end
     game.play
     new_game?
   end


   def two_player_game
     game = nil
     puts "This is exactly like any other Tic Tac Toe."
     puts "Object of the game is to get 3 in a row."
     puts "You must select an open box in order to be valid."
     puts "Let's be smart now and follow the rules."
     puts "Don't make this program work harder than it needs to."
     puts "- - - - - - - - - - -"
     game = Game.new
     game.board.display
     game.play
     new_game?
   end


   def new_game?
     puts "Do you want to start a new game?"
     puts "Enter 'y' or 'n'"
     input = gets.strip.downcase
     if input == "y"
       menu
     else
       puts "Thanks for playing!"
       exit
     end
   end
 end
