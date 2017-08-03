class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display #displays board in its current state
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input) #take in player input and return contents of that position
    cells[input.to_i - 1]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    count = 0
    @cells.each {|value| value == " " ? true : count += 1}
    count
  end

  def taken?(input)
    @cells[input.to_i - 1] == " " ? false : true
  end

  def valid_move?(input)
    input = input.to_i - 1
    input <= 9 && input != "invalid" && input >= 0 && @cells[input] == " " ? true : false
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
