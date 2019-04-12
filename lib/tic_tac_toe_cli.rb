class TicTacToeCLI

  def initialize
  end

  def call
    def greeting
    	puts "What is up, playa? Shall we play a game? (y/n)"
    	play_now?
    end

    def play_now?
    	play = gets.strip
    	if play == "n"
    		puts "Too bad, so sad."
    		exit
    	elsif play != "n" && play != "y"
    		puts "You must answer with 'y' or 'n'."
    		play_now?
    	else
    		puts "Sweet."
    		how_many_players?
    	end
    end

    def game_0
    	new_game_0 = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
    	new_game_0.play
    end

    def game_1
    	puts "Who wants to be 'X' / go first? You or the computer? (y/c)"
    	goes_first = gets.strip
    	if goes_first == "y"
    		new_game_1 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
    	elsif goes_first == "c"
    		new_game_1 = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
    	else
    		puts "You must choose you or the computer. (y/c)"
    		game_1
    	end
    	new_game_1.play
    end

    def game_2
    	puts "Who wants to be 'X' / go first? (Enter your name.)"
    	name_1 = gets.strip
    	puts "Alright, #{name_1}..."
    	new_game_2 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
    	new_game_2.play
    end

    def how_many_players?
    	puts "How many players? (0, 1, or 2)"
    	how_many = gets.strip
    	if how_many == "0"
    		game_0
    	elsif how_many == "1"
    		game_1
    	elsif how_many == "2"
    		game_2
    	else
    		puts "Your choices are 0, 1, or 2."
    		how_many_players?
    	end
    end

    greeting
    play_now?
  end

end
