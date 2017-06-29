require "pry"
class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
  end
  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end
  def display
    puts (" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
    puts ("-----------")
    puts (" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
    puts ("-----------")
    puts (" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
  end
  def position(user_input)
    input = user_input.to_i - 1
    @cells[input]
  end
  def full?
    t_or_f = true
    @cells.each do |x|
      if x == "X" || x == "O"
        t_or_f = true
      else
        t_or_f = false
      end
    end
      t_or_f
  end

  def turn_count
    counter = 0
    @cells.each do |x|
      if x == "X" || x == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(position)
    number = position.to_i - 1
    if @cells[number] == " "
      false
    else
      true
    end
  end

  def valid_move?(number)
    num = number.to_i
    num_minus = number.to_i - 1
    if num.between?(1, 9) && @cells[num_minus] == " "
      true
    end
  end

  def update(number, player)
    num = number.to_i - 1
    @cells[num] = player.token
  end
end
