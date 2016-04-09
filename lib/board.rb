class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    horiz_line = "-----------"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts horiz_line
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts horiz_line
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(position)
    index = position.to_i - 1
    self.cells[index]
  end

  # Accepts position as a player-perspective string (1-9)
  def update(position, player)
    # put player.token in the correct position
    self.cells[position.to_i - 1] = player.token
  end

  def full?
    self.cells.all? do |element|
      element != " " && element != "" && element != nil
    end
  end

  def turn_count
    counter = 0
    self.cells.each do |element|
      counter += 1 if element != " " && element != "" && element != nil
    end
    counter
  end

  # Accepts a player-perspective position as a string (1-9).  Casts it .to_i internally
  def taken?(position)
    current = self.cells[position.to_i - 1]
    return true if current != " " && current != ""
    return false
  end

  # accepts a player-perspective position (1-9) as a string
  def valid_move?(position)
    # Pass the user input (not the offset index value) to taken?
    return true if !taken?(position) && position.to_i.between?(1, 9)
    return false
  end

  def valid_moves
    (1..9).select do |cell|
      !self.taken?(cell)
    end
  end

end
