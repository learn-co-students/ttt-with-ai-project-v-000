class Board
  attr_accessor :cells
  def initialize(cells = [" "," "," "," "," "," "," "," "," "])
    @cells = cells
  end
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  def position(input)
    input = input.to_i
    input -= 1
    return self.cells[input]
  end
  def full?
    self.cells.each do |cell|
      if cell == " "
        return false
      end
    end
    return true
  end
  def turn_count
    filled = self.cells.select{ |filled| filled == "X" || filled == "O"}
    return filled.count
  end
  def taken?(input)
    input = input.to_i
    input -= 1
    if self.cells[input] == " "
      return false
    else
      return true
    end
  end
  def valid_move?(input)
    position = input.to_i
    if position > 9 || position < 1
      return false
    elsif taken?(input) == true
      return false
    else
      return true
    end
  end
  def update(input, player)
    input = input.to_i
    input -= 1
    self.cells[input] = player.token
  end
end
