class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end 

  def reset!
    @cells = Array.new(9, " ")
  end 

  def display
    puts ""
    puts ""
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
    puts ""
  end 

  def input_to_index(input)
    input.to_i - 1
  end 

  def position(input)
    index = input_to_index(input)
    @cells[index]
  end 

  def full?
    !@cells.include?(" ")
  end 

  def turn_count
    9 - @cells.count(" ")
  end 

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end 

  def valid_move?(input)
    input.to_i.between?(1,9) && taken?(input) == false
  end 

  def update(input, player)
    if valid_move?(input) == true
      @cells[input_to_index(input)] = player.token
    end 
  end 
end 