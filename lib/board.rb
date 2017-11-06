class Board
  attr_accessor :cells
  def initialize
    #@cells = Array.new(9," ")
    self.reset!
  end
  def reset!
    #self.cells.fill(" ")
    self.cells = Array.new(9," ")
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(square)
    self.cells[input_to_index(square)]
  end
  def full?
    self.cells.all?{|c| (c == "X" || c == "O")}
  end
  def turn_count
    #turns completed
    self.cells.count{|c| c == 'X' || c == 'O'}
  end
  def taken?(c)
    index = input_to_index(c)
    !(self.cells[index].nil? || self.cells[index] == " ")
  end
  def valid_move?(c)
    index = input_to_index(c)
    index.between?(0,8) && !taken?(c)
  end
  def update(c,player)
    index = input_to_index(c)
    self.cells[index] = player.token
  end
end
