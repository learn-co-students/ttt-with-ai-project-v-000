
class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    reset!
  end
  def cells
    @cells
  end

  def reset!

     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end




  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(pos)
    current_pos = pos.to_i

    cells[current_pos-1]

  end

  def full?
    @cells.each do |is_full|
      if is_full.include?(" ")
        return false
      end
    end
  end

  def turn_count
    # count = 0
    counted = @cells.count{|x| x == " "}

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
