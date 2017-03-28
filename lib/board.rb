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

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    unless @cells.any? { |cell| cell == " "}
      true
    end
  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O"}
  end

  def taken?(user_input)
    index = user_input.to_i - 1
    @cells[index] == "X" || @cells[index] == "O"
  end

  def valid_move?(user_input)
    index = user_input.to_i
    index.between?(1, 9) && !taken?(user_input)
  end

  def update(position, player)
    index = position.to_i - 1
    @cells[index] = player.token
  end

end
