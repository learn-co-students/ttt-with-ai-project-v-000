require 'pry'
class Board

  WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8],
   [0, 4, 8],
   [2, 4, 6]
  ]

  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end

  def reset!
     @cells = Array.new(9, " ")
  end

  def display
    print " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    print "-----------"
    print " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    print "-----------"
    print " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def input_to_index(input)
      input.to_i - 1
  end

  def user_input
    puts "Please enter a number 1 - 9"
    input = STDIN.gets.strip
    @index = input_to_index(input)
    # if valid_move(index)
    #   position(index)
    # end
  end

  def position(space)
    board_space = input_to_index(space)
    cells[board_space]
  end

  def taken?(cells = @cells, index)
    position(index) == "X" || position(index) == "O"
  end

  def valid_move?(index)
    (index.to_i - 1).between?(0, 8) && !taken?(cells = @cells, index)
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
    @cells[(index.to_i - 1)].strip << current_player

  end


end
