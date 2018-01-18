class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(num)
    num = num.to_i
    cells[num-1]
  end

  def full?
    value = true
    cells.each do |cell|
      if cell == " "
        value = false
      end
    end
    return value
  end

  def turn_count
    value = 0
    cells.each do |cell|
      if cell != " "
        value +=1
      end
    end
    return value
  end

  def taken?(num)
    value = false
    if position(num) == "X" || position(num) == "O"
      value = true
    end
    return value
  end

  def valid_move?(num)
    value = false
    if num.class != Fixnum
      num = num.to_i
    end
    if num <= 9 && num >= 1
      value = true
     end
    if full? || taken?(num)
      value = false
    end
    return value
  end

  def update(num, player)
    if valid_move?(num)
      num = num.to_i
      @cells[num-1] = player.token
    end
  end



end
