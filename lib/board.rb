  class Board
    attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    count = 0
    @cells.each  { |xo|
      if xo == "X" || xo == "O"
        count += 1 
      end}
      count
  end

  def taken?(space)
     if (@cells[space.to_i - 1] == "X" || @cells[space.to_i - 1] == "O")
       TRUE
     else
       FALSE
     end
  end

  def valid_move?(move)
    !taken?(move) && move.to_i.between?(1,9)
  end 

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

end