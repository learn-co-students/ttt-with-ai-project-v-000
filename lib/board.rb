class Board

  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    i =  input.to_i - 1
    return "#{cells[i]}"
  end

  def full?
    cells.all? {|s| s != " "}
  end

  def turn_count
    9 - cells.count(" ")
  end

  def taken?(position)
    i = position.to_i - 1
    cells[i] != " "
  end

  def valid_move?(position)
    i = position.to_i
    i.between?(1,9) && !taken?(i)
  end

  def update(input, player)
    i = input.to_i - 1
    cells[i] = player.token # I don't understand player = double("player", :token => "X")
                    # how to access the token of x? > pry shows me token = #<Double "player">
  end

end
