class Board
  attr_accessor :cells

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]

  end

  def initialize
    self.reset!
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "------------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "------------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(pos_num)
    index = pos_num.to_i - 1
    self.cells[index]
  end

  def full?
    if self.cells.include?(" ") == true
      false
    else
      true
    end
  end

  def turn_count
    count = 0
    self.cells.map { |cell| count += 1 unless cell == " " }
    count
  end

  def taken?(pos_num)
    index = pos_num.to_i - 1
    if self.cells[index] != " "
      true
    else
      false
    end
  end

  def valid_move?(pos_num)
    if pos_num.to_i <= 9 && 1 <= pos_num.to_i
      taken?(pos_num).!
    else
      false
    end
  end

  def update(pos_num, player)
    index = pos_num.to_i - 1
    self.cells[index] = player.token
  end
end
