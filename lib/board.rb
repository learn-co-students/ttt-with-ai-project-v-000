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
    @cells[input.to_i-1]
  end

  def full?
    @cells.each { |cell| return false if cell == " " }
    return true      
  end

  def turn_count
    counter = 0
    @cells.each { |cell| counter += 1 if cell == "X" or cell == "O"}
    counter
  end

  def taken?(position)
    return false if @cells[position.to_i - 1] == " "
    return true
  end

  def valid_move?(position)
    if position.to_i < 10 && position.to_i > 0 && !taken?(position)
      return true
    else
      return false
    end
  end

  def update(position, player)
    @cells[position.to_i-1] = player.token
  end

  def get_valid_moves
    return_array = []
    @cells.each_with_index do |cell, index|
      return_array << index + 1 if cell == ' '
    end
    return_array
  end
end
