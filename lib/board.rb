class Board
attr_accessor :cells

  def initialize
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end

  def reset!
    @cells =[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i-1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    blank_spaces = self.cells.select {|cell| cell == " " }
    9-blank_spaces.length
  end


  def taken?(input)
    self.cells[input.to_i-1] == "X" || self.cells[input.to_i-1] == "O"
  end

  def valid_move?(input)
    if input.to_i >0 && input.to_i <10
    !self.taken?(input)
    else
    return false
    end
  end

  def update(input, player)
    if valid_move?(input)
      self.cells[input.to_i-1]=player.token
    end

  end

end
