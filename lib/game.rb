
#Game ::WIN_COMBINATIONS
#defines a constant WIN_COMBINATIONS with arrays for each win combination
class Game
#Game #board provides access to the board
#Game #player_1 provides access to player_1
#Game #player_2 provides access to player_2
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
		[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6],
		[1,4,7],
		[2,5,8],
		[0,4,8],
		[2,4,6]
	]

#Game initialize accepts 2 players and a board
 #Game initialize defaults to two human players, X and O, with an empty board
 #Players module::Human class
	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@board = board
		@player_1 = player_1
		@player_2 = player_2
	end

#Game #start , starts the game with prompts for type of game
	def start
			puts "Welcome to Tic Tac Toe, What kind of game would you like to play?"
			puts "Type '1' to play against the computer."
			puts "Type '2' to play with another person."
			puts "Type 'wargames' to have the computer play itself."
			puts "Type 'finish' if you wish not to play anymore."

			game_mode = gets.strip
		#Case statements to choose with type of game to play
			case game_mode
			when "1"
				one_player
			when "2"
				two_player
			when "wargames"
				wargames
			when "finish"

			else
			 start
			end

	end
	# one_player game vs computer
	def one_player
	    player_1 = Players::Human.new("X")
	    player_2 = Players::Computer.new("O")
	    new_board = Board.new
	    initialize(player_1,player_2,new_board)
	    puts "You will be: X"
	    play
	    start
	end
	#two player game vs another person
	def two_player
	    player_1 = Players::Human.new("X")
	    player_2 = Players::Human.new("O")
	    new_board = Board.new
	    initialize(player_1,player_2,new_board)
	    puts "Player 1 will be X."
	    puts "Player 2 will be O."
	    play
	    start
	end
	#computer plays itself
	def wargames
	    player_1 = Players::Computer.new("X")
	    player_2 = Players::Computer.new("O")
	    new_board = Board.new
	    initialize(player_1,player_2,new_board)
	    play
	    puts "A strange game, the only winning move is not to play."
	    start
	end






#Game #current_player returns the correct player, X, for the third move
	def current_player
	 @board.turn_count % 2 == 0 ? @player_1 : @player_2
	end





# Game #over? returns true for a draw
# Game #over? returns true for a won game
# Game #over? returns false for an in-progress game
	def over?
		won? || draw?
	end

	def winner
		if winning_combo = won?
			@winner = @board.cells[winning_combo.first]
		end
	end

	def turn
	    player = current_player
	    current_move = player.move(@board)
	    if !@board.valid_move?(current_move)
	      turn
	    else
	      puts "Turn: #{@board.turn_count+1}\n"
	      @board.display
	      @board.update(current_move, player)
	      puts "#{player.token} moved #{current_move}"
	      @board.display
	      puts "\n\n"
	    end
  	end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  	def won?
		WIN_COMBINATIONS.detect do |combo|
			@board.cells[combo[0]] == @board.cells[combo[1]] &&
			@board.cells[combo[1]] == @board.cells[combo[2]] &&
			@board.taken?(combo[0] + 1)
		end
	end

#Game #draw? returns false for a won game
#Game #draw? returns true for a draw
	def draw?
		@board.full? && !won?
	end


	
end