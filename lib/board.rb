class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts
  end
  
  def position(input)
    @cells[input.to_i - 1]
  end
  
  def turn_count
    @cells.select {|i| i == "X" || i == "O"}.length
  end
  
  def full?
    @cells.include?(" ") ? false : true
  end
  
  def taken?(input)
    position(input) == "" || position(input) == " " ? false : true
  end
  
  def valid_move?(input)
    if input.to_i.between?(1,9)
      taken?(input) ? false : true
    else
      false
    end
  end
  
  def update(input,player)
    unless valid_move?(input) == false
       @cells[input.to_i - 1] = player.token
    end
  end
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end  

end