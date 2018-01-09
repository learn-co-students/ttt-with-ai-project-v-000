class Board
  attr_accessor :cells, :board, :token

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize(board = nil)
    @cells = board || Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i-1
    @cells[index]
  end

  def full?
    !@cells.any? {|index| index == " "}
  end

  def turn_count
    @cells.count {|token| token != " "}
  end

  def taken?(position)
    if @cells[position.to_i-1] != " " && @cells[position.to_i-1] != ""
      true
    else
      false
    end
  end

  def valid_move?(position)
    if (position.to_i-1).between?(0,8) && !taken?(position)
      true
    else
      false
    end
  end

  def update(position, player)
    cells[position.to_i-1] = player.token
  end
end
