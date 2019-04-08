class Board
   attr_accessor :cells
   
   def reset!
     @cells = Array.new(9, " " )
   end
   
   def initialize
   reset!
  end
   
  def display
  	puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(input)
     @cells[input.to_i - 1]
  end
  
  def full?
    @cells.include?(" ") ? false : true
  end
  
  def turn_count
     @cells.count {|i| i == "X" || i == "O"}
  end
  
  def taken?(input)
    position(input) == "" || position(input) == " " ? false : true
  end
  
  def valid_move?(input)
   input.to_i.between?(1, 9) && !taken?(input)

    end
  def update(input, player)
      cells[input.to_i - 1] = player.token
  end
  
end