class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def input_to_index(input)
    "#{input}".to_i - 1
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
  self.cells.all?{|index| index == "X" || index == "O"}
  end

  def turn_count
    counter = 0
    self.cells.each do |index|
      if index == "X" || index == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(index)
    !(self.cells[index.to_i - 1].nil? || self.cells[index.to_i - 1] == " ")
  end

  def valid_move?(index)
    if taken?(index)
      puts "The position must be vacant, not currently taken by a player."
    elsif !(index.to_i - 1).between?(0, 8)
      puts "You must move to a position within the tic-tac-toe board."
    else false
      true
    end
  end

  def update(index, player)
    self.cells[index.to_i - 1] = player.token
  end
end
