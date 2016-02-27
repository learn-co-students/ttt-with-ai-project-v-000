class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    cells[position.to_i-1]
  end

  def full?
    cells.include?(" ") ? false : true
  end

  def turn_count
    cells.count("X") + cells.count("O")
  end

  def taken?(position)
    cells[position.to_i-1] == " " ? false : true
  end

  def valid_move?(position)
    if position.match(/[1-9]/)
    taken?(position) ? false : true
    else
      return false
    end
  end

  def update(position, player)
    if valid_move?(position)
      cells[position.to_i-1] = player.token
    end
  end

end