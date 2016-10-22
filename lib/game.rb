class Game

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

	def initialize( player_1 = Players::Human.new("X"),
		              player_2 = Players::Human.new("O"),
		              board = Board.new )
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		@board.turn_count % 2 == 0 ? player_1 : player_2
	end

	def over?
		won? || draw?
	end

	def won?
		cells = @board.cells
		WIN_COMBINATIONS.detect do |combo| 
			cells[combo[0]] != " " &&
			  cells[combo[0]] == cells[combo[1]] &&
			  cells[combo[1]] == cells[combo[2]]
		end
	end

	def draw?
		@board.full? && !won?
	end

	def winner
		combo = won?
		!combo ? nil : @board.cells[combo[0]]
	end

	def turn
		current_turn = ''
		player = current_player
		while !@board.valid_move?(current_turn)
			print "\nInvalid move. " if current_turn != ''
		  current_turn = player.move(@board)
		end
		@board.update(current_turn,player)
	end

	def play
		@board.display

		while !over?
			turn
			@board.display
		end

		if draw?
			puts "Cats Game!"
		else
			puts "Congratulations #{winner}!"
		end
	end

  def self.input_validation(input,valid_array)
    while !valid_array.include?(input)
    	print "\nInvalid input. Try again. "
    	input = gets.chomp
    end
    input
  end

	def self.start
		exit = false
		while !exit
			puts 'Welcome to our Tic Tac Toe.'
			print 'How many human players? (0,1,2): '
			humans = input_validation(gets.chomp, ['0','1','2'])
			puts "\n\nO.K. Playing with #{humans} human player."
			if humans == '1'
				print 'Who goes first, computer or human? '
				first = input_validation(gets.chomp, ['computer','human'])
				if first == "computer"
					player_1 = Players::Computer.new("X")
					player_2 = Players::Human.new("O")
				else
					player_1 = Players::Human.new("X")
					player_2 = Players::Computer.new("O")
				end
				puts "\nO.K. The #{first} opens play."
			elsif humans == '0'
				player_1 = Players::Computer.new("X")
				player_2 = Players::Computer.new("O")
			elsif humans == '2'
				player_1 = Players::Human.new("X")
				player_2 = Players::Human.new("O")
			end
			game = self.new(player_1,player_2)
			game.play
			print "\nWould you like to play a new game? (y,n) "
			repeat = input_validation(gets.chomp, ['y','n'])
			repeat.downcase == "y" ? exit = false : exit = true
		end

		puts "\nThank you for playing!"		
	end

end