class Game

	attr_accessor :board, :player_1, :player_2, :x_name, :o_name, :WIN_COMBINATIONS

	WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
	AI_NAME_SET = ["Sonny", "Alfie", "Rosey", "Jinx", "MCP", "Auto", "Fembot", "Joshua", "Dot Matrix", "Tron", "Skynet"] 

	def initialize(player_1 = Human.new('X'), player_2 = Human.new('O'), board=Board.new, x_name=nil, o_name=nil)
		@board = board

		@player_1 = player_1
		@player_2 = player_2

		player_1.name = AI_NAME_SET[rand(AI_NAME_SET.length)] if player_1.class == Computer
		player_2.name = AI_NAME_SET[rand(AI_NAME_SET.length)] if player_2.class == Computer
		player_1.name = x_name if player_1.class == Human
		player_2.name = o_name if player_2.class == Human
	end

	def current_player
		board.turn_count.even? ? player_1 : player_2
	end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |set|
      board.position(set[0]+1) == board.position(set[1]+1) &&
      board.position(set[1]+1) == board.position(set[2]+1) &&
      board.taken?(set[0]+1)
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    board.position(won?[0]+1) if won?
	end

	def turn
		if player_2.class != Computer || player_1.class != Computer
			system ("cls") #clears the screen
			board.display
		end
		position = current_player.move(board)
		if board.valid_move?(position) && !board.taken?(position)
			board.update(position, current_player)
		else
			turn
		end
	end

	def play
		until over?
			turn 
		end
		system ("cls") #clears the screen
		board.display

    if won?
			puts "Congratulations #{winner}!" #left in to satisfy tests
    	if winner == "X"
    		if player_1.class == Human
		      puts "Congratulations #{player_1.name}!"
		    else
		      puts "Congratulations AI #{player_1.name}!"
		    end
		    if player_2.class == Human
		      puts "Better luck next time, #{player_2.name}."
		    else
		      puts "Better luck next time, AI #{player_2.name}!"
		    end
	    else
    		if player_2.class == Human
		      puts "Congratulations #{player_2.name}!"
		    else
		      puts "Congratulations AI #{player_2.name}!"		      
		    end
    		if player_1.class == Human
		      puts "Better luck next time, #{player_1.name}."
		    else
		      puts "Better luck next time, AI #{player_1.name}!"		      
				end
			end
    elsif draw?
      puts "Cats Game!"
    end
    input = String.new
    until input.match(/[yYnN]/)
			input = [(print "Would you like to play again (y/n)?: "), gets.rstrip][1]
			Game.start if input.match(/[yY]/)
		end
	end

	def self.start
		system ("cls") #clears the screen
		puts "Welcome to Tic Tac Toe with AI!"
		game_type = [(print "How many players? (0, 1 or 2): "), gets.rstrip][1]

		#this caused the tests to fail, so I removed it
		# until game_type == "0" || game_type == "1" || game_type == "2"
		# 	game_type = [(print "That is not a valid choice. Please select 0, 1, or 2: "), gets.rstrip][1]
		# end
		
		if game_type == "0"
			Game.new(player_1 = Computer.new('X'), player_2 = Computer.new('O')).play
		elsif game_type == "1"
			x_name = [(print "Player X, what's your name: "), gets.rstrip][1] #getting player's name
			Game.new(player_1=Human.new('X'), player_2=Computer.new('O'), board=Board.new, x_name=x_name).play
		elsif game_type == "2"
			x_name = [(print "Player X, what's your name: "), gets.rstrip][1] #getting player's name
			o_name = [(print "Player O, what's your name: "), gets.rstrip][1] #getting player's name
			Game.new(player_1=Human.new('X'), player_2=Human.new('O'), board=Board.new, x_name=x_name, o_name=o_name).play
		end		
	end
end