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
    puts " "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " "
    puts " "
  end

  def position(position)
    @cells[position.to_i-1]
  end

  def taken?(position)
    position(position) == "X" || position(position) == "O" ? true : false
  end

  def full?
    @cells.all? {|e| e == "X" || e == "O"}
  end

  def turn_count
    @cells.count {|e| e == "X" || e == "O"}
  end

  def valid_move?(position)
    taken?(position.to_i) == false && position.to_i.between?(1,9) ? true : false
  end

  def update(position, player)
    @cells[position.to_i-1] = player.token
  end
end