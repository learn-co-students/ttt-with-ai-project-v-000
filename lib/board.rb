class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, ' ')
  end

  def display
    puts board_row(0)
    puts horizontal_line
    puts board_row(1)
    puts horizontal_line
    puts board_row(2)
  end

  def board_row(index)
    board = self.cells
    first = board[0 + index * 3]
    second = board[1 + index * 3]
    third = board[2 + index * 3]
    ' ' + first + ' | ' + second + ' | ' + third + ' '
  end

  def horizontal_line
    puts '-----------'
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    turn_count == 9
  end

  def taken?(input)
    position(input) != ' '
  end

  def turn_count
    turn_count = 0
    ('1'..'9').each do |index|
      turn_count += 1 if taken?(index)
    end
    turn_count
  end

  def valid_move?(input)
    ('1'..'9').include?(input) && !taken?(input)
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end
end