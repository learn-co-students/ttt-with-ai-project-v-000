


class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = (Array.new(9, " "))
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(position)
    index = input_to_index(position)
    cells[index]
  end

  def full?
    @cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    index = index.to_i - 1 if index.class == String
    !(@cells[index].nil? || @cells[index] == " ")
  end

  def valid_move?(position)
    new_index = input_to_index(position)
    new_index.between?(0,8) && !taken?(new_index)
  end

  def update(position, player)
    index = input_to_index(position)
    cells[index] = player.token
  end

end
