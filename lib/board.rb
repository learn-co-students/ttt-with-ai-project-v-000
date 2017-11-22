class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, ' ')
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

  def move_to_index(move)
    move.to_i - 1
  end

  def position(move)
    @cells[move_to_index(move)]
  end

  def full?
    @cells.detect { |cell| cell == ' ' }.nil?
  end

  def turn_count
    (@cells.select { |cell| cell == ' ' } . count - 9) * -1
  end

  def taken?(move)
    @cells[move_to_index(move)] != ' '
  end

  def valid_move?(move)
    move.to_i < 10 && move.to_i > 0 && !taken?(move)
  end

  def update(move, player)
    @cells[move_to_index(move)] = player.token if valid_move?(move)
  end
end
