require 'pry'
class Board
	attr_accessor :cells
	
	def initialize
		self.reset!
	end
	
	def reset!
		@cells = Array.new(9, " ")
	end
	
	def display
		row = "-----------"
		i = 0
		3.times do
			puts " #{cells[i]} | #{cells[i+1]} | #{cells[i+2]} "
			puts row if i < 9
			i +=3
		end
	end
	
	def position(user_index)
		cells[user_index.to_i - 1]
	end
	
	def update(user_index, player)
		cells[user_index.to_i - 1] = player.token if valid_move?(user_index)
	end
	
	def full?
		cells.count(" ") == 0
	end
	
	def taken?(user_index)
		cells[user_index.to_i - 1] != " "
	end
	
	def valid_move?(user_index)
		!taken?(user_index) && (1..9).include?(user_index.to_i)
	end
	
	def turn_count
		cells.length - cells.count(" ") 
	end
	
end
