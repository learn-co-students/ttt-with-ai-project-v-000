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

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    if turn_count == 9
      true
    else
      false
    end
  end

  def turn_count
    used_cells = @cells.select{|cell|cell != " "}
    used_cells.count
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    else
      false
    end
  end


  def valid_move?(input)
    if taken?(input) == false && input.to_i > 0 && input.to_i < 10
      true
    else
      false
    end
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
    display
  end


end