class Board
  attr_accessor :cells, :token_1, :token_2

  def initialize(token_1 = 'X', token_2 = 'O')
    self.reset!
    self.token_1 = token_1
    self.token_2 = token_2
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
    self.turn_count == 9
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

  def self.create_and_update(position, board)
    hypo = Board.new
    hypo.cells = board.cells.collect { |cell| cell.dup }
    hypo.token_1 = board.token_1.dup
    hypo.token_2 = board.token_2.dup
    int_position = position.to_i - 1
    hypo.turn_count % 2 == 0 ? hypo.cells[int_position] = hypo.token_1 : hypo.cells[int_position] = hypo.token_2
    hypo
  end
end