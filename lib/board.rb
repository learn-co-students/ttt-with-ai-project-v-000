
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")

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

  def position(pos)
    cells[pos.to_i -1]

  end

  def full?
    @cells.all? do |token|
      token == "X" || token == "O"

    end
  end

  def turn_count

    counted = @cells.count{|x| x == "X" || x == "O"}

    full_count = 9-counted

  end

  def taken?(x)
    if position(x) == "X" || position(x) == "O"
      true
    else
      false
    end
  end

  def valid_move?(is_valid)
    validated = is_valid.to_i

    if validated.between?(1,9)

      if taken?(validated)
        false
      else
        true
      end
    end
  end

  def update(pos, x_or_o)
    pos = pos.to_i
    pos -= 1
    @cells[pos] = x_or_o.token

  end

end
