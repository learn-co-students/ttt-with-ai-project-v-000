require 'pry'
class Board

  #include Countable

  attr_accessor :cells

  def initialize
    @cells = cells
    reset!
  end

  def reset!
     @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def input_to_index(input)
      input.to_i - 1
  end

  def position(space)
    board_space = input_to_index(space)
    cells[board_space]
  end

  def taken?(index)
    position(index) == "X" || position(index) == "O"
  end

  def valid_move?(index)
  input_to_index(index).between?(0, 8) && position(index) == " "
  end

  def turn_count
    @cells.count {|position| position != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @cells.all? do|space|
    space == "X" || space == "O"
    end
  end

  def update(index, player)
    current_player == player
    @cells[(index.to_i - 1)] = current_player
  end

end
