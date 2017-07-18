require 'pry'

class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    self.reset!
  end

  def display
    puts "==========="
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "==========="
    puts
  end

  def position(input)
    position = @cells[input.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count { |turn| turn == "X" || turn == "O" }
  end

  def taken?(index)
    !(@cells[index.to_i - 1].nil? || @cells[index.to_i - 1] == " ")
  end

  def valid_move?(index)
    (index.to_i).between?(1, 9) && !self.taken?(index)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end


end
