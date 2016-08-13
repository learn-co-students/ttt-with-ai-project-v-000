require 'pry'
class Board

  attr_accessor :cells

  def initialize
   @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(location)
    @cells[location.to_i - 1]
  end

  def turn_count
    @cells.count{|cell| !(cell.strip.empty?)}
  end

  def full?
    if turn_count == 9
      true
    end
  end

  def taken?(location)
    @cells[location.to_i - 1] != " " && @cells[location.to_i - 1] != ""
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !taken?(location)
  end

  def update(location, player)
    @cells[location.to_i - 1] = player.token
  end





end