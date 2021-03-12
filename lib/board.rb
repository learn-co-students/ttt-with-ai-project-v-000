require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!

  end

  def reset!
    @cells= Array.new(9," ")
  end

  def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "-----------"
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
   puts "-----------"
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    self.cells[user_input.to_i-1]
  end

  def full?
    # cells.each(&.include?("X"||"O"):true))
    self.cells.all? do |char|
      if char == "X" || char == "O"
          true
      else
          false
      end
    end#if position is X or O then return true
  end



  def turn_count # count all of the cells that have X or O
    self.cells.count("X") + self.cells.count("O")# cells.count("X") + cells.count("O")# cells.all.count(cells) # if its not full => the number of X or O
  end

  def taken?(position) #returns true if the positon is "X" or "O"
    self.cells[position.to_i-1] == "X" ||self.cells[position.to_i-1] == "O"
  end

  def valid_move?(position) #returns true for user input 1-9 that is NOT take
    position.to_i.between?(1,9) && !taken?(position)
  end

  def update(position,player) #gets the users input "X" or "O"
    self.cells[position.to_i-1] = player.token
  end



end
