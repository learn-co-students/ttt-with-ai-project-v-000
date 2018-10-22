require 'pry'

class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells.clear
    9.times {@cells << " "}
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end  
  
  def position(input)
    @cells[input.to_i-1]
  end
  
  def full?
    @cells.all? do |cell|
      cell == "X" || cell == "O"
    end
  end
  
  def turn_count
    counter = 0
    @cells.each do |count|
      if count == "O" || count == "X"
      counter += 1
      end
    end
    counter
  end
  
  def taken?(index)
    !(@cells[index.to_i-1] == " " || @cells[index.to_i-1] == "")
  end
  
  def valid_move?(index)
   index.to_i.to_s == index && index.to_i.between?(0,8) && !taken?(index)
  end

  def update(index, player)
      # binding.pry
    if (player.token == "X" || player.token == "O") && taken?(index) == false
      @cells[index.to_i-1] = player.token
    end
    @cells
  end
  
end