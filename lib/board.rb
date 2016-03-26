class Board
  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts row_display(0)
    puts "------------"
    puts row_display(3)
    puts "------------"
    puts row_display(6)
  end

  def row_display(i)
    " #{self.cells[0+i]} | #{self.cells[1+i]} | #{self.cells[2+i]} "
  end

  def full?
    self.cells.none? {|c| c == " "}
  end

  def position(pos)
    self.cells[pos.to_i-1]
  end

  def turn_count
    9 - self.cells.select { |c| c == " "}.count
  end

  def taken?(pos)
    position(pos) == "X" || position(pos) == "O"
  end

  def valid_move?(pos)
    !taken?(pos) && pos.to_i.between?(1,9)
  end

  def update(pos, player)
    self.cells[pos.to_i-1] = player.token if valid_move?(pos)
  end


end
