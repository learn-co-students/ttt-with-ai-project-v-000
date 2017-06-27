require 'pry'
class Board

  attr_accessor :cells, :token

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    user_input.to_i - 1
    @cells[user_input.to_i - 1]
  end

  def full?
     @cells.all?{|square| square != " " }
  end

  def turn_count
    @cells.count{|square| square != " " }
  end

  def taken?(index)
    index.to_i - 1
    @cells[index.to_i - 1] != " "
  end

  def valid_move?(index)
    integer_index = index.to_i
    !taken?(integer_index) && integer_index.between?(1,9)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end

  def token
    "X"
  end

end
