class Board
  attr_accessor :cells
  
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
  
  def position(cell)
    index = cell.to_i - 1
    cells[index]
  end
  
  def full?
   cells.all?{|full| full == "X" || full == "O"}
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end
  
  def taken?(cell)
    if position(cell) == "X" || position(cell) == "O"
      true 
    elsif position(cell) == " "
      false
    end
  end
  
  def valid_move?(cell)
    cell.to_i.between?(1,9) && !taken?(cell)
  end
  
  def update(cell, player)
    cells[cell.to_i-1] = player.token
  end
end