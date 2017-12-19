class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
    # self.reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    position = input.to_i - 1
    cells[position]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    self.position(input) != " " ? true : false
  end

  def valid_move?(input)
    input_value = input.to_i
    if input_value.integer? && input_value > 0 && input_value < 10
      (taken?(input) || full?) ? false : true
    end
  end

  def update(input, player)
    position = input.to_i - 1
    if valid_move?(input)
      self.cells[position] = player.token
    end
  end

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end
end
