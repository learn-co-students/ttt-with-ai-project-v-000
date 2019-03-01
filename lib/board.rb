require 'pry'
class Board
  
  attr_accessor :cells  


  def initialize
    self.reset!
  end

  def cells
    @cells
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    #binding.pry
    @cells[input.to_i - 1] 
  end

  def full?
    if @cells.count("X") + @cells.count("O") == 9
      true
    else false 
    end 
  end

  def turn_count
     @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    if cells[input.to_i - 1] == "X" || cells[input.to_i - 1] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    if input.to_i > 0 && input.to_i < 10
      if taken?(input) == false
        return true
      else
        return false
      end
    else
      return false
    end
  end
  
  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end 
end

