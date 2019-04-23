class Board
  attr_accessor :cells
    
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end
  
  def cells
    @cells
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    index = input.to_i - 1
    @cells[index]
  end
  
  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end
  
  def turn_count
    count = 9 - @cells.count(" ")
    count
  end
  
  def taken?(input)
    index = input.to_i - 1
    if @cells[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(input)
    if input.to_i >= 1 && input.to_i <= 9 && taken?(input) == false
      true
    else
      false
    end
  end
  
  def update(input, player)
    index = input.to_i - 1
    @cells[index] = "#{player.token}"
  end
    
end