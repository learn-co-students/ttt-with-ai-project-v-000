class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts "\n"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "\n"
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    !@cells.find {|cell|  cell == " "}
  end

  def turn_count
    @cells.count {|i| i == "X" || i == "O"}
  end

  def taken?(position)  
    @cells[(position.to_i) -1] == " " ? false : true
  end

  def valid_move?(position)
    taken?(position) || !position.to_i.between?(1, 9) ? false : true
  end

  def update(position, player)
    @cells[(position.to_i) - 1] = player.token
  end
  
end