require 'pry'

class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9," ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? do |complete|
    complete != " "
    end
  end

  def turn_count
    count = 0
  @cells.each do |turn|
    if turn == "X" || turn == "O"
      count += 1
    end
  end
  count
  end

  def taken?(input)
    if @cells[input.to_i - 1] == " " || @cells[input.to_i - 1] == "" || @cells[input.to_i - 1] == nil
      false
    else
      true
    end
  end

  def valid_move?(input)
    if !taken?(input.to_i) && input.to_i.between?(1,9)
      true
    else
      false
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end


end
