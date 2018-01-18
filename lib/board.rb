class Board
#rspec --fail-fast
  attr_accessor :cells
  attr_reader

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," ",]
  end

  def reset!
     self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts (" #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} ")
    puts ("-----------")
    puts (" #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} ")
    puts ("-----------")
    puts (" #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} ")
  end

  def position(position)
    self.cells[position.to_i - 1]
  end

  def full?
    self.cells.none? { |p| p == " " }
  end

  def turn_count
    self.cells.count {|t| t == "X" || t == "O"}
  end

  def taken?(i)
    self.position(i) == "X" || self.position(i) == "O" ? true : false
  end

  def valid_move?(i)
    i = i.to_i
    !self.taken?(i) && i.between?(1,9) ? true : false
  end

  def update(pos,player)
    pos = pos.to_i
    valid_move?(pos) ? self.cells[pos - 1] = player.token : nil
  end

end
