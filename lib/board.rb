class Board

  attr_accessor :cells


  def initialize
    self.reset!
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

  def position(position)
    @cells[position.to_i - 1]
  end

  def full?
    @cells.all?{|c| c == "X" || c == "O"}
  end

  def turn_count
    @cells.count{|c| c == "X" || c == "O"}
  end

  def taken?(position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
  end

  def valid_move?(position)
    !taken?(position) if position.to_i.between?(1, 9)
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
end
