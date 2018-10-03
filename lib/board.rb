class Board
  
  attr_accessor
  
  @@cells = Array.new(9, " ")
  
  def reset!
    @@cells.clear
  end
  
  def initialize(@@cells = nil)
    @display = display || Array.new(9, " ")
    self.reset!
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position(input)
    input.to_i - 1
  end
  
  def update
end