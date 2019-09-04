class Board

  attr_accessor :cells

  # Creates a new board with 9 blank cells.
  def initialize
    @cells = Array.new(9, " ")
  end

  # Reset the state of the cells to what a board looks like at the start of a game,
  # an array with 9 " " elements.
  def reset!
    self.cells = Array.new(9, " ")
  end

  # Print the current state of the board.
  def display
    puts "\n GAME BOARD "
    puts "   Turn #{turn_count}"
    puts "*************"
    puts "* #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} *"
    puts "*-----------*"
    puts "* #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} *"
    puts "*-----------*"
    puts "* #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} *"
    puts "*************\n\n"
  end

  # Takes user input and returns value of cell at that position.
  def position(input)
    self.cells[input.to_i - 1]
  end

  # True if board is entirely occupied with X's and O's.
  def full?
    !self.cells.include?(" ")
  end

  # Returns how many positions are taken.
  def turn_count
    self.cells.count { |cell| cell == "X" || cell == "O"}
  end

  # True if a position on the board is already occupied.
  def taken?(input)
    position(input) == " " ? false : true
  end

  # True if user input is between 1 and 9 and the space is not taken.
  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9)
  end

  # Updates the board when a player makes a valid_move by
  # setting the cell of the user's move to the value of their token.
  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end
  
end # end class Board
