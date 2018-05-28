class Board
  attr_accessor :cells


  def initialize
    @cells = Array.new(9, " ")

  end

  def reset!

    @cells =  Array.new(9, " ")
  end

  def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    a = input.to_i - 1
    @cells[a]
  end

  def full?
    self.cells.all?{|a| a == "X" || a == "O"}

  end

  def turn_count
    self.cells.count{|a| a == "X" || a =="O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(input,player)
    a = input.to_i - 1
    @cells[a] = player.token
  end




end
