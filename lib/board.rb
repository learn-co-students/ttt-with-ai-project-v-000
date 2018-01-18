require('pry')

class Board
  attr_accessor :cells

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    reset!
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all? { |ind| cells[ind] =="X" } || win.all? { |ind|  cells[ind] =="O" }
        return win
      end
    end
    false
  end

  def full?
    !self.cells.any?{|i| i==" "}
  end

  def draw?
    !won? && full?
  end

  def winner
    won? ? self.cells[winning_combo[0]] : nil
  end

  # Define display_board that accepts a board and prints
  # out the current state.
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(index)
    self.cells[index.to_i-1]
  end

  def position_on_board?(index)
    index.to_i.between?(1,9)
  end

  def turn_count
    turn=0
    self.cells.each { |item| turn+=1 if(item=="O" || item=="X")}
    turn
  end

  def taken?(index)
    (position(index)=="X" || position(index)=="O")
  end

  def valid_move?(index)
    position_on_board?(index) && !taken?(index)
  end

  def update(index, player)
    self.cells[index.to_i-1] = player.token
  end

  def reset!
    self.cells=Array.new(9," ")
  end

end
