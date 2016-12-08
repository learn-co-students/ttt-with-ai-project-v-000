class Board

  attr_accessor :cells

  def initialize
    self.reset! #set the @cells property to an empty board
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

  def position(cell)
    get_cell = cell.to_i - 1
    @cells[get_cell]
  end

  def full?
    if cells.all? {|cell| cell != " "} then
      return true
    else
      return false
    end

  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(location)
    location = location.to_i - 1
    !(@cells[location].nil? || @cells[location] == " ")
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !taken?(location)
  end

  def update(index, player)
    index = index.to_i - 1
    @cells[index] = player.token
  end

end
