require 'pry'
class Board
  attr_accessor :cells

  @cells = []

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(input)
    if input.instance_of?(String)
      index = input_to_index(input)
    else
      index = input
    end
    @cells[index]
  end

  def full?
    @cells.all? {|i| i == "X" || i == "O"}
  end

  def turn_count
    turns = 0
    @cells.each {|i| turns +=1 if  i == "X" || i == "O" }
    turns
  end

  def taken?(input)
    position = position(input)
    position == "X" || position == "O" ? true : false
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !taken?(input)
 end

 def update(input, player)
   index = input_to_index(input)
   valid_move?(input) ? @cells[index] = player.token : "try again"
 end


end
