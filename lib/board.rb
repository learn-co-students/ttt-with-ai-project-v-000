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

  def position(idx)
    cells[idx.to_i-1]
  end

  def full?
    i = 1
    while i < 10
      if self.position(i) == " "
        return false
      else i += 1
      end
    end
    return true
  end

  def turn_count
    i = 1
    count = 0
    while i < 10
      if self.position(i) == " "
        i += 1
      else
        count += 1
        i += 1
      end
    end
    count
  end

  def taken?(idx)
    idxx = idx.to_i - 1
    if cells[idxx] != " "
      return true
    else
      false
    end
  end

  def valid_move?(idx)
    idxx = idx.to_i - 1
    if idxx > 9 || idxx < 0
      false
    elsif self.taken?(idx)
      false
    else true
    end
  end

  def update(idx, player)
    cells[idx.to_i-1] = player.token
  end

end
