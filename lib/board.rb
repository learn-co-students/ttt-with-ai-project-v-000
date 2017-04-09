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
      if win.all? { |ind| self.cells[ind] =="X" } || win.all? { |ind|  self.cells[ind] =="O" }
        return win
      else
        return false
      end
    end
  end

  def full?
    !self.cells.any?{|i| i==" "}
  end

  def draw?
    true if !won? && full?
  end

  def over?
    true if won? || draw? || full?
  end

  def winner
    winning_combo = won?
    if winning_combo
      self.cells[winning_combo[0]]
    else
      nil
    end
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
    self.cells.each do |item|
      if(item=="O" || item=="X")
        turn+=1
      end
    end
    turn
  end

  def taken?(index)
    (position(index)=="X" || position(index)=="O")
  end

  def valid_move?(index)
    if position_on_board?(index) && !taken?(index)
      return true
    else
      return false
    end
  end

  def update(index, player)
    self.cells[index.to_i-1] = player.token
  end

  def reset!
    self.cells=Array.new(9," ")
  end

end
