require "pry"
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  # def cells
  #
  #   @cells = []
  # end

  def reset!
    @cells = Array.new(9, " ")
    # self.cells.clear
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "

  end

  def position(user_input)
    self.cells[user_input.to_i-1]

  end

  def full?
    self.cells.all? {|character| character == "X" || character == "O"}
  end

  def turn_count
    self.cells.count {|char| char == "X" || char == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"

  end

  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1,9)
  end

  def update(input, player)
    self.cells[input.to_i-1] = player.token
  end

end
