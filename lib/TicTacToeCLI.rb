class TicTacToeCLI

	def start_game
  welcome
	game_type = gets.chomp
  action(game_type) if game_type != "exit"
  goodbey
end

def welcome 
	puts "----------***********************-------------"
	puts "          Welcome to Tic Tac Toe              "
	puts "----------***********************-------------"
	puts " What kind of a game would you like to play   "
	puts "Computer against the computer.    enter    0  "
	puts "One player against the computer.  enter    1  "
	puts "Two players against each other .  enter    2  "
	puts "----------------------------------------------"
end

def goodbey
	 puts "                 * Goodbey *"
end

def action(game_type)

  if game_type.to_i == 0
	  computer_1 = Players::Computer.new("X")
	  computer_2 = Players::Computer.new("O")
	  game = Game.new(computer_1, computer_2)
	  game.play

	elsif game_type.to_i == 1
		puts "Who should go first and be \"X\" computer or human?"
    first_player = gets.chomp

		if first_player == "computer"
		  computer = Players::Computer.new("X")
		  game = Game.new(computer)
		elsif first_player == "human"  
		  human = Players::Human.new("X")
		  computer = Players::Computer.new("O")
		  game = Game.new(human, computer)
    end
		
    game.play

    puts "Would you like to play again?"
    play_again = gets.chomp
    start_game if play_again == "yes"

	elsif game_type.to_i == 2
		puts "Who should go first and be \"X\" player1 or player2?"
    game = Game.new
    game.play

    puts "Would you like to play again?"
    play_again = gets.chomp
    start_game if play_again == "yes"
	else
	  puts "Please choose number of players correctly"
	end	
end
end