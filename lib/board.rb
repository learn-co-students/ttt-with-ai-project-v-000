require 'pry'

class Board

  def initialize
    @cells = Array.new(9, " ")
    @players = []
  end

  def players
    @players
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def cells=(input)
    @cells = input
  end

  def display
    puts (" #{cells[0]} | #{cells[1]} | #{cells[2]} ")
    puts ("-----------")
    puts (" #{cells[3]} | #{cells[4]} | #{cells[5]} ")
    puts ("-----------")
    puts (" #{cells[6]} | #{cells[7]} | #{cells[8]} ")
  end

  def position(number)
    index = number.to_i - 1
    cells[index]
  end

  def update(number, player)
    index = number.to_i - 1
    cells[index] = player.token
  end

  def token

  end

  def full?
    cells.all?{|i| i != " "}
  end

  def turn_count
    count = 0
    cells.each {|i| count += 1 if i == "X" || i == "O"}
    count
  end

  def taken?(number)
    index = number.to_i - 1
    cells[index] == "X" || cells[index] == "O"
  end

  def valid_move?(number)
    index = number.to_i - 1
    if 0 <= index && index <= 8
      cells[index] == " "
    else
      false
    end
  end

end
