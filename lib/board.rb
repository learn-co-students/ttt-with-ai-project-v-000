class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset! # why do we need to force a reset?
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full? # question mark returns T or F, cells contain a space and are not Nil.
    cells.all? do |char|
      if char == "X" or char == "O"
          true
        else
          false
      end
    end
  end

  def turn_count
    cells.count{|char| char =="X" || char =="O"}
  end

  def taken?(input) ##helper method
    position(input)=="X" || position(input)=="O"
  end


  def valid_move?(input) # returns true for user input between 1-9 that is not taken
    input.to_i.between?(1,9) && !taken?(input)# use 1-9 this is user raw data not index
  end

  def update(input, player) # updates the cells in the board with the move the player has made
    cells[input.to_i-1] = player.token #represents X or O
  end
#?? token comes from the tests
end
