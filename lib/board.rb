require 'pry'

class Board
  attr_accessor :cells, :position


  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts " "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(position)
     cells[position.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    turns = cells.count do |position|
      position == "X" || position == "O"
    end
    turns
  end

  def taken?(index)
    !(cells[index.to_i - 1].nil? || cells[index.to_i - 1] == " ")
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index.to_i)
  end


  def update(index, player)
    cells[index.to_i - 1] = player.token
  end

end
