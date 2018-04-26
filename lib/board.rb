
class Board
  attr_accessor :cells

  def initialize
    self.reset!

  end

  def reset!
    self.cells = [" "] * 9
  end

  def display
    d = self.cells

    puts "-----------"
    puts " #{d[0]} | #{d[1]} | #{d[2]} "
    puts "-----------"
    puts " #{d[3]} | #{d[4]} | #{d[5]} "
    puts "-----------"
    puts " #{d[6]} | #{d[7]} | #{d[8]} "
    puts "-----------"
  end

  def position(location)
    c = self.cells

    c[location.to_i - 1]
  end

  def turn_count
    c = self.cells

    c.select{|e| e.strip != ""}.size
  end

  def full?
    count = self.turn_count
    count == 9
  end

  def taken?(location)
    c = self.cells

    c[location.to_i - 1].strip != ""
  end

  def valid_move?(location)
    possible = location.strip.scan(/^[1-9]$/).length > 0

    return nil if !possible

    idx = location.strip.to_i - 1
    c = self.cells
    c[idx].strip == ""
  end

  def update(location, player)
    c = self.cells
    return nil if !valid_move?(location)

    idx = location.to_i - 1

    c[idx] = player.token
  end
end
