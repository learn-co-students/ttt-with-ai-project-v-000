# class Board
#
#   attr_accessor :cells
#
#   def initialize
#     reset!
#   end
#   def reset!
#     self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#   end
#   def display
#     puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
#     puts "-----------"
#     puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
#     puts "-----------"
#     puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
#   end
#   def position(input)
#     self.cells[input.to_i - 1]
#   end
#   def full?
#     self.cells.all? do |cell|
#       cell == "X" || cell == "O"
#     end
#   end
#   def turn_count
#     self.cells.select{|c|c=="X" || c=="O"}.size
#   end
#   def taken?(input)
#     position(input) == "X" || position(input) == "O"
#   end
#   def valid_move?(input)
#     input.to_i.between?(1,9) && !taken?(input)
#   end
#   def update(input, player)
#     self.cells[input.to_i - 1] = player.token
#   end
# end
class Board
  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  def position(input)
    input = input.to_i
    cells[input - 1]
  end
  def full?
    #cells.none? {|cell| cell == " " || cell == nil}
    cells.all? {|cell|cell == "X" || cell == "O"}
  end
  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1, 9)
  end
  def update(input, player)
    input = input.to_i
    cells[input -1] = player.token
  end
end
