class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
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

  def position(pos)
    cell_value = self.cells[pos.to_i-1]
    return cell_value
  end

  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.count {|cell| (cell == "X") || (cell == "O")}
  end

  def taken?(pos)
    if self.cells[pos.to_i-1] == "X"
      return true
    elsif self.cells[pos.to_i-1] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(pos)
    (taken?(pos) == false) && (pos.to_i.between?(1, 9)) ? true:false
  end

  def update(pos, player)
    self.cells[pos.to_i-1] = player.token 
  end

end
