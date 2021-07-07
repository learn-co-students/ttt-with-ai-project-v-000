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

  def position(take)
    @cells[take.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    @cells.count { |turn| turn == "X" || turn == "O" }
  end

  def taken?(index)
    (@cells[index.to_i - 1] == " " || nil) ? false : true
  end

  def valid_move?(index)
    index.to_i.between?(1, 9) && (@cells[index.to_i - 1] == " " || @cells[index.to_i - 1] == nil)
  end

  def update(index, player)
     @cells[index.to_i - 1] = player.token
  end
end
