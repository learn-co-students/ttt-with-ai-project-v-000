require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts  "-----------"
    puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def to_index(user_input)
    index = (user_input.to_i)-1
  end

  def position(user_input)
    index = to_index(user_input)
    if index>=0 && index<=8
      @cells[index]
    end
  end

  def full?
    @cells.all?{|position| position == "X" || position == "O"}
  end

  def turn_count
    @cells.find_all{|position| position == "X" || position == "O"}.size
  end

  def taken?(user_input)
    index = to_index(user_input)
     @cells[index] == "X" || @cells[index] == "O" ? true : false
  end

  def valid_move?(user_input)
    index = to_index(user_input)
    index>=0 && index<=8 && @cells[index] == " " ? true : false
  end

  def update(user_input, player)
    index = to_index(user_input)
    @cells[index]=player.token
  end





end
