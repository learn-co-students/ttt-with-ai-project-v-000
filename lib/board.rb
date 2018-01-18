class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i - 1
    @cells[input]
  end

  def turn_count
    @cells.count { |x| x == "X" || x == "O" }
  end

  def taken?(location)
    location = location.to_i - 1
    !(@cells[location].nil? || @cells[location] == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(location, current_player)
    @cells[location.to_i - 1] = current_player.token
  end

  def full?
    @cells.all? { |cell| cell == "X" || cell == "O"} ? true : false
  end
end
