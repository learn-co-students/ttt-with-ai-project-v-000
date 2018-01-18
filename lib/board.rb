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

  def turn_count
    self.cells.count("X") + self.cells.count("O")
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

  def current_player
    turn_count.even? ?
    player_1 : player_2
  end

  def valid_moves
    valid_moves = []
    self.cells.each_with_index do |cell, index|
      position = index + 1
      valid_moves << position.to_s if self.valid_move?(position.to_s)
    end
    valid_moves
  end


end
