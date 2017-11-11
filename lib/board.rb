class Board

  attr_reader :cells

  def initialize
    @board = Array.new(9, " ")
    @cells = @board
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def cells=(cells)
    @cells = cells
  end

  def position(int)
    self.cells[int.to_i-1].to_s
  end

  def full?
    self.cells.none? {|cell| cell == " "}
  end

  def taken?(int)
    (self.position(int) == "X" || self.position(int) == "O")
  end

  def valid_move?(int)
    int.to_i.between?(1, 9) && !taken?(int)
  end

  def update(int, player)
    cells[int.to_i-1] = player.to_s
  end

  def turn_count
    counter = 0
    self.cells.each do |cell|
      if cell == "X" || cell == "O"
         counter += 1
      end
    end
    counter
  end

  def reset!
    @cells = Array.new(9, " ")
  end

end
