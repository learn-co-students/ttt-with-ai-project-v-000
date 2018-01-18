class Board
  attr_accessor :cells
  def initialize
    self.reset!
  end

  def reset!
    self.cells=Array.new(9, " ")
  end

  def display
    board=self.cells
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

  def position(n)
    self.cells[n.to_i-1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    9 - self.cells.count(" ")
  end

  def taken?(n)
    position(n) != " "
  end

  def valid_move?(n)
    n.to_i <=9 && n.to_i >=1 && !taken?(n)
  end

  def update(n,player)
    self.cells[n.to_i-1]=player.token
  end
end
