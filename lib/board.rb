require 'pry'
class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts     "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)

    @cells[input.to_i - 1]

  end

  def full?

    @cells.all?{|cell| cell == "O" || cell == "X"}

  end

  def turn_count

    counts = 0
    @cells.each do |position|

    counts += 1 if position == "X" || position == "O"

    end

    counts

  end

  def taken?(input)

    position(input) == "X" || position(input) == "O"

  end


  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
    # if input < "0" || input > "8"
    #   false
    # elsif taken?(input) == false
    #   true
    # else
    #   false
    # end
  end

  def update(cell, player)
    @cells[cell.to_i - 1] = player.token
  end


  def valid_move?(place)

    !taken?(place) && place.to_i.between?(1, 9)

  end

  def update(input, player)

    cells[input.to_i - 1] = player.token

  end


end
