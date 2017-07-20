class Board
  attr_accessor :cells, :position_index

  MIDDLE = "5"
  CORNERS = ["1", "3", "7", "9"]
  EDGES = ["2", "4", "6", "8"]

  def reset!
    # sets the value of each element in cells array to " "
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def get_filled_win_combinations
    # mirrors WIN_COMBINATIONS array but with the filled in tokens from current board
    Game::WIN_COMBINATIONS.map { |combo| combo.map { |index| cells[index] } }
    # example when "X" is in 0 index
      # ["X", " ", " "]
      # [" ", " ", " "]
      # [" ", " ", " "]
      # ["X", " ", " "]
      # [" ", " ", " "]
      # [" ", " ", " "]
      # ["X", " ", " "]
      # [" ", " ", " "]
  end

  def display
    # prints the board in its current state
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position_string)
    # takes user input as a number in a string, "2", and finds corresponding array index
    @position_index = position_string.to_i - 1
    cells[position_index]
  end

  def update(position_string, player)
    if !taken?(position_string)
      cells[position_index] = player.token
    end
  end

  def full?
    turn_count == cells.length
  end

  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(position_string)
    position(position_string) != " "
  end

  def valid_move?(position_string)
    !taken?(position_string) && position_index.between?(0, 8)
  end
end

