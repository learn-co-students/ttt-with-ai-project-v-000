class Board

  attr_accessor :cells

  def initialize
    reset!
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

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    unless @cells.any? { |i| i == " " }
      true
    end
  end

  def turn_count
    i = 0
    @cells.each do |c|
      if c != " " || nil
        i +=1
      end
    end
    i
  end

  def taken?(index)
    i = index.to_i - 1
    !(@cells[i].nil? || @cells[i] == " ")
  end

  def valid_move? (index)
     i = index.to_i
     !!(i.between?(1, 9) && taken?(i) == false)
  end

  def update(cell, player)
    @cells[cell.to_i - 1] = player.token
  end


end
