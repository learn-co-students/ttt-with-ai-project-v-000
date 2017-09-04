class Game
	attr_accessor :board, :player_1, :player_2
	WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
  	@player_1 = player_1
  	@player_2 = player_2
  	@board = board
  end

  def current_player
  	count = 0
  	p = nil
  	board.cells.each do |c| 
  		if (c == "X" || c == "O") 
  			count = count + 1
  		end
  		p = count % 2 == 0 ? player_1 : player_2
  		
  	end
  		p
	end

	def over?
		won? || draw?
		#if !board.cells.detect {|c| c == " "}
		#	true
		#else false
		#end
	end

	def won?
		WIN_COMBINATIONS.select do |p|
      win_index_1 = p[0]
      win_index_2 = p[1]
      win_index_3 = p[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]


      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        return p
      end
    end
    return nil
	end

	def draw?
		!self.won? && board.full?
		
	end

	def winner
		if self.won?
		board.cells[self.won?[0]]
		end
	end

	def turn
#binding.pry

		choice = self.current_player.move(board)

		if board.valid_move?(choice)
			board.update(choice, current_player)
		else 
			turn
		end		

		#choice
	end

	def play
		while !over?
			turn
			board.display
		end
		if won?
			binding.pry
			puts "Congratulations #{self.winner}!"	 
		elsif draw?
			puts "Cat's Game!"
		end
	end	

	def self.start
		#Greet the user with a message.
			puts ""
			puts "Welcome to Tic Tac Toe!"
			puts ""
			play = "Y"
			while play == "Y"
				puts "How many players? (0, 1, or 2)"
				choice = gets.strip

					case choice
						when "0"
						game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))	
						when "1"
						game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))	
						when "2"
						puts "Who should go first and be X."
						player1 = gets.strip

						puts "Who should go second and be O."
						player2 = gets.strip

						game = Game.new(player_1 = Players::Human.new("X", player1), player_2 = Players::Human.new("O", player2))
						
					end

				game.board.display

				game.play

				puts "Play again? (Y/N)"
				play = gets.strip.upcase
			end
		
#Use the input to correctly initialize a Game with the appropriate player types and token values.
#When the game is over, the CLI should prompt the user if they would like to play again and allow them to choose a new configuration for the game as described above. If the user doesn't want to play again, exit the program.
	end		
end