class Board

  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end

  def reset!
    # new_game = Board.new
    # new_game
    @cells = Array.new(9, " ")
  end

  def empty_board(cells)
    print " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    print "-----------"
    print " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    print "-----------"
    print " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

end
