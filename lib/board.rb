require "pry"
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
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
    user_input.to_i - 1
  end

  def position(user_input)
    @cells[input_to_index(user_input)]
  end

  def full?
    @cells.all?{|token|  token == "X" || token == "O"}
    # modo alternativo: @cells.detect{|cell| cell == " "}? false : true
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(user_input)
    position(user_input) != " "
    #modo alternativo 1: (@cells[input_to_index(user_input)] == "X" || @cells[input_to_index(user_input)] == "O") ? true : false
    #modo alternativo 2: !(@cells[input_to_index(user_input)].nil? || @cells[input_to_index(user_input)] == " ")
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1, 9) && !taken?(user_input)
  end

  def update(user_input, player)
    @cells[input_to_index(user_input)] = player.token
  end
end
