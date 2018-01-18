require 'pry'
class Board
  attr_accessor :cells, :board, :token

# Board object = #<Board:0x000000018f0d30 @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]>
# Each method calls on the board object and analyzes it based on an input

  def initialize
    @cells = Array.new(9, " ")
    #create the board self and populates the @cells
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    #self = #<Board:0x000000018f0d30 @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]>
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    "#{@cells[position.to_i-1]}"
  end

  def full?
    @cells.all?{|positions| positions == "X" || positions == "O"}
  end

  def turn_count
    @cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(input)
    if self.position(input) == "X" || self.position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?( input)
    input = input.to_i
    input.between?(1,9) && !self.taken?(input)
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
  end

end
