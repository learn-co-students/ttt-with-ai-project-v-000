class Board

	attr_accessor :cells

	def initialize
	   @cells = [" "," "," "," "," "," "," "," "," "]
	end

	def reset!
		@cells = [" "," "," "," "," "," "," "," "," "]
	end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def full?
    @cells.none?{|i| i==" "}
  end

  def position(input)
  	@cells[input.to_i - 1]
  end

  def turn_count
  	count = 0
  	@cells.each do |cell|
  		if cell != " "
  			count += 1
  		end
  	end
  	return count
  end

  def taken?(input)
  	if @cells[input.to_i - 1] != " "
  		true
  	else
  		false
  	end
  end


  def valid_move?(input)
  	if (input.to_i) < 1 ||  (input.to_i) > 9 || taken?(input)
  		false
  	else
  		true
  	end
  end

  def update(input, player)
  	ind = input.to_i - 1
  	@cells[ind] = player.token
  end



end
