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

	def initialize(player_1 = nil, player_2 = nil, board = nil)
		if player_1 == nil && player_2 == nil && board == nil
			@player_1 = Players::Human.new("X")
			@player_2 = Players::Human.new("O")
			@board = Board.new
		else
			@player_1 = player_1
			@player_2 = player_2
			@board = board
		end
	end

	def current_player
		self.board.turn_count.even? ? player_1 : player_2
	end

	def over?
		draw? || won?
	end

	def won?
		won_combo = nil

		WIN_COMBINATIONS.each do |combo|
			position_1 = self.board.cells[combo[0]]
			position_2 = self.board.cells[combo[1]]
			position_3 = self.board.cells[combo[2]]

			if position_1 == "X" && position_2 == "X" && position_3 == "X"
				won_combo = combo
				break
			elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
				won_combo = combo
				break
			end
		end
		won_combo
	end

	def draw?
		self.board.full? && !won?
	end

	def winner
		won? ? self.board.cells[won?[0]] : nil
	end

	def turn
		if self.current_player.class == Players::Human
			puts "I'm a human player whose token is #{self.current_player.token}."
			self.board.update(self.current_player.move, current_player)
			self.board.display
		elsif self.current_player.class == Players::Computer
			puts "I'm a computer player whose token is #{self.current_player.token}."
			self.board.update(self.current_player.move(self.board), current_player)
			self.board.display
		end
	end

	def play
		until over?
			turn
		end
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cat\'s Game!"
		end
	end

	def self.start
		input = nil
		while input != 'exit'

			puts "Welcome to Tic Tac Toe!"
			puts "What kind of game would you like to play? 0,1, or 2 player: (0,1,2)"
			puts "To quit, type 'exit'."
			input = gets.strip

			case input

			when "0"
				puts "You have selected a 2 computer players game of Tic Tac Toe"
				puts "Who would you like to go first and be X? player 1, or player 2: (1,2)"
				input = gets.strip
				if input == "1"
					player_1 = Players::Computer.new("X")
					player_2 = Players::Computer.new("O")
					board = Board.new
					game = Game.new(player_1, player_2, board)
					game.play
					if game.over?
						puts "Would you like to play again? yes or no: (y/n)"
						input = gets.strip
						if input == "y"
							start
						else
							input = 'exit'
						end
					end
				else
					player_2 = Players::Computer.new("X")
					player_1 = Players::Computer.new("O")
					board = Board.new
					game = Game.new(player_2, player_1, board)
					game.play
					if game.over?
						puts "Would you like to play again? yes or no: (y/n)"
						input = gets.strip
						if input == "y"
							start
						else
							input = 'exit'
						end
					end
				end

			when "1"
				puts "You have selected a 1 human versus 1 computer game of Tic Tac Toe"
				puts "Who would you like to go first and be X? human player 1, or computer player 2: (1,2)"
				input = gets.strip
				if input == "1"
					player_1 = Players::Human.new("X")
					player_2 = Players::Computer.new("O")
					board = Board.new
					game = Game.new(player_1, player_2, board)
					game.play
					if game.over?
						puts "Would you like to play again? yes or no: (y/n)"
						input = gets.strip
						if input == "y"
							start
						else
							input = 'exit'
						end
					end
				else
					player_2 = Players::Computer.new("X")
					player_1 = Players::Human.new("O")
					board = Board.new
					game = Game.new(player_2, player_1, board)
					game.play
					if game.over?
						puts "Would you like to play again? yes or no: (y/n)"
						input = gets.strip
						if input == "y"
							start
						else
							input = 'exit'
						end
					end
				end
			when "2"
				puts "You have selected a 1 human versus 1 human game of Tic Tac Toe"
				puts "Who would you like to go first and be X? human player 1, or human player 2: (1,2)"
				input = gets.strip
				if input == "1"
					player_1 = Players::Human.new("X")
					player_2 = Players::Human.new("O")
					board = Board.new
					game = game.new(player_1, player_2, board)
					game.play
					if game.over?
						puts "Would you like to play again? yes or no: (y/n)"
						input = gets.strip
						if input == "y"
							start
						else
							input = 'exit'
						end
					end
				else
					player_2 = Players::Human.new("X")
					player_1 = Players::Human.new("O")
					board = Board.new
					game = game.new(player_2, player_1, board)
					game.play
					if game.over?
						puts "Would you like to play again? yes or no: (y/n)"
						input = gets.strip
						if input == "y"
							start
						else
							input = 'exit'
						end
					end
				end
			end
		end
	end
end