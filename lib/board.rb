class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " "," "," "," "," "," "," ", " "]
  end

  def reset!
    @cells = [" ", " "," "," "," "," "," "," ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    @cells.all? {|x| x != " "}
  end

  def turn_count
    @cells.count{|x| x == "X" || x == "O"}
  end

  def taken?(position)
    if cells[position.to_i-1] == "X" || cells[position.to_i-1] == "O"
      return true
    else
      return false
  end
end

  def valid_move?(position)
    !(taken?(position)) && (0..9).include?(position.to_i-1)
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
  end


end
