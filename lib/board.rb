require "pry"
class Board
  # has an attribute to store the cells of the board'
  attr_accessor :cells

  def initialize
    reset!
   end

   # can reset the state of the cells in the board
   # sets the cells of the board to a 9 element array of " "
  def reset!
    @cells = Array.new(9, " ")
  end

  # prints the board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  # takes in user input and returns the value of the board cell
  def position(input)
    index = (input.to_i)-1
    if @cells[index] !=" " ||  @cells[index] !=""
       @cells[index]
    end
  end

  # check to see if board is full, true returns full
  def full?
     @cells.none? do | position |
       position == " " || position == ""
     end
  end

  # returns the amount of turns based on cell value
  def turn_count
     counter = 0
     @cells.each do | occupied_positions |
       if  occupied_positions == "X" ||  occupied_positions =="O"
         counter+=1
       end
     end
       counter
  end

  # returns true if the position is X or O
  # returns false if the position is empty or blank
  def taken?(input)
    index = (input.to_i)-1
    if @cells[index] =="X" ||  @cells[index] =="O"
      true
    else
      false
    end
  end
  # is the position is between 1 and 9  and the position is not already  taken
  def valid_move?(input)
    index = input.to_i
    if index.between?(1,9) && !taken?(index)
      return true
     else
      return false
     end
  end
  
  # board updates when player makes a turn
  def update(input, player) # player is an rspec double here
    index = input.to_i
    @cells[index-1] = player.token
  end


end
