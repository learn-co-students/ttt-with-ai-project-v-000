class Board

  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def position(input)
    self.cells[input_to_index(input)]
  end

  def taken?(index)
    !(self.cells[input_to_index(index)].nil? || self.cells[input_to_index(index)] == " ")
  end

  def full?
    index = 0
    while index<8
      if taken?(index) == false
        return false
      else
        index+= 1
      end
    end
    return true
  end

  def turn_count
    counter = 0
    self.cells.each do |place|
      if place == "X" || place== "O"
        counter+=1
      end
    end
      return counter
  end

  def valid_move?(index)
    if index.to_i.to_s != index
      false
    elsif taken?(index) == false && index.to_i.between?(0,8) == true
      true
    elsif taken?(index) == true || index.to_i.between?(0,8) == false
      false
    end
  end

  def token(player)
    "X"
  end 

  def update(input, player)
    self.cells[input_to_index(input)] = token(player)
  end

end
