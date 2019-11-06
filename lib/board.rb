class Board
  attr_accessor :cells
  @cells = []

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts
  end

  def position(input)
    #input = gets.strip
    @cells[input.to_i-1]
  end

  def full?
    @cells.none?{|c| c == ""} && @cells.none?{|c| c == " "} && @cells.none?{|c| c == nil}
  end

  def turn_count
    @cells.count{|i| i == "X" || i == "O"}
  end

  def taken?(n)
    @cells[n.to_i - 1] == "X" || @cells[n.to_i - 1] == "O"
  end

  def valid_move?(n)
    !taken?(n) && (1..9).include?(n.to_i)
  end

  def update(input, char)
    @cells[(input.to_i - 1)] = char.token
  end

end
