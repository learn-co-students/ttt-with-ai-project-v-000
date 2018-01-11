class Board
#=================properties===================
  attr_accessor :cells
#=================intialize====================
  def initialize
    self.cells = Array.new(9, " ")
  end
#=================helpers======================
  def board
    cells
  end

  def tru(pos)
    pos.to_i-1
  end
#=================instance=====================
  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} \n-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def position(pos)
    board[tru(pos)]
  end

  def full?
    board.none?{|p| p == " "}
  end

  def turn_count
    board.select{|p| p != " "}.count
  end

  def taken?(pos)
    board[tru(pos)] != " "
  end

  def valid_move?(pos)
    tru(pos).between?(0,8) && !taken?(pos)
  end

  def update(pos,char)
    board[tru(pos)] = char.token
  end
#==============================================
end
