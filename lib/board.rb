require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
    
  end

  def reset!
    @cells.clear
    @cells = Array.new(9," ")

  end

  def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

def position(position)
  user_position = @cells[position.to_i-1]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end 

  def turn_count
turns = @cells.select {|cell| cell == "X" || cell == "O"}
    turns.size
  end

  def taken?(position)
    position(position) == "X" || position(position) == "O"
  end

  def valid_move?(move)
    move.to_i > 0 && move.to_i < 10 && !taken?(move.to_i)
  end

  def update(position,player)
    if valid_move?(position)
      @cells.each_with_index do |cell, i|
        if i == position.to_i - 1
          
          @cells[i] = player.token
        end
      end
    end
  end

end