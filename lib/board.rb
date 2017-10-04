require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")  # @cells and self.cells are the same statements (if there is no cells method for your class).
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    cells.all?{|c| c == "X" || c == "O"}
  end

  def turn_count  #returns the amount of used/played cells
    cells.count{ |c| c == "X" || c == "O"}  #counts when X or O is on board
  end

  def taken?(user_input)
    position(user_input) == " " ? false : true   #position(user_input) == "X" || position(user_input)== "O"
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input) #it is a valid move if user_input is 1-9 and NOTtaken?
  end

  def update(user_input, player)
    cells[user_input.to_i - 1] = player.token
  end

end
