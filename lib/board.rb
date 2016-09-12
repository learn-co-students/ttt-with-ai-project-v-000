class Board
  attr_accessor :cells

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def initialize
    reset!
  end

  def display
    a = taken?("1") ? cells[0] : "1"
    b = taken?("2") ? cells[1] : "2"
    c = taken?("3") ? cells[2] : "3"
    d = taken?("4") ? cells[3] : "4"
    e = taken?("5") ? cells[4] : "5"
    f = taken?("6") ? cells[5] : "6"
    g = taken?("7") ? cells[6] : "7"
    h = taken?("8") ? cells[7] : "8"
    i = taken?("9") ? cells[8] : "9"
    puts " #{a} | #{b} | #{c} "
    puts "-----------"
    puts " #{d} | #{e} | #{f} "
    puts "-----------"
    puts " #{g} | #{h} | #{i} "
  end

  def position(input_string)
    cells[input_string.to_i-1]
  end

  def update(input_string, player)
    cells[input_string.to_i-1] = player.token
  end

  def full?
    cells.none?{|cell| cell == " "}
  end

  def turn_count
    cells.count {|cell| cell != " "}
  end

  def taken?(input_string)
    position(input_string) != " "
  end

  def valid_move?(input_string)
    !taken?(input_string) && (input_string.to_i).between?(1,9)
  end

end
