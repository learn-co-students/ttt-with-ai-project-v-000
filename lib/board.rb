require 'pry'
class Board

attr_accessor :cells, :game

  def initialize
    @cells = Array.new(9, " ")
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

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    @cells.none? { |element| element == " "}
  end

  def turn_count
    @cells.count {|element| element == "X" || element == "O"}
  end

  def taken?(position)
    @cells[position.to_i-1] != " "
  end

  def valid_move?(input)
    input.to_i > 0 && input.to_i < 10 && self.taken?(input) != true
  end

  def update(input, player_token)
    @cells[input.to_i-1] = player_token.token
  end

end
