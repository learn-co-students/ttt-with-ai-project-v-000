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
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.each do |i|
      if i == "" || i == " "
        return false
      end
    end
    return true
  end

  def turn_count
    turns = 0
    @cells.each do | xoro |
      if xoro == "X" || xoro == "O"
        turns += 1
      end
    end
    turns
  end

  def taken?(index)
    character = @cells[index.to_i - 1]
    if character == "X" || character == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)

    int_index = index.to_i - 1

    if 0 <= int_index && int_index <= 8
      within_index = true
    else
      within_index = false
    end

    if taken?(index) == true
      occupied = true
    else
      occupied = false
    end

    if within_index == true && occupied == false
      true
    else
      false
    end

  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end
end
