class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts '-----------'
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts '-----------'
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.all? { |cell| cell == 'X' || cell == 'O' }
  end

  def turn_count
    self.cells.select { |cell| cell == 'X' || cell == 'O' }.size
  end

  def taken?(input)
    case position(input)
    when 'X'
      true
    when 'O'
      true
    else
      false
    end
  end

  def valid_move?(input)
    0 < input.to_i && input.to_i < 10 && !taken?(input)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end
end
