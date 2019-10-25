class Board
  attr_accessor :cells, :display, :position, :turn_count, :update
  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  # def full?(board)
  #   board.all?{|token| token == "X" || token == "O"}
  # end
  # def full?
  #   !cells.include?(" ")
  # end

  def turn_count
    @cells.count {|turn| turn == "X" || turn == "O"}
  end

  def taken?(board_cell)
    if position(board_cell)  == "X" || position(board_cell)  == "O"
      true
    else
      false
    end
  end

  def valid_move?(board_cell)
    board_cell.to_i.between?(1, 9) && !taken?(board_cell)
  end

  def update(board_cell, player)
    if valid_move?(board_cell)
      board_cell = board_cell.to_i-1
      cells[board_cell] = player.token
    end
  end

end
