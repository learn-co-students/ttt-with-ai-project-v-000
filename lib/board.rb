class Board #represents the data and logic of a Tic-tac-toe game board
  attr_accessor :cells
  #property cells that stores the data of the state of the board in an array
  @cells = []

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "------------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "------------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(user_input)
    self.cells[user_input.to_i-1]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    self.cells[(position.to_i)-1] != " "
  end

  def valid_move?(position)
    !taken?(position) && position.to_i.between?(1,9)
  end

  def update(position, player)
      self.cells[position.to_i-1] = player.token
  end

end
