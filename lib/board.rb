class Board
  attr_accessor :cells, :game, :player

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    self.cells.all? do |token|
      token == "X" || token == "O"
    end
  end

  def turn_count
    i = 0
    self.cells.each do |token|
      if token == "X" || token == "O"
        i += 1
      end
    end
    i
  end

  def taken?(index)
    index = index.to_i - 1
    self.cells[index] == "X" || self.cells[index] == "O"
  end

  def valid_move?(index)
    index = index.to_i
    self.taken?(index) == false && index < 10 && index > 0
  end

  def update(index, player)
    index = index.to_i - 1
    self.cells[index] = player.token
  end

end
