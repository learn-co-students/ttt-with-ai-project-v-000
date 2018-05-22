require 'pry'

class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def update(input, player)
    if valid_move?(input)
      index = input.to_i - 1
      @cells[index] = player.token
    end
  end
    
  
    
  
  def position(user_input)
    @cells[user_input.to_i - 1]
  end
  
  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end
  
  def valid_move?(input)
    input.to_i.between?(1, 9) && taken?(input) == false
  end
  
  def taken?(input)
    index = input.to_i - 1
    !(@cells[index].nil? || @cells[index] == " ")
  end
  
  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts
  end
end