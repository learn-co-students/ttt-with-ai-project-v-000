require 'pry'
class Game

	attr_accessor :board, :player_1, :player_2
	extend Players

	WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]]

    def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board=Board.new)
    	@player_1 = player_1
    	@player_2 = player_2
    	@board = board
    end

    def current_player
    	@board.turn_count.even? ? @player_1 : @player_2
    end

    def over?
    	self.board.full? || self.won?
    end

    def won?
    	WIN_COMBINATIONS.detect do |array|
      	self.board.cells[array[0]] == self.board.cells[array[1]] && self.board.cells[array[1]] == self.board.cells[array[2]] && (self.board.cells[array[0]]=='X' ||self.board.cells[array[0]]=='O')
    	end
    end

    def draw?
    	self.over? && !self.won?
    end

    def winner
    	if array_won = self.won?
      	self.board.cells[array_won.first]
    	end
    end

    def turn 
    	puts "Please enter 1-9 for your next move:"
    	user_input = current_player.move(self.board)

    	if self.board.valid_move?(user_input)
     		self.board.update(user_input, self.current_player)
     		self.board.display
    	else
    		puts "invalid"
    	  self.turn
    	end
    end

    def play
    	self.board.display
     until self.won? || self.draw?
       self.turn
     end

     puts "Cat's Game!" if self.draw?
     puts "Congratulations #{self.winner}!" if self.won?
   end

end
