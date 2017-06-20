class Board
  attr_accessor :cells
  attr_reader :center, :corners, :sides

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end
 
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    cells[input.to_i - 1]
  end
  
  def full?
    cells.all?{|c| c != " "}
  end
  
  def turn_count
    cells.count{|c| c != " "}
  end
  
  def taken?(input)
    case position(input)
    when "X", "O"
      true
    else
      false
    end
  end
  
  def valid_move?(input)
    input.to_i.between?(1,9) && ! taken?(input)
  end
  
  def update(loc, player)
    cells[loc.to_i - 1] = player.token
  end
  

end

