require 'pry'

class Board
  attr_accessor :cells

  def initialize(cells = nil)
    @cells = cells || Array.new(9, " ")
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(move)
    move = input_to_index(move)
    @cells[move]
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def full?
    @cells.include?(" ") == false
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      counter += 1 if cell != " "
    end
    counter
  end

  def taken?(move)
    move = input_to_index(move)
    if @cells[move] == " "
      false
    elsif @cells[move] == ""
      false
    elsif @cells[move] == nil
      false
    else
      true
    end
  end

  def valid_move?(move)
    if taken?(move)
      false
    elsif input_to_index(move) > 8
      false
    elsif input_to_index(move) < 0
      false
    else
      true
    end
  end

  def update(move, player)
    @cells[input_to_index(move)] = player.token
  end

end
