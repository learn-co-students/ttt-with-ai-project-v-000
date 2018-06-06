
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts  "-----------"
    puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos_num)
    @cells[pos_num.to_i-1] if pos_num.to_i != 0
  end

  def full?
    @cells.all? {|position| position == "X" or position == "O"}
  end

  def turn_count
    @cells.count {|position| position == "X" or position == "O"}
  end

  def taken?(pos_num)
    if position(pos_num) == " " or position(pos_num) == ""
      false
    else
      true
    end
  end

  def valid_move?(pos_num)
    if taken?(pos_num) == false and pos_num.to_i.between?(1,9) == true
      true
    else
      false
    end
  end

  def update(pos_num, player)
    if valid_move?(pos_num)
      @cells[pos_num.to_i-1] = player.token
    end
  end

end
