class Board
  attr_accessor :cells


  def initialize(cells)
    @cells = cells
    reset!(cells)
  end




  # Instance Methods #

  def reset!(cells)
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts cells
  end

  def position(input)
    input = gets.strip
     if input.include?(1...9)

     end

   end

   def token

   end

   def update(position, token)

   end

   def full?
     board.none? {|el| el === " "}
   end

   def turn_count

   end

   def taken?
    
   end

   def valid_move?

   end



end
