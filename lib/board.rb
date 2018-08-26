require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
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
  
  def position(user_input)
    @cells[user_input.to_i - 1]
  end
  
  def full?
    @cells.all? {|p| p == "X" || p == "O"} ? true : false
  end
  
  def turn_count
    taken_positions = @cells.select {|p| p == "X" || p == "O"}
    taken_positions.length
  end
  
  def taken?(user_input)
    p = position(user_input) 
    p == "X" || p == "O" 
  end
  
  def valid_move?(user_input)
    i = user_input.to_i
    (i >= 1 && i <= 9) && position(user_input) == " "
  end
  
  def update(user_input, player)
    @cells[user_input.to_i - 1] = player.token
  end
end
