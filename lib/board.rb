class Board
  attr_accessor :cells


  def initialize
    reset!
  end


  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    rows = ["   |   |   ", "-----------", "   |   |   ", "-----------", "   |   |   "]
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts rows[1]
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts rows[3]
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    input = input.to_i
    cells[input-1]
  end

  def full?
    cells.all?{|i| i == "X" || i == "O"}
  end

  def turn_count
    cells.count {|player| player == "X" || player == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1, 9)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end


end
