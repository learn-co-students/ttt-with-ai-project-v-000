
require 'pry'
class Board


  def cells=(array = nil)
    if array != nil
      @cells = array
    else
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
      puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts  "-----------"
      puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts  "-----------"
      puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
      puts  "                                            "
  end

  def position(user_input)
    index = user_input.to_i - 1
    @cells[index]
  end

  def full?
#binding.pry
    if @cells.include?(" ") == false
      true
    elsif @cells.include?(" ") == true
      false
    end
  end

  def turn_count
    counts = []
    @cells.each {|cell| counts << cell unless cell == " "}
    counts.length
  end

  def taken?(user_input)
     position(user_input) == "X" || position(user_input) == "O"
  end

  def valid_move?(user_input)
    index = user_input.to_i
    index >= 1 && index <= 9 && taken?(user_input) == false
  end

  def update(user_input, player)
    index = user_input.to_i - 1
    @cells[index] = player.token
    @cells[index]
    display
  end




end
