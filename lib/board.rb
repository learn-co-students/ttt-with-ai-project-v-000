class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end

  def taken?(input)
    self.position(input) != " "
  end

  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !self.taken?(input)
  end

  def full?
    (1..9).to_a.all? {|i| self.taken?(i)}
  end

  def turn_count
    count = 0
    #@cells.each do |cell|
    #  if cell != " "
    #    count += 1
    #  end
    #end
    (1..9).to_a.each do |i|
      if self.taken?(i)
        count += 1
      end
    end
    count
  end

end
