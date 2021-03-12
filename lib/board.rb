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
 def position(input)
   cells[input.to_i-1]
 end

 def full?
  # cells.each(&.include?("X"||"O"):true))
  cells.all? do |character|
    if character == "X" || character == "O"
        true
      else
        false
      end
    end#if position is X or O then return true
  end

  def turn_count # count all of the cells that have X or O
    cells.count{|char| char == "X" || char == "O"}# cells.count("X") + cells.count("O")# cells.all.count(cells) # if its not full => the number of X or O
    # binding.pry
  end
  def taken?(input) #returns true if the positon is "X" or "O"
    position.full?(input)

  end


end
