class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  #display prints the board

  def display
    puts " #{self.cells[0]} " + "|" + " #{self.cells[1]} " + "|" + " #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} " + "|" + " #{self.cells[4]} " + "|" + " #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} " + "|" + " #{self.cells[7]} " + "|" + " #{self.cells[8]} "
  end

  #position takes in user input and returns the value of the board cell

  def position(input)
    self.cells[input.to_i - 1]
  end

  #full? returns true for a full board

  def full?
    !self.cells.include?(' ')
  end

  #turn_count returns the amount of turns based on cell value

  def turn_count
    counter = 0
    self.cells.each {|position| counter += 1 unless position == " "}
    counter
  end

  #taken? returns true if the position is X or O

  def taken?(input)
    self.position(input) != " "? true : false
  end

  #valid_move? returns true for user input between 1-9 that is not taken

  def valid_move?(input)
    !self.taken?(input) && input.to_i.between?(1,9)? true : false
  end

  #update updates the cells in the board with the player token according to the input

  def update(num, player)
    self.cells[num.to_i - 1] = player.token
  end


end
