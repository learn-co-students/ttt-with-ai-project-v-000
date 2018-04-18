class Board 
  attr_accessor :cells, :token
  def initialize
    reset!
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
  
  def position(num)
    number = num.to_i - 1
    if number.between?(0,8)
    cells[number]
    end
  end
  
  def full?
    @cells.all? do |space|
      space != " "
    end
  end
  
  def turn_count 
    count = 0 
    @cells.each do |space|
      if space == "X" || space == "O"
        count = count + 1
      end
    end
    count 
  end
  
  def taken?(num)
    number = num.to_i - 1
    if number <= 8 && number >= 0
    if cells[number] == "X" || cells[number] == "O"
      return true 
    else 
      false 
      end
    end
  end
  
  def valid_move?(num)
    number = num.to_i - 1
    if @cells[number] == " " && number.between?(0,8)
    return true
    end
  end
  
  def update(input, player)
    number = input.to_i - 1 
      @cells[number] = player.token
  end
    
    
  
  
  
end