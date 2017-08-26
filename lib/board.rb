class Board
  attr_accessor :cells


  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    cells.all? {|move| move != " "}
  end

  def turn_count
    count = 0
    cells.each {|position| count += 1 if position != " "}
    count
  end

  def taken?(index)
    cells[index.to_i - 1] != " "
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(move, player)
    self.cells[move.to_i-1] = player.token
  end
end
