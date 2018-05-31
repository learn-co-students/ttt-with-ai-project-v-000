class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells.clear
    self.cells = Array.new(9, " ")
    return cells
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    return self.cells[index]
  end

  def full?
    self.cells.all? { |cell| cell != " "}
  end

  def turn_count
    occupied = 0
    self.cells.each do |cell|
      if cell != " "
        occupied += 1
      end
    end
    return occupied
  end

  def taken?(input)
    index = input.to_i - 1
    self.cells[index] == 'X' || self.cells[index] == 'O' ? true : false
  end

  def valid_move?(input)
    index = input.to_i - 1
    return false if index < 0 || index > 8
    self.taken?(input) ? false : true
  end

  def update(input, player)
    index = input.to_i - 1
    self.cells[index] = player.token
  end
end
