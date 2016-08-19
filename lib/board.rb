class Board
  attr_accessor :cells

  def initialize                 #sets the cells of the board to a 9 element array of " "
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")  #reset the state of the cells to what a board should look like at the start of a game, an array with 9 "" elements
  end

  def display                 
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(location)
     @cells[location.to_i - 1]
    # user_input.to_i - 1
  end


 def full?
    @cells.all?{|token| token == "X" || token == "O"}
  end
  

  def turn_count
    counter = 0
    @cells.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def taken?(location)
    !(position(location).nil? || position(location) == " ")
  end

end

