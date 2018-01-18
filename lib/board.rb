class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(number)
    position =  number.to_i - 1
    return @cells[position]

  end
  def full?
    @cells.each do |position|
      if position == " "
        return false
      end
    end

  end
  def turn_count
    x = 0
    @cells.each do |position|
      if position == "X" || position == "O"
        x+=1
      end
    end
    return x
  end
  def taken?(position)
    index = position.to_i - 1
    if @cells[index] == "X" || @cells[index] == "O"
      return true
    else
      return false
    end

  end
  def valid_move?(input)
    if input =~ /[^1-9]/
      return false
    end
    unless taken?(input)
      return true
    end
  end
  def update(number,player)
    new_number = number.to_i 
    input = new_number - 1 
    
    self.cells[input] = player.token
    
  end

end
