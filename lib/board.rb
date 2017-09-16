class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
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

  def position(location)
    @cells[location.to_i-1]
  end

  def position_taken?(location)
    @cells[location] != " " && @cells[location] != ""
  end

  def full?
    count = 0
    while count < 9
      if position_taken?(count) == false
        return false
      end
      count += 1
    end
    return true
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

end
