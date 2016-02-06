require 'pry'
class Game
	WIN_COMBINATIONS = [
											[0,1,2],
											[3,4,5],
											[6,7,8],
											[0,3,6],
											[1,4,7],
											[2,5,8],
											[0,4,8],
											[6,4,2]
											]
	DIVIDER = "===================\n"									
											
	attr_accessor :player_1, :player_2, :board, :war_mode, :war_stats
	attr_reader :the_winner
	
	def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
		@war_mode = false
		@war_stats = {
			:num_games => 0,
			:x_wins => 0,
			:o_wins => 0,
			:draws => 0
		}
	end
	
	def current_player
		board.turn_count.even? ? player_1 : player_2
	end
	
	def over?
		won? ? true : draw?
	end
	
	def won?
		WIN_COMBINATIONS.any? do |combo|
			all_same?(combo, "X") || all_same?(combo, "O")
		end
	end
	
	def all_same?(array, token)
		if array.all? {|i| board.cells[i] == token}
			@the_winner = token
			true
		else
			@the_winner = nil
			false
		end
	end
	
	def draw?
		!board.full? ? false : !won?
	end
	
	def winner
		won? ? the_winner : nil
	end
	
	def turn
		input = current_player.move(board)
		if board.valid_move?(input) 
			board.update(input, current_player)
		else
			puts input
			puts "\nInvalid move. Enter an open position from 1-9."
			display_turn
			turn
		end
	end
	
	def play
		while !over?
			display_turn if !war_mode
			turn
		end
		war_mode ? end_wargames : end_normal
	end
	
	def display_turn
		puts "\n" + DIVIDER
		puts "  #{current_player.token}'s turn"
		puts DIVIDER
		board.display
	end
	
	def start
		puts "\n#{DIVIDER}Welcome to Tic Tac Toe!"
		puts "Enter number of players (0, 1, 2) or type 'wargames' to have the computer play itself 100 times."
		puts "Type 'exit' to quit the program.\n#{DIVIDER}"
		input = gets.strip
		c1 = Computer.new("X")
		c2 = Computer.new("O")
		reset!
				
		case input
		when '0'
			c1.set_sleep_time(1.25)
			c2.set_sleep_time(1.25)
			self.player_1 = c1
			self.player_2 = c2
		when '1'
			self.player_2 = c2
		when '2'
			nil
		when 'wargames'
			c1.set_sleep_time(0)
			c2.set_sleep_time(0)
			self.player_1 = c1
			self.player_2 = c2
			self.war_mode = true
		when 'exit'
			exit
		else 
			puts "Invalid input"
			start
		end
		play
	end
	
	def play_again?
		puts "Would you like to play again? y/n"
		input = gets.strip
		case input
		when 'y'
			start
		when 'n'
			exit
		else
			puts "Please enter 'y' or 'n'"
			play_again?
		end
	end
	
	def end_normal
		display_summary
		play_again?
	end
	
	def display_summary
		puts "\n" + DIVIDER
		draw? ? (puts "Cats Game!") : (puts "Congratulations #{winner}!")
		puts DIVIDER
		board.display
	end
	
	def end_wargames
		war_stats[:num_games] += 1
		if war_stats[:num_games] < 101
			if draw?
				war_stats[:draws] += 1
			else
				winner == "X" ? war_stats[:x_wins] += 1 : war_stats[:o_wins] += 1
			end 
			puts "Game #{war_stats[:num_games]}:"
			display_summary
			self.board = Board.new 
			play
		else
			puts "\n" + DIVIDER
			puts "Wargames completed! "
			puts "X wins: #{war_stats[:x_wins]}"
			puts "O wins: #{war_stats[:o_wins]}"
			puts "Draws: #{war_stats[:draws]}"
			puts DIVIDER
			play_again?
		end
	end
	
	def reset!
		@player_1 = Human.new("X")
		@player_2 = Human.new("O")
		@board = Board.new
		@war_mode = false
		@war_stats = {
			:num_games => 0,
			:x_wins => 0,
			:o_wins => 0,
			:draws => 0
		}
	end
		
end
