class Board
  attr_accessor :cells
  @@cells=[]

  def initialize
    @@cells=[" "," "," "," "," "," "," "," "," ",]
  end

  def reset!
    @@cells.clear
    @@cells=[" "," "," "," "," "," "," "," "," ",]
  end

  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end
