require_relative "board.rb"
require_relative "player.rb"
require_relative "players/human.rb"
require_relative "players/computer.rb"
require 'pry'
class Game
	@@win_count = 0
	attr_accessor :board, :player_1, :player_2
	WIN_COMBINATIONS = [
	  [0,1,2],
	  [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2] ]

    def initialize(player_1= Human.new("X"), player_2= Human.new("O"), board= Board.new) #refactor to better take in optional arguments
    	self.player_1 = player_1
    	self.player_2 = player_2
    	self.board = board
    end

    def current_player #this seems broken
    	#lets make it not rely on other methods
    	x_count = board.cells.select {|place| place == "X"}.count
    	o_count = board.cells.select {|place| place == "O"}.count

    	if x_count > o_count
    		curr = "O"
    	elsif o_count > x_count
    		curr = "X"
    	else
    		if player_1.token == "X"
    			curr = "X"
    		else
    			curr = "O"
    		end
    	end

    	if curr == player_1.token
    		player_1
    	else
    		player_2
    	end
    end

    def over?
		board.full? || won?    		
    end

    def won? #refactor?
    	won = false

    	WIN_COMBINATIONS.each do |combination|
    		combo = []
    		combo << self.board.cells[combination[0]]
    		combo << self.board.cells[combination[1]]
    		combo << self.board.cells[combination[2]]

    		if combo.all? {|f| f == 'X'}
    			won = true
    			break
    		elsif combo.all? {|f| f =='O'}
    			won = true
    			break    			
    		end
    	end
    	won


    end


    def draw?
    	if won? == false && over? == true
    		true
    	else
    		false
    	end
    end

    def winner #refactor
 		won = nil
    	WIN_COMBINATIONS.each do |combination|
    		combo = []
    		combo << self.board.cells[combination[0]]
    		combo << self.board.cells[combination[1]]
    		combo << self.board.cells[combination[2]]

    		if combo.all? {|f| f == 'X'}
    			won = "X"
    			break
    		elsif combo.all? {|f| f =='O'}
    			won = 'O'
    			break    			
    		end
    	end
    	won   		
    end

    def turn
    	turny_2_count = 0
    	y = nil
    	while y == nil && turny_2_count < 5
    		puts "Please enter 1-9 to make a move"
    		a = current_player.move(board) #can't just call input from here.
    		y = board.update(a, current_player)
			turny_2_count += 1
	    end
	    board.display
    end

    def play
    	turny_count = 0
	    	while !over? && !won? && turny_count < 15 
	    		draw? #this really shouldn't be here, but is only required for test
	    		turny_count += 1
	    		turn
	    	end
	    	#over might not be doing what is expected because of weird test input
	    	if won? 
	    			puts "Congratulations #{winner}!"
	    		elsif draw?
	    			puts "Cats Game!"	    			
	    	end
    end

    def self.wargames
    	100.times do 
    		a = Game.new(player_1 = Computer.new("X"), player_2 = Computer.new("O"))
    		a.play
    		if a.won?
    			@@win_count += 1
    		end
    	end

    	puts "a strange game, the only winning move is not to play. How about a nice game of chess win count: #{@@win_count}"
    end

end

# a = Game.new(player_1 = Computer.new("X"), player_2 = Computer.new("O")) #using O as the computer player, O played and then didn't make a move

# a.play

