class Board
  attr_accessor :cells, :board

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def cells
    @cells
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
  def position(space)
    @cells[space.to_i - 1]
  end
  def full?
    !@cells.include?(" ") ? true : false
  end
  def turn_count
    turncount = 0
    @cells.each do |cell|
      if cell != " "
        turncount += 1
      end
    end
    turncount
  end
  def taken?(space)
    if @cells[space.to_i - 1] == " "
      false
    else
      true
    end
  end
  def valid_move?(space)
    space.to_i.between?(1,9) && !taken?(space)
  end
  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
end
