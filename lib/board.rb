class Board
	attr_accessor :cells
	def initialize
	reset!

	end # end of initialize method 
#position
	def position(user_input)
  	cells[user_input.to_i - 1]
	end
	
#update
	def update(input, player)
		cells[input.to_i-1] = player.token
	end




#reset!
	def reset!
		@cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

#Display method
	def display
	  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
	  puts "-----------"
	  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
	  puts "-----------"
	  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

#Valid move
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

#Turn count
	def turn_count
		cells.count{|token| token == "X" || token == "O"}
	end


#full
	def full?
	  cells.all?{|token| token == "X" || token == "O"}
	end
  #taken
  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end #end of position_taken?


end #closes the class