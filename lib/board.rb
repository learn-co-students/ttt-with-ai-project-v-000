class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9," ")
  end

  def initialize
    reset!
  end

  def display
    puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts  "-----------"
    puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def index(input)
    input.to_i-1
  end

  def position(input)
    @cells[index(input)]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    @cells.count {|cell| cell != " "}
  end

  def taken?(input)
    position(input) == "O" || position(input) == "X"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    @cells[index(input)] = player.token
  end

end
