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
    result = input.to_i - 1
    @cells[result]
  end

  def full?
    @cells.none? {|cells_index| cells_index == " " }
  end

  def turn_count
    @cells.count do |taken|
      taken == "X" || taken == "O"
    end
  end

  def taken?(index)
    result = index.to_i - 1
    !(@cells[result].nil? || @cells[result] == " ")
  end

  def valid_move?(index)
    result = index.to_i - 1
    if taken?(index) || result.between?(0,8) == false
      return false
    else
      return true
    end
  end

  def update(index, player)
    result = index.to_i - 1
    @cells[result] = player.token
  end
end # end Board
