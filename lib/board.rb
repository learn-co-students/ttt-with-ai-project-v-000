class Board
	attr_accessor :cells

  def initialize(cells=nil)
  	@cells = cells || Array.new(9, " ")
  end

	def reset!
		@cells = [" "," "," "," "," "," "," "," "," "]
	end

	def display
		spacing = "                "
		puts ""
		puts "#{spacing} #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "#{spacing}-----------"
		puts "#{spacing} #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "#{spacing}-----------"
		puts "#{spacing} #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
		puts ""
	end

	def position(pos)
		pos = pos.to_i
		@cells[pos-1]
	end

	def full?
		@cells.include?(nil || " ") ? false : true
	end

	def turn_count
		@cells.count{|x| x == "X" || x == "O"}
	end

	def taken?(pos)
		pos = pos.to_i
		@cells[pos-1] != (nil || " ") ? true : false
	end

	def valid_move?(pos)
		pos = pos.to_i
		!taken?(pos) && pos.between?(1,9) ? true : false
	end

	def update(pos, player)
		pos = pos.to_i
		@cells[pos-1] = player.token
	end
end