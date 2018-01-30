require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input_to_index(input)
    @cells[index]
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    turns = 0
    @cells.each do |position|
      if position != " "
        turns += 1
      end
    end
    turns
  end

  def taken?(input)
    if @cells[input_to_index(input)] == " "
      false
    else
      true
    end
  end

  def valid_move?(input)
    if taken?(input) == false && (input == "1" ||  input == "2" || input == "3" || input == "4" || input == "5" || input == "6" || input == "7" || input == "8" || input == "9")
      true
    else
      false
    end
  end

  def update(input, player)
    if valid_move?(input)
      index = input_to_index(input)
      @cells[index] = player.token
      true
    else
      false
    end
  end

end
