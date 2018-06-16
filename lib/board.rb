class Board

  attr_accessor :cells

  def initialize

    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(cellnum)
    @cells[cellnum.to_i - 1]
  end

  def full?
    @cells.all? { |token| token =="X" || token == "O"}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(cellnum)
    @cells[cellnum.to_i - 1]== "X" || @cells[cellnum.to_i - 1] == "O"
  end

  def valid_move?(cellnum)
    /\A[1-9]\z/.match(cellnum) && !taken?(cellnum)
  end

  def update(cellnum, player)
    @cells[cellnum.to_i - 1] = player.token unless !valid_move?(cellnum)
  end

end
