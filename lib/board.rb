class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    occupied = 0

    self.cells.each do |cell|
      occupied += 1 if cell.include?("X") || cell.include?("O")
    end

    occupied == 9
  end

  def turn_count
    occupied = 0

    self.cells.each do |cell|
      occupied += 1 if cell.include?("X") || cell.include?("O")
    end

    occupied
  end

  def taken?(position)
    position(position) == "X" || position(position) == "O"
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end

  def update(pos, player)
    index = pos.to_i - 1
    self.cells[index] = player.token
  end
end
