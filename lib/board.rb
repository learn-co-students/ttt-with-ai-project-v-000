require 'pry'

class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

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

  def position(input)
    location = (input.to_i) - 1
    cells[location]
  end

  def full?
    cells.all? {|space| space == "X" || space == "O"}
  end

  def turn_count
    # cells.count gives you total number of spaces in array (9)
    cells.count {|space_taken| #gives you total number of spaces taken up with X or O
      space_taken == "X" || space_taken == "O"}
  end

  def taken?(location)
    location = (location.to_i) - 1
    cells[location] == nil || cells[location] == " " ? false : true
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !taken?(location) ? true : false
  end

  def update(location, player)
    cells[location.to_i - 1] = player.token
  end

end



