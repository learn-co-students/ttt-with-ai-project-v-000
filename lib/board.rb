class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = [
        " ", " ", " ",
        " ", " ", " ",
        " ", " ", " ",
      ]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[(input.to_i)-1]
  end

  def full?
    self.cells.none?{|cell| cell == " "}
  end

  def valid_move?(input)
    self.cells[(input.to_i)-1] == " " && input.to_i.between?(1,9)
  end

  def turn_count
    count = 0
    self.cells.each do |cell|
      count += 1 if cell == "X" || cell == "O"
    end
    return count
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O" ? true : false
  end

  def update(input, player)
    self.cells[(input.to_i)-1] = "#{player.token}"
    
  end

end