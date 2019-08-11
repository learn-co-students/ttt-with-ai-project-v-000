class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    #
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "--------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "--------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}

  end

  def position(string)
    self.cells[string.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    # 9 - self.cells.count(" ")
    self.cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(string)
    !(self.position(string) == " ")
  end

  def valid_move?(string)
    string.to_i.between?(1,9) && !self.taken?(string)
  end

  def update(string, player_obj)
    self.cells[string.to_i - 1] = player_obj.token
  end
end
