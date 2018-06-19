class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def display
    line = "-----------"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts line
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts line
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    cells.all?{|x| x != " "}
  end

  def turn_count
    cells.count{|x| x!= " "}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end


  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

end
