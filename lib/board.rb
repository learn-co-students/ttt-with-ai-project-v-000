class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    @cells.all?{|elements| !(elements == " " || elements == nil)}
  end

  def turn_count
    counter = 0
      @cells.each do |move|
      if (move == "X" || move == "O")
        counter += 1
      end
    end
    return counter
  end

  def taken?(location)
    @cells[location.to_i-1] != " " && @cells[location.to_i-1] != ""
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !taken?(location)
  end

  def update(location, player)
    @cells[location.to_i-1] = player.token
  end

end