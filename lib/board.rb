class Board

  attr_accessor :cells

  def initialize
    reset!
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
    cells.all? do |cell|
      cell != " "
    end
  end

  def turn_count
    cells.count{ |cell| cell != " " }
  end

  def taken?(position)
    cells[position.to_i-1] != " "
  end

  def valid_move?(input)
    input >= 1 && input <= 9 && cells[input.to_i-1].strip.empty?
  end

  def update(position, player)
      @cells[position.to_i-1] = player.token
  end

end
