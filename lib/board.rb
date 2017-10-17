require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(position)
    self.cells[position.to_i-1]
  end

  def full?
    self.cells.all?{|cell| cell != " " && cell != "  " && cell != ""}
  end

  def turn_count
    counter = 0
    self.cells.each do |cell|
      if cell == "X" || cell == "O"
        counter+=1
      end
    end
    counter
  end

  def taken?(position)
    self.position(position) == "X" || self.position(position) == "O"
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && self.taken?(position) == false
  end

  def update(position,player)
    self.cells[position.to_i-1] = player.token
  end

end
