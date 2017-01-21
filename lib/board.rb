class Board
  attr_accessor :cells

  def initialize
    reset!
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
    @cells[input.to_i-1]
  end

  def full?
    @cells.all? { |cell| cell != ' ' }
  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    return false if @cells[position.to_i - 1] == " "
    return true
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
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
