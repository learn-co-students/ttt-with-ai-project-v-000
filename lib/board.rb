class Board
  attr_accessor :cells

  #///CLASS METHODS///#
  def initialize
    @cells = Array.new(9," ")
  end

  #///INSTANCE METHODS///#
  def position(input)
    #Return the value of the position of input
    @cells[input.to_i - 1]
  end
  def reset!
    #clears Board
    @cells = Array.new(9," ")
  end
  def display
    #display Board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "

  end
  def update(input,player)
    #update the boaard at input with player token
    @cells[input.to_i - 1] = player.token
  end
  def full?
    #is board full.  Returns true or false
    @cells.all?{|cell| cell == "X" || cell == "O"}
  end
  def turn_count
    @cells.count{|cell| cell =="X" || cell == "O"}
  end
  def taken?(input)
    position(input) != " " ? true : false
  end
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
end
