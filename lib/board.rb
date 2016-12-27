class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(cell_num)
    @cells[cell_num.to_i-1]
  end

  def full?
    cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
  cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
  if cells[input.to_i - 1]== "X" || cells[input.to_i - 1] == "O" then true
  else false
  end
end

  def valid_move?(input)
  input.to_i.between?(1,9) && !taken?(input)
  end

  def update(position, player)
  cells[position.to_i - 1] = player.token
  end

  def any?
  cells.any?{|token| token == "X" || token == "O"}
end

end
