class Board
  attr_accessor :cells

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
    end

  def initialize
    self.reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  #it seemed clunky trying to use this position method in #update, #taken?, and #valid_move?, so I avoided it... Try again on refactor!
  def position(input_string)
    self.cells[input_string.to_i-1]
    #All other methods will take input in the user's perspective of 1-9 strings AND USE `#POSITION` TO LOOK UP THE VALUE ACCORDING TO THE CELLS' ARRAY INDEX.
  end

  def update(input_string, player)
    self.cells[input_string.to_i-1] = player.token
  end

  #Token is set in player.rb
  #def token(object, index)
    #set the appropriate index equal to the token of the player object
  #end

  def full?
    self.cells.none?{|cell| cell == " "}
  end

  def turn_count
    counter = 0
    self.cells.each do |position|
      if position != " " && position != ""
        counter += 1
      end
    end
    counter
  end

  def taken?(position)
    !(self.cells[position.to_i-1].nil? || self.cells[position.to_i-1] == " ")
  end

  def valid_move?(position)
    !self.taken?(position) && (position.to_i).between?(1,9)
  end
end
