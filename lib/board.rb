class Board
 
  attr_accessor :cells 

 
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def reset!(cells = nil)
    @cells = Array.new(9, " ")
  end
 


  def initialize(cells = nil)
    @cells = cells || Array.new(9, " ")
  end
 

 
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(location)
    @cells[location.to_i - 1]
  end

  def full? 
  @cells.all?{|token| token == "X" || token == "O"}
  end

 def turn_count
  @cells.count{|token| token == "X" || token == "O"}
end


def taken?(location)
    !(position(location).nil? || position(location) == " ")

end

 def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input.to_i)
  end


def update(input, player)
 cells[input.to_i-1] = player.token
 
end


 

 



 
end# class