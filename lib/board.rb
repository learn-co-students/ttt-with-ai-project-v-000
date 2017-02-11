require 'pry'

class Board
attr_accessor :cells, :token, :player

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    cells.clear
    initialize
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(index)
    index = input_to_index(user_input)
    self.cells[index]
  end

  def full?
    !self.cells.include? " "
  end

  def turn_count
    cells.count { |token| token == "X" || token == "O" }
  end

  def taken?(index)
    if position(index) == " "
      false
    else !position(index).nil?
    end
  end

  def valid_move?(user_input)
    !taken?(index) && index.between?(0,8)
  end

  def update(index, player)
    #binding.pry
    cells[index] = player.token
  end
end
