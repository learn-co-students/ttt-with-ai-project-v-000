class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    @cells[position.to_i - 1]
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

  def full?
    #@cells.count {|token| token == "X" || token == "O"} == 9 ? true : false
    #refactored to:
    !@cells.any? {|position| position == " "}
    
    #can also do:
    #@cells.all?{|i| i == "X" || i == "O"}
  end

  def turn_count
    @cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(position)
    position(position) == "X" || position(position) == "O"
    
    #the following works also:
    #(@cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position) ? true : false
  end

end