class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} \n-----------\n #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} \n-----------\n #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} \n\n\n"
  end

  def position(move)
    self.cells[move.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select{|a| a != " "}.length
  end

  def taken?(move)
    case self.position(move)
    when "X"
      true
    when "O"
      true
    when " "
      false
    end
  end

  def valid_move?(move)
    move.to_i.between?(1, 9) && !self.taken?(move)
  end

  def update(move, player)
    self.cells[move.to_i - 1] = player.token
  end



end
