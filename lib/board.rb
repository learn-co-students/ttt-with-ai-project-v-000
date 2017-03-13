class Board
  require 'pry'
  attr_accessor :cells


  def reset!
    @cells = Array.new(9, " ")
    @open_positions = ["1","2","3","4","5","6","7","8","9"]
  end

  def open_positions
    @open_positions
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input) #RETURNS VALUE AT BOARDINDEX FOR INPUT POSITION
    @cells[input.to_i-1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(input, player) #ADDS MOVE TO BOARD     #Should really be: valid_move?(input) ? @cells[input.to_i-1] = player.token : "Invalid move"
    @cells[input.to_i-1] = player.token                           #sets cells to player token. Only way to get this was via reading spec.
    @open_positions.delete(input)
  end

end
