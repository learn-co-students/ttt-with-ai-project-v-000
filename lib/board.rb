
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
    pos_i = pos.to_i
    pos_i -= 1
    cells[pos_i]
  end

  def full?
    @cells.each do |is_full|
      if is_full.include?(" ")
        return false
      end
    end
  end

  def turn_count
    count = 0
    @cells.each do |turn|
      if turn.include?("X") || turn.include?("O")
        count +=1
      end
    end
    count
  end

  def taken?(x)
    if position(x) == "X" || position(x) == "O"
      true
    else
      false
    end
  end

  def valid_move?(is_valid)
    if is_valid.to_i.between?(1,9)
      if taken?(is_valid)
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
