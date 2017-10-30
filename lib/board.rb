class Board

  attr_accessor :cells
  attr_reader :token

  def initialize
    @cells = cells
    @cells = Array.new(9," ")
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(value)
    newvalue = value.to_i - 1
    return @cells[newvalue].to_str
  end

  def full?
    @cells.all? do |spot|
      spot == "X" || spot == "O"
    end
  end

  def turn_count
    counter = 0
    @cells.each do |spot|
      if spot == "" || spot == " "
      counter += 0
      else
        counter += 1
      end
    end
   counter
  end

  def taken?(place)
    if self.position(place) == "O" || self.position(place) == "X"
      true
    else
      false
    end
  end

  def valid_move?(move)
    move.to_i.between?(1,9) && !self.taken?(move.to_i)
  end

  def update(position, player)
    spot = position.to_i - 1
    @cells[spot] = player.token
  end
end
