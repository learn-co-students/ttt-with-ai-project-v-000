require 'pry'
class Board
  
  attr_accessor :board, :cells
  
  def initialize
    reset!
  end
  #why is this reset! ?  how will this create a new instance?  Does it already have a board defined?
  
  def reset!
    @cells = Array.new(9, " ")
    #binding.pry
    # I was originally doing 
    #cells.clear
    #cells = Array.new(9, " ")
    #did this fail because I was calling on the cells object?  Class?  If I don't have an initialize method it's ok to use an instance var to perform the behavior?  I hope I'm even asking this question correctly.
  end
  
  def display
      puts "  #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts " ----------- "
      puts "  #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts " ----------- "
      puts "  #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(user_input)
    cells[user_input.to_i - 1]
  end
  
  def full?
    cells.all?{|square| square != " " }
  end
  
  def turn_count
    cells.count{|square| square != " " }
  end
  
  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end
  
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
  
  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end