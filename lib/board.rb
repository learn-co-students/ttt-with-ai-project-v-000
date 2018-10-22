class Board
  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    input = input.to_i
    cells[input-1]
  end

  def full?
    true if cells.all? {|index| index != " "}
  end

  def turn_count
    cells.count{|player_token| player_token == "X" || player_token == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    self.position(input)
    true if taken?(input) == false && input.to_i.between?(1,9)
  end

  def update(input, player="X")
    input = input.to_i
    cells[input -1] = player.token
  end




end
