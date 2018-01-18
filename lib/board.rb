class Board

  attr_accessor :cells

  def reset!
    self.cells = [' ',' ',' ',' ',' ',' ',' ',' ',' ',]
  end

  def initialize
    reset!
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def board_pos(input)
    self.cells[input]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.reject {|cell| cell == ' '}.size
  end

  # Evaluate position and return based on player input
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  # Evaluate position selected is occupied and return true|false based on array index
  def position_taken?(position)
    !(self.board.cells[position].nil? || self.board.cells[position] == " ")
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  # Check board for all spaces not occupied by X or O.
  def available_moves
    # binding.pry
    cells.each_index.select {|cell| cells[cell] == " "}
  end

  # Update board with player's move
  def update(input, player)
    # binding.pry
    input = input.to_i - 1
    self.cells[input] = player.token
  end

end
