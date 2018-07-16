class Board
  attr_accessor :cells

  WIN_COMBINATIONS = [
  #horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagonal
  [0,4,8],
  [2,4,6]
]

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    return self.cells[input.to_i - 1]
  end

  def update(input, player)
    position = input.to_i - 1

    self.cells[position] = player.token
  end

  def valid_move?(input)
    pos = input.to_i - 1
    pos.between?(0, 8) && !taken?(input)
  end

  def taken?(input)
    # Featuring Liam Neeson. Sorry i had too
    self.position(input) == "X" || self.position(input) == "O"
  end

  def full?
    self.cells.none? {|cell| cell == " " || cell == ""}
  end

  def turn_count
    cells = @cells.select { |cell|
      cell == "X" || cell == "O"
    }
    cells.count
  end

end#endof class
