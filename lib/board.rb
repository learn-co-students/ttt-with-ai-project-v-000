class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]# is the board

  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]

  end

  def display

    print " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    print "-----------"
    print " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    print "-----------"
    print " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "

  end

  def position(move) # takes user input of 1-9 string form
    self.cells[move.to_i - 1]
  end

  def update(move,user)
    if self.valid_move?(move)
      self.cells[move.to_i - 1] = user.token 
    end


  end

  def full?
    self.cells.none? {|block| block == " "}
  end

  def turn_count
    self.cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(move)
    if self.cells[move.to_i - 1] == " "
      false
    else
      true
    end
  end

  def valid_move?(move)
    if move.to_i > 0 && move.to_i < 10 && !self.taken?(move)
      true
    else
      false
    end
  end

end
