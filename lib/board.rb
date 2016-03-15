class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i-1]
  end

  def full?
    @cells.all?{|full| full == "X" || full == "O"}
  end

  def turn_count
    @cells.count {|full| full == "X" || full == "O"}
  end

  def taken?(pos)
    position(pos) == "X" || position(pos) == "O" ? true:false
  end

  def valid_move?(move)
    move.to_i.between?(1,9) && !taken?(move)
  end

  def update(pos, user)
    @cells[pos.to_i-1] = user.token
  end

end