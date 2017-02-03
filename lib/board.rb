class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(cell)
    self.cells[input_to_i(cell)]
  end

  def update(cell, player)
  end

  def turn_count
    turn = self.cells.collect {|c| c == " "}
    if turn.size % 2 == 0
      "O"
    else 
      "X"
    end  
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def full?
    self.cells.all? {|c| c == "X" || c == "O"}
  end

  def taken?(cell)
    cell = input_to_i(cell)
    self.cells[cell] == "X" || self.cells[cell] == "O"
  end

  def valid_move?(cell)
     !(input_to_i(cell) < 0 || input_to_i(cell) > 9) && !(self.cells[input_to_i(cell)]  == "X" || self.cells[input_to_i(cell)] == "O")
  end

  def input_to_i(input)
    input.to_i - 1
  end

end
