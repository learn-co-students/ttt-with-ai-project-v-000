class Board
  attr_accessor :cells

  def initialize
    self.reset!
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
    index = input.to_i - 1
    self.cells[index]
  end

  def update(location,player)
    self.cells[location.to_i-1] = player.token if self.valid_move?(location)
    location
  end

  def taken?(location)
    self.position(location) != " "
  end

  def valid_move?(location)
    !self.taken?(location) && location.to_i.between?(1,9)
  end

  def full?
    self.cells.none?{|cell| cell == " "}
  end

  def turn_count
    count = self.cells.count do |cell|
      cell != " "
    end
  end


end
