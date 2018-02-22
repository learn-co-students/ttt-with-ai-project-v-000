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
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "\n\n"
  end

  def position(i)
    @cells[i.to_i - 1]
  end

  def full?
    @cells.all?{|spot| spot == "X" || spot == "O"}
  end

  def turn_count
    @cells.count{|space| space == "X" || space == "O"}
  end

  def taken?(i)
    cells[i.to_i - 1] == "O" || cells[i.to_i - 1] == "X"
  end

  def valid_move?(i)
    i.to_i.between?(1,9) && !taken?(i.to_i)
  end

  def update(i, player)
    cells[i.to_i - 1] = player.token
  end


end
