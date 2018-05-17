require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def index(input)
    input.to_i - 1
  end

  def position(input)
    self.cells[index(input)] if input.to_i.between?(1,9)
  end

  def full?
    self.cells.any? {|space| space == " "} ? false : true
  end

  def turn_count
    count = 0
    self.cells.each do |space|
      if space == "O" || space == "X"
        count += 1
      end
    end
    count
  end

  def taken?(input)
    if position(input) == "O" || position(input) == "X"
       true
     else
       false
     end
  end

  def valid_move?(input)
    true if input.to_i.between?(1,9) && taken?(input) == false

  end

  def update(input,player)

    if valid_move?(input)
      self.cells[index(input)] = player.token
    end
  end

end
