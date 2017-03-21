require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts '-----------'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts '-----------'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(cell)
    @cells[cell.to_i - 1]
  end

  def full?
    @cells.all? { |cell| cell != ' ' }
  end

  def turn_count
    @cells.select { |cell| cell != ' ' }.count
  end

  def taken?(cell)
    if @cells[cell.to_i - 1] != ' '
      true
    else
      false
    end
  end

  def valid_move?(cell)
    if cell !~ /\D/
      @cells[cell.to_i - 1] == ' ' ? true : false
    else
      false
    end
  end

  def update(cell, player)
    @cells[cell.to_i - 1] = player.token
  end
end
