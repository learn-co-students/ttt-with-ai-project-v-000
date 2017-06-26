class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    self.cells[pos.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    counter = 0
    self.cells.each do |cell|
      if cell == 'X' || cell == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(pos)
    self.cells[pos.to_i - 1] != " "
  end

  def valid_move?(pos)
    pos.to_i.between?(1, 9) && !self.taken?(pos)
  end

  def update(pos, player)
    self.cells[pos.to_i - 1] = player.token
  end

end
