class Board
  attr_accessor :cells

  def initialize
    reset! # the #reset! method will run when object gets instantiated and clear the []
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1] # takes input from user and inserts it into the cells index
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token # assigns "X" or "O" from player to corresponding index in the cells' []
  end

  def full?
    turn_count == 9 # calls #turn_count and checks if cells [] contains 9 elements
  end

  def turn_count
    cells.count { |cell| cell != " " } # counts how many elements in the cells [] are != " "
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O" #calls #position method and returns "X" or "O"
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input) # checks if input is between 1 and 9 and not taken
  end

end
