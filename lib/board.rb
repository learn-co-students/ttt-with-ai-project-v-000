class Board
  attr_accessor :cells

  def initialize
    #creates an empty board
    self.reset!
  end

  def reset! #reset the state of the cells on the board
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts " "
  end

  def position(input) #return the value at the array position
    self.cells[input.to_i - 1 ]
  end

  def update(position,player) #updates the board when a player makes a move
    #When you update the appropriate index in @cells, you will set it equal to the token of the player
    self.cells[position.to_i - 1] = player.token
  end

  def token
  end

  def full?#return true if every cell has an X or O and no " "
    true if !(self.cells.include?(" "))

  end

  def turn_count#return how many turns have occurred, based on how many cells have X or O
    full_positions = self.cells.find_all do |element|
      element != " "
    end
    full_positions.size
  end

  def taken?(input)#return true if an individual position on the board is occupied
    if position(input) == " " #if what is ast the position does not equal " ", then true
      false
    else
      true
    end
  end

  def valid_move?(input)#returns true if the move is valid (between 1-9 and not take)
    move = input.to_i
    if (1..9).include?(move) && taken?(input) == false
      true
    else
      false
    end
  end


end
