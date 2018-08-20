class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    return @cells[pos.to_i - 1]
  end

  def full?
    if @cells.include?(" ")
      return false
    else return true
    end
  end

  def turn_count
    return 9 - @cells.count(" ")
  end

  def taken?(pos)
    if position(pos) == " "
      return false
    else return true
    end
  end

  def valid_move?(inp)
    input = inp.to_i
    if input >= 1 && input <=9 && taken?(input) == false
      return true
    else return false
    end
  end

  def update(input, player)
    if valid_move?(input)
      @cells[input.to_i - 1] = player.token
    end
  end

end
