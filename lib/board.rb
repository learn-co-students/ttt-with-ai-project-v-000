require 'pry'
class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts ""
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
  end

  def position(input)
    input = (input.to_i - 1)
    self.cells[input]
  end

  def full?
    self.cells.all? {|pos| pos != " "}
  end

  def turn_count
    self.cells.find_all {|pos| pos != " "}.size
  end

  def taken?(pos)
    # binding.pry
    self.cells[pos.to_i - 1] == "X" || self.cells[pos.to_i - 1] == "O"
  end

  def valid_move?(input)
    (input.to_i >= 1 && input.to_i <= 9) && self.taken?(input) == false ? true : false
  end

  def update(input, player)
    if valid_move?(input)
      self.cells[input.to_i - 1] = player.token
      # self.display
    else
      puts "Not a valid move."
    end
  end
end
