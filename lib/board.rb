class Board
  attr_accessor :cells
 
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(position)
    position = position.to_i - 1
    @cells[position]
  end

  def full?
    @cells.all? do |cell|
     if cell == " " 
      false
     else 
      true
      end
    end
  end

  def turn_count
    @cells.count {|cell| cell != " "}
  end

  def taken?(position)
    position = position.to_i - 1
    if @cells[position] == " "
      false
    elsif @cells[position] == nil 
      false
    else
      true
    end
  end

  def valid_move?(position)
    position = position.to_i - 1 
  
  if   !position.between?(0, 8)  
   false
  elsif @cells[position] == " "
    true
  end 
end
   
   def update(position, player)
   position = position.to_i - 1
   @cells[position] = player.token
   end

end


