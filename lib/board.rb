class Board
  attr_accessor :cells

  @cells = Array.new(9, " ")

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  #-----puts out board with positions-----#
  def initial_display
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end

  #-----prints out board----#
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  #-----returns the value of a position----#
  def position(num)
    cells[num.to_i - 1]
  end

  #-----checks for open spaces/" "-----#
  def full?
    !cells.include?(" ")
  end

  #-----counts cells containing markers-----#
  def turn_count
    cells.select {|m| m != " "}.count
  end

  #-----checks numbered position for !" "-----#
  def taken?(num)
    cells[num.to_i - 1] == "X" || cells[num.to_i - 1] == "O" ? true : false
  end

  #-----is the position taken? and within the range of the board?-----#
  def valid_move?(num)
    !taken?(num) && num.to_i.between?(1,9)
  end

  #-----updates chosen position with player's token-----#
  def update(num, player)
   cells[num.to_i - 1] = player.token
  end

end