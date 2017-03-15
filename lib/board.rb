class Board
  attr_accessor :cells, :game

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
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
    @cells.none? {|e| e == " " }
  end

  def turn_count
    @cells.count {|e| e != " " }
  end

  def taken?(input)
    self.position(input) != " "
  end

  def valid_move?(input)
    !self.taken?(input) && input.to_i > 0 && input.to_i < 10
  end

  def update(input, player)
    # if self.turn_count % 2 == 0
      @cells[input.to_i-1] = player.token
    # end
  end

end
