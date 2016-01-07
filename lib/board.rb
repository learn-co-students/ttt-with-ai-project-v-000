class Board
	attr_accessor :cells
	def initialize
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(user_input_string)
		cells[user_input_string.chomp.to_i - 1] # user is entering 1-9.  posiitons are 0-8
	end

	def update(position_arg, player_object)
	#update board when player makes a move
		#need a player object to complete method
		#call token on player
	end

	def full?
		if cells.any? {|cell| cell.strip.empty?}
			false
		else
			true
		end
	end

	def turn_count
		count = 0
		cells.each do |cell|
			unless cell.strip.empty?
				count += 1
			end
		end
		count
	end

	def taken?(input)
		if cells[input.to_i - 1].strip.empty?
			false
		else
			true
		end
	end

	def valid_move?(input)
		if taken?(input)
			false
		elsif (1..9).include?(input.to_i)
			true
		else
			false
		end
	end


  def update(position, player)
    @cells[position.to_i-1]=player.token
  end




end

# a = Board.new
# print a.full?