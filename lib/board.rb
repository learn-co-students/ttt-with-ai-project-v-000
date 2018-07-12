class Board
  attr_accessor :cells, :player

  def initialize
    @cells = self.reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #cleaner than writing out and array with 9 spaces
  def reset!
    @cells = Array.new(9, " ")
  end

  def position(space)
    @cells[space.to_i - 1]
  end

  #as soon as cell does not equal " ", the method will return false.
  def full?
   cells.all? {|cell| cell != " "}
  end

  #using count instead of a counter reduces the lines of code needed
  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(space)
    position(space) != " "
  end

  def valid_move?(space)
    space.to_i < 10 && space.to_i > 0 && taken?(space) == false
  end

  def update(space, player)
    @cells[space.to_i - 1] = player.token
  end


end
