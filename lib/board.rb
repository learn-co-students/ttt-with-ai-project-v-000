class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  # def rankings
  #   {
  #     cell_1: {
  #       value: self.cells[0],
  #       ranking:
  #     }
  #   }
  #   # @board.rankings.cell_1.value || @board.rankings.cell_1.ranking @board.ranksings["cell_#{i+1}"] = 9
  # end

  def display
    separator_row = "-----------"
    row1 = " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    row2 = " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    row3 = " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "#{row1}\n#{separator_row}\n#{row2}\n#{separator_row}\n#{row3}"
  end

  # cell is physical location; index is the array index.
  def position(cell)
    index = cell.to_i - 1
    (index >= 0 && index <= 8) ? self.cells[index] : nil
  end

  def full?
    self.cells.all? {|positions| positions == "X" || positions == "O"}
  end

  def turn_count
    self.cells.count{|cell| cell == "O" || cell == "X"}
  end

  def taken?(cell)
    (self.position(cell) == "X" || self.position(cell) == "O") ? true : false
  end

  def valid_move?(cell)
    #(self.taken?(cell) == true || self.position(cell) == nil) ? false : true
    input.to_i.between?(0,8) && !taken(cell)
  end

  def update(cell, player)
    index = cell.to_i - 1
    self.cells[index] = player.token if valid_move?(cell) == true
  end

  def reset!
    self.cells = Array.new(9, " ")
  end
end
