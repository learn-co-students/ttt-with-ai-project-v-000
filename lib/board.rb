class Board
  attr_accessor :cells

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset! 
  end

  # def display_board(board)
  #   puts " #{board[0]} | #{board[1]} | #{board[2]} "
  #   puts "-----------"
  #   puts " #{board[3]} | #{board[4]} | #{board[5]} "
  #   puts "-----------"
  #   puts " #{board[6]} | #{board[7]} | #{board[8]} "
  # end

end
