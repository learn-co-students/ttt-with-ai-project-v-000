require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # Commented out 8 & 9 and replaced with line 6. Not sure I need 8 & 9 anymore.
    #@cells = []
    #self.reset!
  end

  def reset!  #resets cells of the board to a 9 element array of " "
    @cells.replace([" ", " ", " ", " ", " ", " ", " ", " ", " "]) #refactorMe
  end

  def display
    puts " " + @cells[0] + " | " + @cells[1] + " | " + @cells[2] + " "
    puts "-----------"
    puts " " + @cells[3] + " | " + @cells[4] + " | " + @cells[5] + " "
    puts "-----------"
    puts " " + @cells[6] + " | " + @cells[7] + " | " + @cells[8] + " "
  end

  def position(user_input)  # takes in user input and returns the value of the board cell
    self.cells[(user_input.to_i) - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    count = 0
    self.cells.each do |cell|
      if cell != " "
        count += 1
      end
    end
    count
  end

  def taken?(position)
    if @cells[position.to_i - 1] == "X"
      true
    elsif @cells[position.to_i - 1] == "O"
      true
    else
      false
    end
  end

  def valid_move?(user_input)
    if taken?(user_input)
      false
    elsif !(1..9).include?(user_input.to_i)
      false
    else
      true
    end
  end

  def update(position, player)
    @cells[position.to_i-1] = "#{player.token}"
  end
end
