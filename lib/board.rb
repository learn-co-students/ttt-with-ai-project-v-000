class Board
attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")                                                                                            
  end

  def cells
    @cells
  end

  def display
    puts " "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " "
  end

  def position(pos)
    @cells[pos.to_i-1]
  end

  def taken?(pos)
    position(pos) == "X" || position(pos) == "O" ? true : false
  end

  def full?
    @cells.all? {|e| e == "X" || e == "O"}
  end

  def turn_count
    @cells.count {|e| e == "X" || e == "O"}
  end

  def valid_move?(pos)
    !taken?(pos.to_i) && pos.to_i.between?(1,9) ? true : false
  end

  def update(pos, player)
    @cells[pos.to_i-1] = player.token
  end
end