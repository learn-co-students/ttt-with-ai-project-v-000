class Board

  attr_accessor :cells

  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    row0 = " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    row1 = " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    row2 = " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    lines = '-----------'
    spaces = '           '
    puts row0, lines, row1, lines, row2, spaces
  end

  def position(user_input)
    num = user_input.to_i - 1
      self.cells[num]
  end

  def full?
    switch = true
    self.cells.each {|item| item != " " ? switch : switch = false}
    switch
  end

  def turn_count
    count = 0
    self.cells.each {|item| item != " " ? count += 1 : count}
    count
  end

  def taken?(location)
    self.cells[location.to_i - 1] == " " ? false : true
  end

  def valid_move?(move)
    move = move.to_i
    move < 10 && move > 0 && taken?(move) == false ? true : false
  end

  def update(position, xoro)
    self.cells[position.to_i - 1] = xoro.token
  end

end
