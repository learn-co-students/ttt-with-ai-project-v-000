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
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i - 1]
  end

  def full?
    @cells.none? {|pos| pos == " "}
  end

  def turn_count
    @cells.count {|pos| pos == "X" || pos == "O"}
  end

  def taken?(pos)
    @cells[pos.to_i - 1] != " "
  end

  def valid_move?(pos)
    pos.to_i.between?(1, 9) && !taken?(pos) && pos.to_i.to_s == pos
  end

  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end
end
