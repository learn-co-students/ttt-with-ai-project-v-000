class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{cells[8]} "
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def taken?(index)
    position(index) == "X" || position(index) == "O"
  end

  def valid_move?(index)
    index = index.to_i && index.to_i >= 1 && index.to_i <= 9 && !taken?(index)
  end

  def turn_count
    count = 0
    @cells.each{|cell|
      if cell == "O" || cell =="X"
        count += 1
      end
    }
    count
  end

end
