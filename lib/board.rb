class Board
  attr_reader :cells

  def cells=(cells)
    @cells = cells
  end

  def reset!
    self.cells.clear
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    self.cells=(@board)
  end

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    self.cells=(@board)
    self.display
  end

  def display
    row_1 = " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    row_2 = " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    row_3 = " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    dashes = "-----------"
    puts row_1
    puts dashes
    puts row_2
    puts dashes
    puts row_3
  end

  def position(input)
    input = input.to_i
    index = input - 1
    self.cells[index]
  end

  def full?
    full_board = self.cells.all? do |position|
      position == "X" || position == "O"
    end

    if full_board
      true
    else
      false
    end
  end

  def turn_count
    turns = 0
    self.cells.each do |board_position|
      if board_position == "O" || board_position == "X"
        turns += 1
      end
    end
    turns
  end

  def taken?(position)
    input = position.to_i
    index = input - 1
    if self.cells[index] == "X" || self.cells[index] == "O"
      true
    elsif self.cells[index] == " " || self.cells[index] == "" || self.cells[index] == nil
      false
    else
      false
    end
  end

  def valid_move?(position)
    input = position.to_i
    index = input - 1
    if taken?(position) == false && self.cells[index] != nil && index >= 0 && index <= 8
      true
    else
      false
    end
  end

  def update(position, player)
    input = position.to_i
    index = input - 1
    token = player.token
    self.cells[index] = token
  end
end
