class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    index
  end

  def position(input)
    #input = gets.strip.to_i
    cells[self.input_to_index(input)]
  end

  def full?
    if self.cells.any? { |cell| cell == " " }
      false
    else
      true
    end
  end

  def turn_count
    self.cells.select{|cell| cell != " "}.count
  end

  def taken?(input)
    if self.position(input) == " "
      false
    else
      true
    end
  end

  def valid_input?(input)
    if input.to_i >= 1 && input.to_i <= 9
      true
    else
      false
    end
  end

  def valid_move?(input)
    if self.valid_input?(input) && self.taken?(input) == false
      true
    else
      false
    end
  end

  def update(input, player)
    self.cells[self.input_to_index(input)] = player.token
    self.display
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
end
