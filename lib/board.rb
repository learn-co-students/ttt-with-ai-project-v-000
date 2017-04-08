require('pry')

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  # def won?
  #   winning_combination=nil
  #   winning_combination = WIN_COMBINATIONS.detect do |combination|
  #     self.cells[combination[0]] != " " && self.cells[combination[0]] == self.cells[combination[1]] && self.cells[combination[1]] == self.cells[combination[2]]
  #   end
  # end'def won?(board)


  # Define display_board that accepts a board and prints
  # out the current state.
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(player_input)
    self.cells[player_input.to_i-1]
  end

  def position_on_board?(player_input)
    value = player_input.scan(/[0-9]*/)[0]
    if value != ""
      array_index = value.to_i
      result = array_index.between?(1,9)
    else
      result = false
    end
  end

  def turn_count
    turn = 0
    self.cells.each do |item|
      turn+=1 if(item=="O" || item=="X")
    end
    turn
  end

  def full?
    !self.cells.any?{|i| i==" "}
  end

  def taken?(player_input)
    (position(player_input)=="X" || position(player_input)=="O")
  end

  def valid_move?(player_input)
    position_on_board?(player_input) && !taken?(player_input)
  end

  def update(player_input, player)
    self.cells[player_input.to_i-1] = player.token
  end

  def reset!
    self.cells=Array.new(9," ")
  end

end
