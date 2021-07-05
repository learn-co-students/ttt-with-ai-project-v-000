require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
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

  def position(user_input)
    #binding.pry
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.none? {|cell| cell == " "}
  end

  def turn_count
    @cells.count {|cell| cell != " "}
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def taken?(input)
    index = input_to_index(input)
    if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(input)
    index = input_to_index(input)
    if index.between?(0, 8)
      if taken?(index + 1)
        false
      else
        true
      end
    end
  end

  def update(input, player)
    index = input_to_index(input)
    @cells[index] = player.token
  end

end
