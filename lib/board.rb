class Board

  attr_accessor :cells
  def initialize
    reset!
  end

  def display
    puts row_1 = " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts row_2 = "-----------"
    puts row_3 = " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts row_4 = "-----------"
    puts row_5 = " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i-1]
  end

  def full?
    if !self.cells.detect{|empty| empty == nil || empty == "" || empty == " "}
      return true
    else
      return false
    end
  end


  def turn_count
    self.cells.count{|token| token == "X" || token == "O"}
  end


  def taken?(position)
    if self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
      true
    else
      false
    end
  end


  def valid_move?(position) #.to_i
    true if position.to_i.between?(1, 9) && !taken?(position)
  end

  def update(position, player) #.to_i
    self.cells[position.to_i-1] = player.token
  end

  def reset!
   @cells = [" "," "," "," "," "," "," "," "," "]
  end
end
