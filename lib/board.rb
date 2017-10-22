class Board
  attr_accessor :cells, :input_output

  ALL_POSITIONS = (1..9).to_a
  CORNER_POSITIONS = [1, 3, 7, 9]
  TOKEN_CROSS = "X"
  TOKEN_NOUGHT = "O"
  ALL_TOKENS = %W(#{TOKEN_NOUGHT} #{TOKEN_CROSS})

  def display
    self.input_output.display self.to_s
  end

  def find_move_in_any_available_position
    non_corner_positions = ALL_POSITIONS - CORNER_POSITIONS

    # prioritize corner positions over non-corner positions
    move = (CORNER_POSITIONS + non_corner_positions).detect do |position|
      valid_move?(position)
    end

    move.to_s
  end

  def find_winning_move_for_token(token)
    # Note: index is position - 1
    winning_move_index = nil

    Game::WIN_COMBINATIONS.each do |win_combination|
      indices_matching_winning_combination = win_combination.select do |index|
        self.position(index + 1) == token
      end

      if indices_matching_winning_combination.size == 2
        winning_move_index = win_combination.detect do |index|
          self.position(index + 1) == " "
        end
      end

      break if winning_move_index
    end

    winning_move_index ? (winning_move_index + 1).to_s : nil
  end

  def first_turn?
    turn_count == 0
  end

  def full?
    self.cells.all? do |token|
      Board::ALL_TOKENS.include?(token)
    end
  end

  def initialize(io = InputOutput::CLI.new)
    reset!
    self.input_output = io
  end

  def position(position)
    self.cells[position_to_index(position)]
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def taken?(position)
    Board::ALL_TOKENS.include?(position(position))
  end

  def to_s
    " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} \n" +
    "-----------\n" +
    " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} \n" +
    "-----------\n" +
    " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} \n"
  end

  def turn_count
    self.cells.count do |token|
      Board::ALL_TOKENS.include?(token)
    end
  end

  def update(position, player)
    self.cells[position_to_index(position)] = player.token
  end

  def valid_move?(position)
    !self.taken?(position) && Board::ALL_POSITIONS.include?(position.to_i)
  end

  private

  def position_to_index(position)
    position.to_i - 1
  end
end
