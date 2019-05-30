require 'pry'
class Board
attr_accessor :cells

  def initialize
    @cells = [" ", " ", " "," ", " ", " "," ", " ", " "]
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " "," ", " ", " "," ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    index = user_input.to_i - 1
    @cells[index]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    count = 0
    self.cells.each{|x| count += 1 if x != " " }
    count
  end

  def taken?(user_input)
    self.cells[user_input.to_i - 1] != " " ? true : false
  end

  def valid_move?(user_input)
    if user_input.to_i < 1 || user_input.to_i > 9
      false
    else
   !taken?(user_input)
    end
  end

  def update(user_input, player)
  self.cells[user_input.to_i - 1] = player.token if  valid_move?(user_input)
  end

end
