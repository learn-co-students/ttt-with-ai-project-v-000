class Board
  attr_accessor :cells, :turn_count


  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(location)
    cells[location.to_i - 1]
  end

  def full?
    cells.all?{|token| token == "X" || token == 'O'}
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(location)
    !(position(location).nil? || position(location) == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input.to_i)
  end

  def update(location, current_player)
    cells[location.to_i - 1] = current_player.token
    #tried several versions using position() method / got syntax error, unexpected '=', expecting keyword_end (SyntaxError)
  end
end
