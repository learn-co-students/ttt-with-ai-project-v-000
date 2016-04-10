class Board

  attr_accessor :cells, :player

  def initialize()
    reset!
  end

  def reset!
    @cells = []
    9.times{@cells << " "}
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def update(occupy, player)
     cells[occupy.to_i - 1] = player.token
  end

  def full?
    true unless cells.any?{|x| x == " "}
  end

  def turn_count
    cells.count{|x| x != " "}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O" ? true : false
  end

  def valid_move?(input)
    (1..9).include?(input.to_i) && !taken?(input)
  end

end
