require "pry"

class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(number_selected)
    cells[number_selected.to_i - 1]
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def turn_count
    cells.count{|c| c == "X" || c == "O"}
  end

  def taken?(number_selected)
    index = number_selected.to_i - 1
    !(cells[index].nil? || cells[index] == " ")
  end

  def valid_move?(number_selected)
    !taken?(number_selected.to_i) && number_selected.to_i.between?(1,9)
  end

  def update(number_selected, player)
    cells[number_selected.to_i - 1] = player.token
  end
end
