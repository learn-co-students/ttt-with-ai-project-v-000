class Board
  attr_accessor :cells, :position

  @cells = []
  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    top_row = " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    middle_row = " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    bottom_row = " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    border = "-----------"
    puts top_row, border, middle_row, border, bottom_row
  end

  def position(num)
    self.cells[num.to_i-1]
  end

  def turn_count
    count = self.cells.count {|cell| cell == "X" || cell == "O"}
    count
  end

  def full?
    if self.turn_count == 9
      true
    else
      false
    end
  end


  def taken?(num)
    if self.position(num) == "X" || self.position(num) == "O"
      true
    else
      false
    end
  end


  def valid_move?(num)
    if num.to_i.between?(1,9) && self.taken?(num) == false
      true
    else
      false
    end
  end


  def update(num, player)
    self.cells[num.to_i-1] = player.token
  end
end
