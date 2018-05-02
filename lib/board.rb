require "pry"
class Board
  attr_accessor :cells
  attr_reader :display
  
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n\n"
  end
  
  def reset! 
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def position(user_input)
    self.cells[user_input.to_i-1]
  end
  
  def full?
    if self.cells.include?(" ")
      false 
    else
      true
    end
  end
  
  def turn_count
    array = []
    self.cells.each do |cell|
      if cell == "X" || cell == "O"
        array << cell 
      end
    end
    array.length
  end
  
  def taken?(input)
    if self.cells[input.to_i-1] != " "
      true 
    else 
      false 
    end
  end
  
  def valid_move?(input)
    if self.taken?(input.to_i) == false && input.to_i.between?(1,9)
      true 
    else
      false
    end
  end
  
  def update(position, player)
    position_number = position.to_i-1
    token = player.token 
    self.cells[position_number] = token
  end
  
end