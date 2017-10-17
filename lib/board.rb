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

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? do |space|
      space == "X" ||
      space == "O"
    end
  end

  def turn_count
    counter = 0
    @cells.each do |space|
    if space == "X"
        counter += 1
      elsif space == "O"
          counter += 1
      end
    end
  return counter
  end

  def taken? (index)
    if position(index) == "X" || position(index) == "O"
      return true
    elsif position(index) == " " || ""
      return false
    end
  end

  def valid_move?(index)
    if index.to_i >= 1 && index.to_i <= 9  && taken?(index) == false
      return true
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
