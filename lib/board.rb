class Board
  attr_accessor :cells, :turn_count
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
  def position(num)
    @cells[num.to_i - 1]
  end
  def full?
    if @cells.include?(" ")
      return false
    else
      return true
    end
  end
  def turn_count
    a = @cells.select {|cells| cells == " "}
    @turn_count = 9 - a.size
  end
  def taken?(num)
    num = num.to_i
    num -= 1
    if @cells[num] == " "
      false
    else
      true
    end
  end
  def valid_move?(num)
    num = num.to_i
    num -= 1
    num >= 0 && num <= 8 && !taken?(num+1)
  end
  def update(num, player)
    num = num.to_i
    num -= 1
    @cells[num] = player.token
  end
end
