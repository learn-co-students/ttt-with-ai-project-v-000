class TicTacToeCLI
	def initialize
		@win_count = {
			"X" => 0,
			"O" => 0
		}
	end

	def start_again
		puts "Enter 1 to play with a fellow inferior meatbag."
		puts "Enter 2 to be crushed by-- I mean, play with me!"
		puts "Enter 'WARGAMES' to watch me play against another robot 100 times, you sick, depraved monster."
		puts "Enter 'score' to see the score table."
		puts "Enter 'reset!' to reset the score table."
		puts "Enter 'exit!' to stop wasting both of our time."
		input = gets.chomp
		play(input)
	end

	def calculate_wins(g)
		@win_count.each do |token, score|
	  		@win_count[token]+=1 if token == g.winner
		end
	end

	def score
		puts "X: #{@win_count["X"]} WINS. O: #{@win_count["O"]} WINS."
	end

	def human_versus_human
		g = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
		g.play
		calculate_wins(g)
		score
	end	

	def human_versus_robot
		puts "Enter 1 to have you go first, or enter 2 to have me go first."
		new_input = gets.chomp
		case new_input
		when "1"
			g = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
			g.play
			calculate_wins(g)
			score
		when "2"
			g = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
			g.play
			calculate_wins(g)
			score
	 	end
	end

	def robot_versus_robot
		100.times do 
			g = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
			g.play
			calculate_wins(g)
		end
		score
		puts "A strange game. The only way to win is not to play..."
	end

	def play(input)
		case input
		when "1"
			human_versus_human
			start_again
		when "2"
			human_versus_robot
			start_again
		when "WARGAMES"
			robot_versus_robot
			start_again
		when "score"
			score
			start_again
		when "reset!"
			@win_count["X"] = 0
			@win_count["O"] = 0
			start_again
		when "exit!"
			exit
		end
	end

	def call
		puts "Greetings meatbags! Welcome to Tic-Tac-Robo!
		   T
		 .-'-.
		|  ___|
		| (.\/.)
		|  ,,,' 
		| '###
		 '----'"

		start_again		
	end
end
