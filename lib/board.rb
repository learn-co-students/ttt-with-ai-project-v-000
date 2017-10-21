require "pry"
require_relative "../config/environment.rb"

class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(location)
    @cells[location.to_i - 1]
  end

  def full?
    @cells.detect {|cell| cell == " "} == nil ? true : false
  end

  def turn_count
    count = 0
    @cells.each {|cell| count += 1 if cell != " "}
    count
  end

  def taken?(location)
    position(location) == " " ? false : true
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !taken?(location)
  end

  def update(location, player)
    @cells[location.to_i - 1] = player.token
  end

end
