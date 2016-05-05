require_relative "../config/environment.rb"
require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    @cells
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    self.cells[position.to_i-1]
  end

  def full?
    !self.cells.include?(" ") ? true : false
  end

  def empty?
    self.cells.all? {|cell| cell==" "} ? true : false
  end

  def turn_count
    self.cells.count {|x| x != " "}
  end

  def taken?(position)
    self.cells[position.to_i-1] != " " ? true : false
  end

  def valid_move?(position)
    (1..9).include?(position.to_i) && !taken?(position) ? true : false

  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end
end