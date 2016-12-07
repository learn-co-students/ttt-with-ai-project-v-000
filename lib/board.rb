class Board
  attr_accessor :cells



  def initialize
    self.reset!

  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    b = @cells
    puts " #{b[0]} | #{b[1]} | #{b[2]} "
    puts "-----------"
    puts " #{b[3]} | #{b[4]} | #{b[5]} "
    puts "-----------"
    puts " #{b[6]} | #{b[7]} | #{b[8]} "
  end

  def position(pos)
    @cells[pos.to_i-1]
  end

  def full?
    @cells.all? do |pos|
      pos == "X" || pos == "O"
    end
  end

  def turn_count
    @cells.count { |pos| pos != " "}
  end

  def taken?(pos)
    @cells[pos.to_i-1] != " "
  end

  def valid_move?(pos)
    pos.to_i.between?(1,9) && !taken?(pos)
  end

  def update(pos, player)
    @cells[pos.to_i-1] = "#{player.token}" #puts X or O in cell
  end

end #class
