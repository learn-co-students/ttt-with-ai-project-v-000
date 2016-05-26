class Board
  attr_accessor :board, :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    board_display = " " + self.cells[0] + " | " + self.cells[1] + " | " + self.cells[2] + " \n" +
                    "-----------" + "\n" +
                    " " + self.cells[3] + " | " + self.cells[4] + " | " + self.cells[5] + " \n" +
                    "-----------" + "\n" +
                    " " + self.cells[6] + " | " + self.cells[7] + " | " + self.cells[8] + " "
    puts board_display
  end

  def position(index)
    self.cells[index.to_i - 1]
  end

  def full?
    self.cells.include?(" ") ?
    false : true
  end

end
