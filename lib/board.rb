require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end

  def reset!
    @cells = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end

  def display
    print "cells: #{@cells}"
    puts

    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts ("-----------")
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts ("-----------")
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "

    puts
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    !@cells.include?(' ')
  end

  def turn_count
    @cells.select do |cell|
      cell == 'X' || cell == 'O'
    end.length
    #binding.pry
  end

  def taken?(position)
    @cells[position.to_i - 1] == 'X' || @cells[position.to_i - 1] == 'O'
  end

  def valid_move?(move)
    move.to_i > 0 && move.to_i < 10 && !taken?(move)
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
end