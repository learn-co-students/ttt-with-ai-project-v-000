require 'pry'

class Board
  attr_accessor :cells, :the_player

  def initialize
    @cells = Array.new(9, " ")
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

  def position(input)
    @cells[input.to_i - 1]
  end
  
  def full?
    @cells.include?(" ") ? false : true
  end
  
  def turn_count
    turns = 0 
    @cells.each do |cell| 
      if cell != " " 
        turns += 1 #counting number of input
      end 
    end
    turns
  end
  
  def taken?(spot)
    self.position(spot) == " " ? false : true
    #line 21 for #position
  end
  
  def valid_move?(spot)
    spot.to_i.between?(1,9) && self.position(spot) == " " ? true : false
  end 
  
  def update(spot, player)
    self.cells[spot.to_i-1] = player.token
  end
end
# binding.pry
