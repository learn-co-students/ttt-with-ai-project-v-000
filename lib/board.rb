class Board
  attr_accessor :board, :cells

  def initialize(board = nil)
    @cells = board || Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i-1
  end

  def position(user_input)
    # get user input and convert to an index for the @cells array, then return the value of that index
    # input = gets.strip
    # index = input_to_index(input)
    # index
  end








end
