class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    num = input.to_i
    num = num -1
    @cells[num]
  end

  def full?
    @cells.include?(" ") ? false : true
  end #full?

  def turn_count
    turns = 0
    @cells.each{|cell| cell == "O" || cell == "X" ? turns += 1 : turns += 0}
    turns
  end

  def valid_input?(input)
    int = input.to_i
    int.between?(1, 9) ? true : false
  end

  def taken?(position)
    int = position.to_i - 1

    @cells[int] == "X" || @cells[int] == "O" ? true : false
  end #taken?


  def valid_move?(input)
    integer = input.to_i
    valid_input?(input) && !taken?(input) ? true : false
  end

  def update(input, player)
    index = input.to_i - 1
    @cells[index] = player.token
  end

end # class Board
