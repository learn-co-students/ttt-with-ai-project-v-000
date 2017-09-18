class Board
  attr_accessor :cells

  # Initialize #

  def initialize
    reset!
  end

  # Instance Methods #

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end



  def token

  end

  def update(position, token)

  end

   def full?
     !@cells.include?(" ")
   end

   def turn_count

   end

   def taken?

   end

   def valid_move?

   end



end
