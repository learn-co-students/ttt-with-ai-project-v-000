class Board

  attr_accessor :cells

  def initialize
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #reset method
  end

  def reset!
    cells.clear
    cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display #prints current state
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input) #takes in user's input 1-9 (as strings), looks up value of cells at correct index from the arrays perspective (0-8)
    cells[input.to_i - 1]
  end

  def update(input, player) #represents updating board when player makes a move. 2 arguments, position player wants to occupy and player object. set updated index to token of player object
    cells[input.to_i - 1] = player.token
  end

  #def token (index)
    #cells[index] = token
  #end

  def full? #when entirely occupied
    cells.all?{|square| square != " " }
  end

  def turn_count #based on how many positions in the cells array are filled
    cells.count{|square| square != " " }
  end

  def taken?(input) #returns true or false for an individual person
    cells[input.to_i - 1] != " "
  end

  def valid_move?(input) #ensures move is between 1-9 and not taken
    !taken?(input) && input.to_i.between?(1,9)
  end
end
