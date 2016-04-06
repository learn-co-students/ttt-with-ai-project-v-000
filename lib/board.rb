require 'pry'

class Board
  attr_accessor :cells, :position

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

  def position(location)
    cells[location.to_i-1]
  end

  def full?
    cells.each do |character|
      return false unless character == "X" || character == "O"
    end
  end

  def turn_count
    counter = 0
    cells.each do |position|
      unless (position.nil? || position == " ")
        counter += 1
      end
    end
    counter
  end

  def taken?(position)
    location = position.to_i - 1
    !(cells[location].nil? || cells[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def update(location, player)
    cells[(location.to_i - 1)] = player.token if valid_move?(location)
  end


end
