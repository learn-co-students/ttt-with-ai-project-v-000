class Board
  attr_accessor :cells

  def initialize
    # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    self.reset!
  end

  def position(position_number)
     self.cells[position_number.to_i-1]
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.position("1")} | #{self.position("2")} | #{self.position("3")} "
    puts "-----------"
    puts " #{self.position("4")} | #{self.position("5")} | #{self.position("6")} "
    puts "-----------"
    puts " #{self.position("7")} | #{self.position("8")} | #{self.position("9")} "
  end

  def full?
    self.cells.all? {|character| character == "X" || character == "O"}
  end

  def turn_count
    cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(position_number)
    self.position(position_number) == "X" || self.position(position_number) == "O"
  end

  def valid_move?(position_number)
    !self.taken?(position_number) && position_number.to_i.between?(1, 9)
  end

  def update(position_number, player)
    index = position_number.to_i - 1
    self.cells[index] = player.token
    self.display
  end

  def available_positions
    positions_available = []
    self.cells.each_with_index do |cell, index|
      position = (index + 1).to_s
      if !taken?(position) # && !positions_available.include?(position) # not needed because of ".uniq" addition below
        positions_available << position
      end
    end
    positions_available.uniq
  end

  def random
    self.available_positions.sample
  end

end
