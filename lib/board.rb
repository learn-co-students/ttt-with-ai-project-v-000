class Board

  attr_accessor :cells

  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = Array.new(9, " ")
    @cells
  end

def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end


  def position(number)
    self.cells[number.to_i - 1]
  end

  def full?
    return true if self.cells.none? { |position| position == " " }
  end

  def turn_count
  self.cells.select {|position| position != " "}.count
  end

  def taken?(number)
    if self.position(number) == "X" || self.position(number) == "O"
      return true
      else false
    end
  end

  def valid_move?(number)
    number = number.to_i
    if number != 1..9
      return false
      elsif
      self.taken?(number) == true
      return false
      else
      return true
    end
  end

   def update(number, player)
     self.cells[number.to_i - 1] = player.token
   end


end