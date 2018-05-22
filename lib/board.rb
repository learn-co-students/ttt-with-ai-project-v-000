class Board
  #cells, reset!, display, position, update, token, full?, turn_count, taken?, valid_move?
  attr_accessor :cells

  def initialize # a new board is blank, so the reset method can be called when a new board is created
    reset!
  end

  def reset!
    #@cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input) #input is a string, so has to convert to integer subtract 1 array 0
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.all? { |value| value == "X" || value == "O" }
  end

  def turn_count
    @cells.count { |c| c == "X" || c == "O"}
  end

  def taken?(user_input)
    if position(user_input) == "X" || position(user_input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1, 9) && ! taken?(user_input.to_i)
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
end
