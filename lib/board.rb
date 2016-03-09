class Board

  attr_accessor :cells

  def initialize()
    #set attribute :cells 
    #equal to our 'board' array with 9 empty spaces
    @cells = Array.new(9," ")
  end

  def reset!
    #instance method to reset as new 'board' array with 9 empty spaces
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(location)
    self.cells[location.to_i - 1]  
  end
  
  def full?
    #instance method that checks each 'board' array position
    #to be either an "X" or "O token"
    #returns true, otherwise false
    self.cells.all? {|position| position == "X" || position == "O"}
  end

  def turn_count
    #instance method that counts each 'board' array position
    #adding only those that are either "X" or "O token"
    #returns sum
    self.cells.count {|position| position == "X" || position == "O"}
  end

  def taken?(position)
    #instance method that checks that returns 'true'
    #when 'board' array position has "X" or "O"
    #(code is negation of nil or " " blank space)
    !(self.cells[position.to_i - 1] == nil || self.cells[position.to_i - 1] == " ")
  end

  def valid_move?(position)
    #instance method that returns true
    #if position is between 1 - 9
    #and the space is free
    position.to_i.between?(1,9) && !self.taken?(position)
  end

  def update(position, player)
    #sets the 'board' position equal to the player's instance variable 'token'
    #unless the position is invalid (i.e., not 1-9 or taken)
    self.cells[position.to_i - 1] = player.token unless !self.valid_move?(position)
  end

end
