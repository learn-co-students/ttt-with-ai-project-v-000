class Board
  attr_accessor :cells

  def initialize
    self.reset! # set cells
  end

  def reset!
    self.cells = Array.new(9, ' ')
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts '-----------'
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts '-----------'
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end


  def position(input)
    self.cells[input_to_index(input)]
  end

  def full?
    self.cells.all? {|cell| cell == 'X' || cell == 'O'}
  end

  def turn_count
    self.cells.inject(0) {|result, cell| cell == 'X' || cell == 'O' ? result + 1 : result}
  end

  def taken?(input)
    position(input) == 'X' || position(input) == 'O'
  end

  def valid_move?(input)
    !input_to_index(input).between?(0, 8) || taken?(input) ? false : true
  end

  def update(input, player)
    self.cells[input_to_index(input)] = player.token
  end

  private

  def input_to_index(input)
    input.to_i - 1
  end

end
