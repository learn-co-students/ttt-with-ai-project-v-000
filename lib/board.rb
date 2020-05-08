class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    cells.detect {|c| c == " " || c == ""} ? false : true

  end

  def turn_count
    cell_count = cells.select {|c| c == "X" || c == "O"}
    cell_count.size
  end

  def taken?(input)
    if cells[input.to_i-1] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1,9) && !taken?(input)
      return true
    else
      return false
    end
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end
end
