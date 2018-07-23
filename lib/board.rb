class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def full?
    result = @cells.detect do |position|
      position == " "
    end
    if result == nil
      true
    else
      false
    end
  end

  def position(number_as_string)
    position = number_as_string.to_i
    index = position - 1
    @cells[index]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def taken?(pos_as_string)
    position = pos_as_string.to_i
    index = position - 1
    if @cells[index] == "X" || @cells[index] == "O"
      true
    else
      false
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

  def update(pos_as_string, player)
    @cells[pos_as_string.to_i - 1] = player.token
  end

  def valid_move?(pos_as_string)
    position = pos_as_string.to_i
    index = position - 1

    if taken?(pos_as_string) || !index.between?(0,8)
      false
    else
      true
    end
  end
end
