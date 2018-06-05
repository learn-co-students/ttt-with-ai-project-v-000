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
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i-1]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    @cells[(position.to_i)-1] != " "
  end

  def valid_move?(position)
    !taken?(position) && position.to_i.between?(1,9)
  end

end
