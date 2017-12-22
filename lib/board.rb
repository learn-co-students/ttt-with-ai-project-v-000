class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def undo(space)
    @cells[space-1] = " "
  end

  def display
    b = @cells
    puts "-----------"
    puts " #{b[0]} | #{b[1]} | #{b[2]} "
    puts "-----------"
    puts " #{b[3]} | #{b[4]} | #{b[5]} "
    puts "-----------"
    puts " #{b[6]} | #{b[7]} | #{b[8]} "
    puts "-----------"
  end

  def position(input)
    i = input.to_i
    return @cells[i-1]
  end

  def full?
    return false if @cells.any? { |c| c == " " }
    return true
  end

  def turn_count
    @cells.count {|x| x != " "}
  end

  def taken?(input)
    return true if position(input) != " "
    return false if position(input) == " "
  end

  def valid_move?(input)
    i = input.to_i
    if i >= 1 && i <= 9 && taken?(input) == false
      return true
    else
      return false
    end
  end

  def update(input, player)
    i = input.to_i
    self.cells[i-1] = player.token
  end

  def available_moves
    available = []
    @cells.each_index do |i|
      available << (i+1) if (valid_move?(i+1))
    end
    available
  end
end
