class Game

	attr_accessor :board, :player_1, :player_2


	WIN_COMBINATIONS = [
	[0, 1, 2], #top row
	[3, 4, 5], #middle row
	[6, 7, 8], #bottom row
	[0, 3, 6], #left column
	[1, 4, 7], #middle column
	[2, 5, 8], #right column
	[0, 4, 8], #top left-to-bottom-right
	[2, 4, 6] #top right-to-bottom-left
	]

	def initialize( player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		board.turn_count.even? ? @player_1 : @player_2
	end

	def over?
		draw? || won? 
	end

	def draw?
		board.full? && !won?
	end

	def won?
		WIN_COMBINATIONS.detect do |win_combo|
      board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
      board.cells[win_combo[1]] == board.cells[win_combo[2]] &&
      board.taken?(win_combo[0]+1) # add 1 to return number between 1-9
    	end
	end

	def winner
		if winning_combo = won?
			the_winner = board.cells[winning_combo.first]
		end
	end

	def turn
		puts "To Make Your Move Pick a Number Between 1-9"
		puts "Turn: #{@board.turn_count+1}\n"
    	input = current_player.move(board)
    	if !board.valid_move?(input)
      		turn
    	else
      	board.update(input, current_player)
      	board.display
    	end
	end

	def play
		while !over?
      		turn
    	end
    	if won?
      		puts "Congratulations #{winner}!"
    	elsif draw?
      		puts "Cats Game!"
    	end
	end

	def start
    	puts "Shall we play a game?"
    	puts "How many human players? 0/1 or 2 or wargames?"
    	num_players = gets.strip.to_i

      	if num_players == 0
        	game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        	game.play

      	elsif num_players == 1
        	puts "So Who's Going First and Playing As X?"
        	first = gets.strip
        	game = Game.new(Players::Human.new("X"),Players::Computer.new("O"))
        	game.player_1.name = first
        	game.play
        
      	elsif num_players == 2
        	puts "So Who's Going First and Playing As X?"
        	first = gets.strip
        	player_1.name = first
        	puts "Who's Playing As O?"
        	second = gets.strip
        	player_2.name = second
        	play

        elsif num_players == "wargames"
        	while counter < 100
        	game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        	game.play
        	counter += 1
        	end
      	end
    end
end