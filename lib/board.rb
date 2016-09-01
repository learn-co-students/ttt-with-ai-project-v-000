class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def update(board_position, player)
    cells[board_position.to_i - 1] = player.token
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.all?{|cells| cells == "X" || cells == "O"}
  end

  def turn_count
    cells.count{|cells| cells == "X" || cells == "O"}
  end

  def taken?(board_position)
    position(board_position) == "X" || position(board_position) == "O"
  end

  def valid_move?(board_position)
    board_position.to_i.between?(1,9) && !taken?(board_position.to_i) 
  end

end
