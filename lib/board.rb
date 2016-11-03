require 'pry'

class Board
  attr_accessor :cells

  def initialize
	  reset! 
  end

  #Reset the arrary to 9 blank strings
	def reset!
		@cells = Array.new(9, " ")
	end

  #Display the board with blank strings
  def display
  	puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #Find an element at certain index in the @cells array
  def position(index)
    @cells[index.to_i-1] 
  end

  #Check if the entier @cells array occupied 
  def full?
  	@cells.all?{ |cell| cell == "X" || cell == "O"}
  end

  #Count the number of turns that has been played
  def turn_count
  	count = @cells.select{ |cell| cell == "X" || cell == "O" }
  	count.size  
  end

  #Check if a certain position(at index number) is occupied with either "X" or "O"  
  def taken?(index)
  	@cells[index.to_i-1] == "X" || @cells[index.to_i-1] == "O"
  end

  #Making sure the user making valid move to the right place
  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end

  #Update the @cells array with the current state
  def update(index, current_player)
    @cells[index.to_i-1] = current_player.token
  end

end




