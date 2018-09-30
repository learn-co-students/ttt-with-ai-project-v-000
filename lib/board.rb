require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells=[" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells.clear
    @cells=[" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_num)
    @cells[user_num.to_i - 1]
  end

  def full?
    is_full = [0,1,2,3,4,5,6,7,8].all? do |each_space|
      !(@cells[each_space].nil? || @cells[each_space] == " ")
    end
  end

  def turn_count
    count = 0
    @cells.each do |this_space|
      if this_space == "X" || this_space == "O"
        count += 1
      end
    end
    return count
  end

  def taken?(square_num)
    if @cells[square_num.to_i-1] == "X" || @cells[square_num.to_i-1] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    index = index.to_i - 1
    return_val  = index.between?(0,8) && !taken?(index+1)
    return_val
  end

  def update(cell_no, player)
    cell_no = cell_no.to_i - 1
    @cells[cell_no] = player.token
  end

end
