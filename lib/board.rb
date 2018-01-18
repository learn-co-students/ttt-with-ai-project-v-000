class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    print " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    print "-----------"
    print " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    print "-----------"
    print " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(cell_num)
    return cells[cell_num.to_i - 1]
  end

  def full?
    if cells.include?(" ")
      return false
    else
      return true
    end
  end

  def turn_count
    count = 0
    cells.each do |cell|
      if cell != " "
        count += 1
      end
    end
    return count
  end

  def taken?(cell_num)
    if cells[cell_num.to_i - 1] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(cell_num)
    if (cell_num.to_i >= 1 && cell_num.to_i <= 9) && taken?(cell_num) == false
      return true
    else
      return false
    end
  end

  def update(cell_num, player)
    cells[cell_num.to_i - 1] = player.token
  end
end
