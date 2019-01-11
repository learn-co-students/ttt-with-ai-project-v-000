class Board
  attr_accessor :cells

  @cells = []

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(user_input)
    self.cells[user_input.to_i-1]
  end
  
  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end
  
  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end
  
  def taken?(user_input)
    user_input = user_input.to_i-1
    self.cells[user_input] == "X" || self.cells[user_input] == "O"
  end
  
  def valid_move?(user_input)
    user_input = user_input.to_i
    user_input > 0 && user_input <= 9 && !taken?(user_input)
  end
  
  def update(user_input, player)
    user_input = user_input.to_i-1
    self.cells[user_input] = player.token
  end
  
end 