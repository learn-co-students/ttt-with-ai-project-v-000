require "pry"


class Board 
  attr_accessor :cells 
  
  cells = []
  
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
  
  def input_to_index(input)
index = input.to_i - 1
end
  
  def position(string_number)
    return "#{@cells[string_number.to_i - 1]}"
  end 
  
  def full? 
  @cells.none? {|i| i == " "}
  end
  
  def turn_count
    counter = 0
  @cells.each do |token|
   
  if token == "X" || token == "O"
    counter += 1 
  end
  end 
  return counter
end

def taken?(index)
  !(@cells[index.to_i - 1].nil? || @cells[index.to_i - 1] == " ")
end

def valid_move?(string_number)
  index = string_number.to_i - 1 
  index.between?(0, 8) && !taken?(string_number)
end

def update(position, player)
  index = position.to_i 
   @cells[position.to_i - 1] = player.token
 
end 
end 