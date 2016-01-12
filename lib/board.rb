class Board
  attr_accessor :cells

  def initialize
    @cells = []
    9.times { @cells << " " }
  end

  def reset!
    @cells.clear
    9.times { @cells << " " }
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? { |cell| cell == "X" || cell == "O"}
  end

  def turn_count
    @cells.select { |cell| cell == "X" || cell == "O"}.count
  end

  def taken?(position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end