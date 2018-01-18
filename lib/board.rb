class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    self.cells.clear
    @cells = Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    cells[position.to_i - 1]
  end

  def full?
    self.cells.any?{|cell| cell == " "} == false ? true : false
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    self.position(position) == " " ? false : true
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !self.taken?(position) ? true : false
  end

  def update(position, player)
    if self.valid_move?(position)
      self.cells[position.to_i - 1] = player.token
    end
  end

end
