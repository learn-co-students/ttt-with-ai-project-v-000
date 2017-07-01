require 'pry'
class Board

  attr_accessor :cells

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

  def index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    @cells[index(user_input)]
  end

  def full?
    @cells.all? do |cell|
      cell != " "
    end
  end

  def turn_count
    @cells.count do |cell|
      cell != " "
    end
  end

  def taken?(user_input)
    @cells[index(user_input)] != " "
  end

  def valid_move?(user_input)
    index(user_input).between?(0,8) && !taken?(user_input)
  end

  def update(user_input, player)
    @cells[index(user_input)] = player.token
  end


end
