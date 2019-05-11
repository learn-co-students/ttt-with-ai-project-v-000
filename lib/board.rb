require 'pry'


class Board
  attr_accessor :cells


  def initialize
    reset!
  end


  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------" 
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "-----------"
  end
  
  def position(input)
    #look up the value according to the cells' array index
    cells[input.to_i-1]
  end
  
  def full?
    if cells.all?{|character| character == "X" || character == "O"}
      true
    else
      false
    end
  end
  
  def turn_count
    #how many positions in cells array are filled
    cells.count { |character| character == "X" || character == "O"}
  end

  def taken?(input)
    #returns true or false for a position
    if position(input) == "X"|| position(input) == "O"
      true
    else !(position(input) == "X"|| position(input) == "O")
      false
    end
  end

  def valid_move?(input)
    #ensures that moves are between 1-9 and not taken(i.e. available)
    input.to_i.between?(1,9) && taken?(input) == false
  end

  def update(input, player)
    # represents updating the board when player makes a move
    #position user wants to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index
    #player object of who's making the move
    #update the token method of the player - call it with name space Players::Human or Players::Computer

    cells[input.to_i-1] = player.token
  end 
  
  
  # def token
  #   #invoked when saving the update method
    # update.save
  # end
end