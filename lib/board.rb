class Board
	attr_accessor :cells

	def initialize
    reset!
	end

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
   	puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   	puts "-----------"
   	puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   	puts "-----------"
   	puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
   	cells[index.to_i-1]
  end

  def taken?(index)
   	position(index) != " " || position(index) == ""
  end

  def full?
  	@cells.all?{|square| square != " "}
  end

  def turn_count
    @cells.count{|square| square != " "}
  end

  def valid_move?(index)
    !taken?(index) && index.to_i.between?(1,9)
  end

  def update(index, player)
    cells[index.to_i-1] = player.token
  end



end
