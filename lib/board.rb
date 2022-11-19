class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    full_board = @cells.all? do |space|
      space == "X" || space == "O"
    end
    full_board
  end

  def turn_count
      @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    number = index.to_i - 1
    !(@cells[number].nil? || @cells[number] == " " || @cells[number] == "")
  end

  def valid_move?(move)
    location = move.to_i
    if taken?(location) || location < 1 || location > 9
      false
    else
      true
    end
  end

  def update(cell, player)
    position = cell.to_i - 1
    @cells[position] = player.token
  end

end
