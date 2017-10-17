class Board
attr_accessor :cells, :display

  def initialize
    self.reset!
    #self.display
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
    self.cells[(input.to_i)-1]
  end

  def update(input, player)
    if valid_move?(input)
      self.cells[(input.to_i)-1] = player.token
    end
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O" }
  end

  def turn_count
    self.cells.select do |cell|
      cell == "X" || cell == "O"
    end.count
  end

  def taken?(input)
    self.position(input) != " "
  end

  def valid_move?(input)
    return true if input.to_i.between?(1, 9) && self.taken?(input) != true
  end

end
