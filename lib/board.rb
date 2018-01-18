class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(position)
    @cells[position.to_i - 1]
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

  def turn_count
    counter = 9 - @cells.count(" ")
  end

  def taken?(position)
    if @cells[position.to_i - 1] == " "
      false
    else
      true
    end
  end

  def valid_move?(position)
    if taken?(position) or position.to_i < 1 or position.to_i > 9
      false
    else
      true
    end
  end

  def full?
    @cells.all? do |position|
      position == "X" || position == "O"
    end
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

end
