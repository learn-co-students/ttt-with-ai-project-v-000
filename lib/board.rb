require 'pry'
class Board
  attr_accessor :cells, :player

  def initialize
    self.reset!
    self
  end
  def reset!
    @cells = Array.new(9, " ")
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(input)
    i = input.to_i
    @cells.detect.with_index{|value, index|index == i-1}
  end
  def full?
    !@cells.include?(" ")? true: false
  end
  def turn_count
    @cells.select{|cell| cell!=" "}.size
  end
  def taken?(input)
    i = input.to_i
    i = i-1
    if @cells[i]=="X"|| @cells[i]=="O"
       true
    else
      false
    end
  end
  def valid_move?(input)
    i = input.to_i
    (i.is_a?(Integer) && !taken?(input) && i.between?(1,9))? true: false
  end
  def update(input, player)
    i = input.to_i
    i-=1
    if valid_move?(input)
      @cells[i] = player.token
    end
  end




end
