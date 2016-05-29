class Board
  attr_accessor :board, :cells, :counts

  def initialize
    self.cells = Array.new(9, " ")
    self.counts = { " " => 0, "X" => 0, "O" => 0 }
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

  def turn_count
    self.cells.each do |word|
      self.counts[word] += 1
    end
    count = self.counts["X"] + self.counts["O"]
    self.counts = { " " => 0, "X" => 0, "O" => 0 }
    count
  end

  def taken?(position_index)
    index = position_index.to_i - 1
    self.cells[index] == "X" || self.cells[index] == "O"
  end

  def valid_move?(position_index)
    if ["1", "2", "3", "4", "5", "6", "7", "8", "9"].include?(position_index)
      !taken?(position_index)
    else
      false
    end
  end

  def update(position_index, player)
    self.cells[position_index.to_i - 1] = player.token
  end


end
