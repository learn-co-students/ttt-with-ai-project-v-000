require 'pry'
class Board
  attr_accessor :cells
  
  def initialize
    reset!
  end

  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display

    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    index = (input.to_i - 1)
    @cells[index]
  end
    
  def full?
    @cells.all? {|c| c == "X" || c == "O"}
  end
  
  def turn_count
    turns = 0
    @cells.each do |c|
      if c== "X" || c == "O"
        turns += 1
      end
    end
    turns
  end
  
  def taken?(input)
    index = (input.to_i - 1)
    !(@cells[index] == " " || @cells[index] == "" || @cells[index] == nil)
  end
  
  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end
  
  def update(input, player)
      @cells[input.to_i - 1] = player
  end
end