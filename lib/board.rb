class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all?{|c| c != " "}
  end

  def taken?(position)
    #binding.pry
    !(self.position(position) == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !self.taken?(position.to_i)
  end

  def turn_count
    @cells.count {|c| c == "X" || c == "O"}
  end

  def update(position, player)
    position_adj = (position.to_i - 1)
    @cells[position_adj] = player.token
  end

  def reset!
    @cells = Array.new(9, " ")
  end
end
