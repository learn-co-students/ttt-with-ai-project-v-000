class Board
  attr_accessor :cells
  @cells = []

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} " + "|" + " #{cells[1]} " + "|" + " #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} " + "|" + " #{cells[4]} " + "|" + " #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} " + "|" + " #{cells[7]} " + "|" + " #{cells[8]} "
  end

  def position(input)
    return cells[input.to_i - 1]
  end

  def full?
    cells.any? { |cell| cell == " " } ? false : true
  end

  def turn_count
    cells.count { |cell| cell != " " }
  end

  def taken?(input)
    position(input) != " " ? true : false
  end

  def valid_move?(input)
    if input == "invalid"
      return false
    else position(input) == " " ? true : false
    end
  end

  def update(input, object)
    cells[input.to_i - 1] = object.token
  end
end
