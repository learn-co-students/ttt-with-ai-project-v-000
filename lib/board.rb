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

  def taken?(location)
    @cells[location.to_i-1] != " " && @cells[location.to_i-1] != ""
  end

  def full?
    count = 0
    while count < 9
      if taken?(count) == false
        return false
      end
      count += 1
    end
    return true
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index.to_i)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
